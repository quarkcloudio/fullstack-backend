<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use App\User;
use App\Models\Area;
use App\Models\Picture;
use App\Models\Sms;
use App\Models\File;
use Gregwar\Captcha\CaptchaBuilder;
use Gregwar\Captcha\PhraseBuilder;
use OSS\OssClient;
use OSS\Core\OssException;
use Session;
use Cache;

class ToolController extends BaseController
{
    /**
     * 全国地区
     * @param  integer
     * @return string
     */
    public function area(Request $request)
    {
        $pid = $request->input('pid',null);
        $areas = Area::where('pid',$pid)->get()->toArray();

        return $this->success('获取成功！','',$areas);
    }

    /**
     * 图形验证码
     * @param  integer
     * @return string
     */
    public function captcha()
    {
        $phrase = new PhraseBuilder;
        // 设置验证码位数
        $code = Helper::makeRand(4);
        // 生成验证码图片的Builder对象，配置相应属性
        $builder = new CaptchaBuilder($code, $phrase);
        // 设置背景颜色
        $builder->setBackgroundColor(220, 210, 230);
        $builder->setMaxAngle(0);
        $builder->setMaxBehindLines(0);
        $builder->setMaxFrontLines(0);
        // 可以设置图片宽高及字体
        $builder->build($width = 100, $height = 40, $font = null);
        Session::put('captcha', $builder->getPhrase());  //将图形验证码的值写入到session中
        return response($builder->output())->header('Content-type','image/jpeg');
    }

    /**
     * 发送邮件
     * @param  integer
     * @return string
     */
    public function email(Request $request)
    {
        $email = $request->input('email');

        if(empty($email)) {
            return $this->error('邮箱不能为空！');
        }

        $title = Helper::config('WEB_SITE_NAME').'账号激活';

        $url = url('tool/emailActivate');

        $content = '请打开如下链接激活'.Helper::config('WEB_SITE_NAME').'账号：'.$url.'。如非本人操作，请忽略。';

        Helper::sendEmail($title,$email,$content);

        if($result) {
            return $this->success('邮件已发送，请注意查收！');
        } else {
            return $this->error('邮件发送失败！');
        }
    }

    /**
     * 邮箱激活
     * @param  integer
     * @return string
     */
    public function emailActivate(Request $request)
    {
        $token  = $request->input('token');
        $uid    = $request->input('uid');

        $getData = Cache::pull('change_email_uid'.$uid);
        if(empty($getData)) {
            echo '链接已过期！';
            die();
        }

        if(empty($getData['token']) || $getData['token']!==$token) {
            echo '参数错误！';
        }

        $data['email'] = $getData['email'];

        $result = User::where('id',$uid)->update($data);

        if($result) {
            echo '邮箱已经重置，请重新登录！';
            die();
        } else {
            echo '邮箱重置失败！';
            die();
        }
    }

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
    public function uploadPicture(Request $request)
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
    public function uploadPictureFromBase64(Request $request)
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

        if($ossOpen == 'on') {
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
     * 二维码
     * @param  integer
     * @return string
     */
    public function qrcode(Request $request)
    {
        $text = $request->input('text');
        if(empty($text)) {
            return '参数错误！';
        }
        Helper::createQrCode($text);
    }

    /**
     * 发送短信验证码
     * @param  integer
     * @return string
     */
    public function sms(Request $request)
    {
        $phone = $request->input('phone');
        $captcha = $request->input('captcha');
        $type = $request->input('type');
        $getCaptcha = Session::get('captcha');

        // 暂时关掉图形验证码
        // if (empty($captcha) || ($captcha != $getCaptcha)) {
        //     return $this->error('验证码错误！');
        // }

        if(empty($phone)) {
            return $this->error('手机号不能为空！');
        }

        if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
            return $this->error('手机号格式不正确！');
        }

        $sms = Sms::where('phone',$phone)
        ->orderBy('id', 'desc')
        ->first();

        // 每隔60秒才能发送短信
        if(!empty($sms)) {
            if((time() - strtotime($sms->created_at)) < 60 ) {
                return $this->error('抱歉，您短信发送过于频繁！');
            }
        }

        $sendDayCount = Sms::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->where('phone',$phone)->count();

        // 每天最多发送15条短信
        if($sendDayCount >15) {
            return $this->error('抱歉，每个手机号一天最多获取十五条短信！');
        }

        // 生成验证码
        $code = Helper::makeRand();
        $content = '验证码：'.$code.'，请及时输入完成验证。如非本人操作，请忽略。';

        switch ($type) {
            case 'sioo': // 希奥发送短信验证码
                $result = Helper::siooSendSms($phone,$content);
                break;
            
            default: // 默认阿里大鱼短信验证码
                $templateCode = Helper::config('ALIDAYU_TEMPLATE_CODE');
                $smsParam = [ 'code' => $code];
                $result = Helper::alidayuSendSms($templateCode,$phone,$smsParam);
                break;
        }

        $data['phone'] = $phone;
        $data['code'] = $code;
        $data['content'] = $content;

        if($result) {
            $data['status'] = 1;
            Sms::create($data);
            return $this->success('短信已发送，请注意查收！');
        } else {
            $data['status'] = 2;
            Sms::create($data);
            return $this->error('短信发送失败！');
        }
    }

