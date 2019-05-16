<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use App\User;
use App\Models\Picture;
use OSS\OssClient;
use OSS\Core\OssException;
use Session;
use Cache;

class PictureController extends Controller
{
    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function index(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Picture::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['name'])) {
                $query->where('name','like','%'.$search['name'].'%');
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('sort', 'desc')
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            // 获取文件url，用于外部访问
            if(strpos($value['path'],'http') !== false) {
                $lists[$key]['path'] = $value['path'];
            } else {
                $lists[$key]['path'] = '//'.$_SERVER['HTTP_HOST'].Storage::url($value['path']);
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        // 模板数据
        $data['lists'] = Helper::listsFormat($lists);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 编辑图片
     *
     * @param  Request  $request
     * @return Response
     */
    public function edit(Request $request)
    {
        $id = $request->input('id');

        $picture = $result = Picture::find($id);

        return view('admin/plugin/picture/edit',compact('picture','id'));
    }

    /**
     * 保存编辑图片
     *
     * @param  Request  $request
     * @return Response
     */
     public function save(Request $request)
     {
 
        if(Helper::getConfig('OSS_OPEN') == 'on') {
            $this->error('云存储暂不此操作！');
        }

         $formData = Input::all();
         $imgId = $formData['imgId'];
 
         // 原图高度
         $imgNaturalWidth = $formData['imgNaturalWidth'];
         $imgNaturalHeight = $formData['imgNaturalHeight'];
 
         // 原图基础上的偏移量
         $imgX = $formData['imgX'];
         $imgY = $formData['imgY'];
 
         // 翻转
         $imgScaleX = $formData['imgScaleX'];
         $imgScaleY = $formData['imgScaleY'];

         // 原图基础上的裁剪框大小
         $cropW = $formData['width'];
         $cropH = $formData['height'];
 
         // 旋转度
         $rotate = $formData['rotate'];
 
         // 缩放大小
         $imgW = $formData['imgWidth'];
         $imgH = $formData['imgHeight'];
 
         $picture = Picture::where('id',$imgId)->first();
 
         $image = \think\Image::open(storage_path('app/').$picture->path);

         // 获取图片类型
         $type = $image->type();

         // 图片旋转
         $image->rotate($rotate);

         // 裁剪图片
         $image->crop(round($cropW), round($cropH), round($imgX), round($imgY));

         // 生成缩略图
         $image->thumb(round($cropW*($imgW/$imgNaturalWidth)), round($cropH*($imgH/$imgNaturalHeight)));

         // X轴反转
         if($imgScaleX == -1) {
            $image->flip(\think\image::FLIP_X);
         }

         // y轴反转
         if($imgScaleY == -1) {
            $image->flip(\think\image::FLIP_Y);
         }

         $image->save(storage_path('app/') . $picture->path,$type,100);
         
         // 更新MD5
         $data['md5'] = md5_file(storage_path('app/').$picture->path);
         Picture::where('id',$imgId)->update($data);
         if ($image) {
             return $this->success('操作成功！');
         } else {
             return $this->error('操作失败！');
         }
     }

    /**
     * 更新显示图片
     *
     * @param  Request  $request
     * @return Response
     */
    public function update(Request $request)
    {
        if(Helper::getConfig('OSS_OPEN') == 'on') {
            $this->error('云存储暂不此操作！');
        }

        $id = $request->input('id');
        $file = $request->file('file');
        $path = $file->store('public/uploads/pictures');
        if(!empty($path)) {
            $md5 = md5_file(storage_path('app/').$path);
            $name = $file->getClientOriginalName();

            // 数据
            $data['name'] = $name;
            $data['md5'] = md5_file(storage_path('app/').$path);
            $data['path'] = $path;

            // 更新数据库
            Picture::where('id',$id)->update($data);
            // 获取文件url，用于外部访问
            $url = Storage::url($path);
            // 返回数据
            return $this->success('上传成功！','',$url);
        } else {
            return $this->error('上传失败！');
        }
    }

    /**
     * 删除单个数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function destroy(Request $request)
    {
        $id = $request->json('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $result = Picture::destroy($id);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = Picture::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变单个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    // public function changeStatus(Request $request)
    // {
    //     $id = $request->input('id');
    //     $status = $request->input('status');
    //     $picture = Picture::find($id);

    //     if($status == -1) {
    //         $result = Picture::destroy($id);

    //         // 阿里云存储
    //         if(strpos($picture->path,'http') !== false) {
    //             $accessKeyId = Helper::getConfig('OSS_ACCESS_KEY_ID');
    //             $accessKeySecret = Helper::getConfig('OSS_ACCESS_KEY_SECRET');
    //             $endpoint = Helper::getConfig('OSS_ENDPOINT');
    //             $bucket = Helper::getConfig('OSS_BUCKET');

    //             $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

    //             $path = explode('/',$picture->path);
    //             $count = count($path);
    //             $object = $path[$count-2].'/'.$path[$count-1];
                
    //             $ossClient->deleteObject($bucket, $object);
    //         } else {
    //             Storage::delete(storage_path('app/').$picture->path);
    //         }
    //     }

    //     if ($result) {
    //         return $this->success('操作成功！');
    //     } else {
    //         return $this->error('操作失败！');
    //     }
    // }

    /**
     * 改变多个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    // public function changeMultiStatus(Request $request)
    // {
    //     $data = $request->input('data');
    //     $status = $request->input('status');

    //     foreach (json_decode($data,true) as $key => $value) {
    //         if (isset($value['id'])) {
    //             $ids[] = $value['id'];
    //         } elseif(isset($value)) {
    //             $ids[] = $value;
    //         }
    //     }

    //     $pictures = Picture::whereIn('id',$ids)->get();

    //     if($status == -1) {
    //         $result = Picture::destroy($ids);
    //         foreach ($pictures as $key => $picture) {

    //             // 阿里云存储
    //             if(strpos($picture->path,'http') !== false) {
    //                 $accessKeyId = Helper::getConfig('OSS_ACCESS_KEY_ID');
    //                 $accessKeySecret = Helper::getConfig('OSS_ACCESS_KEY_SECRET');
    //                 $endpoint = Helper::getConfig('OSS_ENDPOINT');
    //                 $bucket = Helper::getConfig('OSS_BUCKET');

    //                 $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

    //                 $path = explode('/',$picture->path);
    //                 $count = count($path);
    //                 $object = $path[$count-2].'/'.$path[$count-1];
                    
    //                 $ossClient->deleteObject($bucket, $object);
    //             } else {
    //                 Storage::delete(storage_path('app/').$picture->path);
    //             }
    //         }
    //     }

    //     if ($result) {
    //         return $this->success('操作成功！');
    //     } else {
    //         return $this->error('操作失败！');
    //     }
    // }

    /**
     * url访问图片
     * @param  integer
     * @return string
     */
    public function getPicture(Request $request)
    {
        $id = $request->input('id');
        $width = $request->input('w',100);
        $height = $request->input('h',100);
        
        if(empty($id)) {
            $this->error('参数错误！');
        }

        if(Helper::config('OSS_OPEN') == 'on') {
            $this->error('云存储暂不此操作！');
        }

        $picture = Picture::where('id',$id)->first();
 
        if(!empty($picture)) {
            $imagePath = storage_path('app/').$picture->path;
            $getPath = Helper::createThumb($imagePath,'',$width,$height,1);

            $fileContent = file_get_contents($getPath);
            $fileMime    = Helper::detectFileMimeType($getPath);
            return response($fileContent, '200')->header('Content-Type', $fileMime);
        }
    }

    /**
     * 上传图片
     *
     * @param  Request  $request
     * @return Response
     */
    public function upload(Request $request)
    {
        $ossOpen = Helper::config('OSS_OPEN');

        if($ossOpen == 'on') {
            $driver = 'oss';
        } else {
            $driver = 'local';
        }

        switch ($driver) {
            case 'oss':

                // 阿里云上传
                $result = $this->ossUpload($request);
                break;
            
            default:

                // 默认本地上传
                $result = $this->localUpload($request);
                break;
        }

        return $result;
    }

    /**
     * 上传图片
     *
     * @param  Request  $request
     * @return Response
     */
    public function uploadFromBase64(Request $request)
    {
        $file = $request->input('file');

        $fileArray = explode(',',$file);

        if(empty($fileArray)) {
            return $this->error('格式错误！');
        }

        $fileHeader = $fileArray[0];
        $fileBody   = $fileArray[1];

        switch ($fileHeader) {
            case 'data:image/jpg;base64':
                $fileType = '.jpg';
                break;
            case 'data:image/jpeg;base64':
                $fileType = '.jpeg';
                break;
            case 'data:image/png;base64':
                $fileType = '.png';
                break;
            case 'data:image/jpe;base64':
                $fileType = '.jpe';
                break;
            case 'data:image/gif;base64':
                $fileType = '.gif';
                break;
            case 'data:image/bmp;base64':
                $fileType = '.bmp';
                break;
            default:
                return $this->error('只能上传jpg,jpeg,png,jpe,gif,bmp格式图片');
                break;
        }

        // 图片名称
        $name = Helper::makeRand(40,true).$fileType;

        $ossOpen = Helper::config('OSS_OPEN');

        if($ossOpen == 1) {
            $driver = 'oss';
        } else {
            $driver = 'local';
        }

        switch ($driver) {
            case 'oss':

                // 阿里云上传
                $accessKeyId = Helper::config('OSS_ACCESS_KEY_ID');
                $accessKeySecret = Helper::config('OSS_ACCESS_KEY_SECRET');
                $endpoint = Helper::config('OSS_ENDPOINT');
                $bucket = Helper::config('OSS_BUCKET');
                // 设置自定义域名。
                $myDomain = Helper::config('OSS_MYDOMAIN');
        
                try {
                    $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
        
                    // 如果设置自定义域名
                    if(!empty($myDomain)) {
                        // 查看CNAME记录。
                        $cnameConfig = $ossClient->getBucketCname($bucket);
        
                        $hasCname = false;
                        foreach ($cnameConfig as $key => $value) {
                            if($value['Domain'] == $myDomain) {
                                $hasCname = true;
                            }
                        }
        
                        // 未添加CNAME记录，则程序自动添加
                        if($hasCname === false) {
                            // 添加CNAME记录。
                            $ossClient->addBucketCname($bucket, $myDomain);
                        }
                    }
        
                } catch (OssException $e) {
                    print $e->getMessage();
                }
        
                $object = 'pictures/'.$name;
                $content = base64_decode($fileBody);
        
                // 上传到阿里云
                try {
                    $ossResult = $ossClient->putObject($bucket, $object, $content);
                } catch (OssException $e) {
                    $ossResult = $e->getMessage();
                    // 返回数据
                    return $this->error('上传失败！');
                }
    
                // 数据
                $data['name'] = $name;
                $data['size'] = $ossResult['info']['size_upload'];
                $data['md5'] = md5($content);
    
                // 设置自定义域名，则文件url执行自定义域名
                if(!empty($myDomain)) {
                    $data['path'] = str_replace($bucket.'.'.$endpoint,$myDomain,$ossResult['info']['url']);
                    $data['path'] = str_replace('http','https',$data['path']);
                
                } else {
                    $data['path'] = $ossResult['info']['url'];
                    $data['path'] = str_replace('http','https',$data['path']);
                }
    
                // 插入数据库
                $picture = Picture::create($data);
                $pictureId = $picture->id;
    
                // 获取文件url，用于外部访问
                $url = $data['path'];
    
                // 获取文件大小
                $size = $ossResult['info']['size_upload'];
        
                $result['id'] = $pictureId;
                $result['name'] = $name;
                $result['url'] = $url;
                $result['size'] = $size;
        
                break;
            
            default:

                // 默认本地上传
                $uploadPath = 'uploads/pictures/'.$name;
                $getResult = Storage::disk('public')->put($uploadPath,base64_decode($fileBody));
                
                if($getResult) {
                    $path = 'public/'.$uploadPath;

                    // 数据
                    $data['name'] = $name;
                    $data['md5'] = md5_file(storage_path('app/').$path);
                    $data['path'] = $path;

                    // 插入数据库
                    $picture = Picture::create($data);
                    $pictureId = $picture->id;

                    // 获取文件url，用于外部访问
                    $url = Storage::url($path);

                    // 获取文件大小
                    $size = Storage::size($path);

                    $result['id'] = $pictureId;
                    $result['name'] = $name;
                    $result['url'] = asset($url);
                    $result['size'] = $size;

                } else {
                    return $this->error('上传失败！');
                }

                break;
        }

        // 返回数据
        return $this->success('上传成功！','',$result);
    }

    /**
     * 本地上传图片
     *
     * @param  Request  $request
     * @return Response
     */
    protected function localUpload($request)
    {
        $file = $request->file('file');
        $md5 = md5_file($file->getRealPath());
        $name = $file->getClientOriginalName();

        $hasPicture = Picture::where('md5',$md5)->where('name',$name)->first();

        // 不存在文件，则插入数据库
        if(empty($hasPicture)) {

            $path = $file->store('public/uploads/pictures');

            // 获取文件url，用于外部访问
            $url = Storage::url($path);

            // 获取文件大小
            $size = Storage::size($path);

            // 数据
            $data['name'] = $name;
            $data['size'] = $size;
            $data['md5'] = $md5;
            $data['path'] = $path;

            // 插入数据库
            $picture = Picture::create($data);
            $pictureId = $picture->id;
        } else {
            $pictureId = $hasPicture->id;

            if(strpos($hasPicture->path,'http') !== false) { 
                $url = $hasPicture->path;
            } else {
                // 获取文件url，用于外部访问
                $url = Storage::url($hasPicture->path);
            }

            // 获取文件大小
            $size = $hasPicture->size;
        }

        $result['id'] = $pictureId;
        $result['name'] = $name;
        $result['url'] = asset($url);
        $result['size'] = $size;

        // 返回数据
        return $this->success('上传成功！','',$result);
    }

    /**
     * 阿里云OSS上传
     *
     * @param  Request  $request
     * @return Response
     */
    protected function ossUpload($request)
    {
        $file = $request->file('file');

        $accessKeyId = Helper::config('OSS_ACCESS_KEY_ID');
        $accessKeySecret = Helper::config('OSS_ACCESS_KEY_SECRET');
        $endpoint = Helper::config('OSS_ENDPOINT');
        $bucket = Helper::config('OSS_BUCKET');
        // 设置自定义域名。
        $myDomain = Helper::config('OSS_MYDOMAIN');

        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

            // 如果设置自定义域名
            if(!empty($myDomain)) {
                // 查看CNAME记录。
                $cnameConfig = $ossClient->getBucketCname($bucket);

                $hasCname = false;
                foreach ($cnameConfig as $key => $value) {
                    if($value['Domain'] == $myDomain) {
                        $hasCname = true;
                    }
                }

                // 未添加CNAME记录，则程序自动添加
                if($hasCname === false) {
                    // 添加CNAME记录。
                    $ossClient->addBucketCname($bucket, $myDomain);
                }
            }

        } catch (OssException $e) {
            print $e->getMessage();
        }

        $object = 'pictures/'.Helper::makeRand(40,true).'.'.$file->getClientOriginalExtension();
        $content = file_get_contents($file->getRealPath());

        $md5 = md5($content);
        $name = $file->getClientOriginalName();

        // 判断文件是否已经上传
        $hasPicture = Picture::where('md5',$md5)->where('name',$name)->first();

        // 不存在文件，则插入数据库
        if(empty($hasPicture)) {

            // 上传到阿里云
            try {
                $ossResult = $ossClient->putObject($bucket, $object, $content);
            } catch (OssException $e) {
                $ossResult = $e->getMessage();
                // 返回数据
                return $this->error('上传失败！');
            }

            // 数据
            $data['name'] = $name;
            $data['size'] = $ossResult['info']['size_upload'];
            $data['md5'] = $md5;

            // 设置自定义域名，则文件url执行自定义域名
            if(!empty($myDomain)) {
                $data['path'] = str_replace($bucket.'.'.$endpoint,$myDomain,$ossResult['info']['url']);
                $data['path'] = str_replace('http','https',$data['path']);
            } else {
                $data['path'] = $ossResult['info']['url'];
                $data['path'] = str_replace('http','https',$data['path']);
            }

            // 插入数据库
            $picture = Picture::create($data);
            $pictureId = $picture->id;

            // 获取文件url，用于外部访问
            $url = $data['path'];

            // 获取文件大小
            $size = $ossResult['info']['size_upload'];
        } else {
            $pictureId = $hasPicture->id;

            if(strpos($hasPicture->path,'http') !== false) { 
                $url = $hasPicture->path;
            } else {
                // 获取文件url，用于外部访问
                $url = Storage::url($hasPicture->path);
            }

            // 获取文件大小
            $size = $hasPicture->size;
        }

        $result['id'] = $pictureId;
        $result['name'] = $name;
        $result['url'] = $url;
        $result['size'] = $size;

        // 返回数据
        return $this->success('上传成功！','',$result);
    }
}