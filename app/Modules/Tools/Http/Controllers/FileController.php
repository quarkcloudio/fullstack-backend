<?php

namespace App\Modules\Tools\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\Models\File;
use OSS\OssClient;
use OSS\Core\OssException;

class FileController extends Controller
{
    /**
     * 上传附件
     *
     * @param  Request  $request
     * @return Response
     */
    public function uploadFile(Request $request)
    {
        $ossOpen = Helper::getConfig('OSS_OPEN');

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
     * 本地上传文件
     *
     * @param  Request  $request
     * @return Response
     */
    protected function localUpload($request)
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
    protected function ossUpload($request)
    {
        $file = $request->file('file');
        $uid  = $request->input('uid');

        $accessKeyId = Helper::getConfig('OSS_ACCESS_KEY_ID');
        $accessKeySecret = Helper::getConfig('OSS_ACCESS_KEY_SECRET');
        $endpoint = Helper::getConfig('OSS_ENDPOINT');
        $bucket = Helper::getConfig('OSS_BUCKET');
        // 设置自定义域名。
        $myDomain = Helper::getConfig('OSS_MYDOMAIN');

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