    /**
     * git自动部署
     * @param  integer
     * @return string
     */
    public function git(Request $request)
    {

        $version = $request->input('version');

        if(empty($version)) {
            return $this->error('版本错误！');
        }

        print '当前用户：'.shell_exec('whoami').'<br>';

        // '2>$1' 配置管道输出错误，方便调试
        // 这里已经配置了上面coding仓库的remote，并且-u 绑定了默认remote，所以直接使用'git pull'
        $command = 'cd ' . str_replace('\\', '/\\', base_path()) . ' & git pull origin '.$version.' 2>&1';
  
        $status = shell_exec($command);
  
        print $status;
    }

    /**
     * 清空缓存
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function clearCache(Request $request)
    {
        Helper::clearCache();
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

    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
    * 错误时返回json数据
    * @author tangtanglove <dai_hang_love@126.com>
    */
    public function error($msg,$url = '')
    {
        $result['msg'] = $msg;
        $result['url'] = $url;
        $result['status'] = 'error';
        return Helper::unsetNull($result);
    }

    /**
    * 成功是返回json数据
    * @author tangtanglove <dai_hang_love@126.com>
    */
    public function success($msg,$url ='',$data = '',$count = 0,$status = 'success')
    {
        $result['msg'] = $msg;
        $result['url'] = $url;
        $result['data'] = $data;
        $result['count'] = $count;
        $result['status'] = $status;
        return Helper::unsetNull($result);
    }

    /**
     * 上传附件
     *
     * @param  Request  $request
     * @return Response
     */
    public function uploadFile(Request $request)
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
                $result = $this->ossUploadFile($request);
                break;
            
            default:

                // 默认本地上传
                $result = $this->localUploadFile($request);
                break;
        }

        return $result;
    }

    /**
     * 本地上传文件
     *
     * @param  Request  $request
     * @return Response
     */
    protected function localUploadFile($request)
    {
        $file = $request->file('file');
        $uid  = $request->input('uid');
        $md5  = md5_file($file->getRealPath());
        $name = $file->getClientOriginalName();

        $hasFile = File::where('md5',$md5)->where('name',$name)->first();

        // 不存在文件，则插入数据库
        if(empty($hasFile)) {

            $path = $file->store('public/uploads/files');

            // 获取文件url，用于外部访问
            $url = Storage::url($path);

            // 获取文件大小
            $size = Storage::size($path);

            // 数据
            $data['uid'] = $uid;
            $data['name'] = $name;
            $data['size'] = $size;
            $data['md5'] = $md5;
            $data['path'] = $path;

            // 插入数据库
            $file = File::create($data);
            $fileId = $file->id;
        } else {
            $fileId = $hasFile->id;

            if(strpos($hasFile->path,'http') !== false) { 
                $url = $hasFile->path;
            } else {
                // 获取文件url，用于外部访问
                $url = Storage::url($hasFile->path);
            }

            // 获取文件大小
            $size = $hasFile->size;
        }

        $result['id'] = $fileId;
        $result['uid'] = $uid;
        $result['name'] = $name;
        $result['url'] = asset($url);
        $result['size'] = $size;

        // 返回数据
        return $this->success('上传成功！','',$result);
    }

    /**
     * 阿里云OSS上传文件
     *
     * @param  Request  $request
     * @return Response
     */
    protected function ossUploadFile($request)
    {
        $file = $request->file('file');
        $uid  = $request->input('uid');

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

        $object = 'files/'.Helper::makeRand(40,true).'.'.$file->getClientOriginalExtension();
        $content = file_get_contents($file->getRealPath());

        $md5 = md5($content);
        $name = $file->getClientOriginalName();

        // 判断文件是否已经上传
        $hasFile = File::where('md5',$md5)->where('name',$name)->first();

        // 不存在文件，则插入数据库
        if(empty($hasFile)) {

            // 上传到阿里云
            try {
                $ossResult = $ossClient->putObject($bucket, $object, $content);
            } catch (OssException $e) {
                $ossResult = $e->getMessage();
                // 返回数据
                return $this->error('上传失败！');
            }

            // 数据
            $data['uid'] = $uid;
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
            $file = File::create($data);
            $fileId = $file->id;

            // 获取文件url，用于外部访问
            $url = $data['path'];

            // 获取文件大小
            $size = $ossResult['info']['size_upload'];
        } else {
            $fileId = $hasFile->id;

            if(strpos($hasFile->path,'http') !== false) { 
                $url = $hasFile->path;
            } else {
                // 获取文件url，用于外部访问
                $url = Storage::url($hasFile->path);
            }

            // 获取文件大小
            $size = $hasFile->size;
        }

        $result['id'] = $fileId;
        $result['uid'] = $uid;
        $result['name'] = $name;
        $result['url'] = $url;
        $result['size'] = $size;

        // 返回数据
        return $this->success('上传成功！','',$result);
    }

}