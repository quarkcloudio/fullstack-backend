<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Services\Helper;
use Illuminate\Http\Request;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
    * 错误时返回json数据
    * @author tangtanglove <dai_hang_love@126.com>
    */
    public function error($msg,$url = '')
    {
        $request = new Request;

        if($request->ajax() || $this->isApi()) {
            $result['msg'] = $msg;
            $result['url'] = $url;
            $result['status'] = 'error';
            return Helper::unsetNull($result);
        } else {
            $result['status'] = 'error';
            $result['msg'] = $msg;
            $result['url'] = $url;
            echo view('jump',$result);
            die();
        }
    }

    /**
    * 成功是返回json数据
    * @author tangtanglove <dai_hang_love@126.com>
    */
    public function success($msg,$url ='',$data = '',$pagination = [],$search = [],$status = 'success')
    {
        $request = new Request;

        if($request->ajax() || $this->isApi()) {
            $result['msg'] = $msg;
            $result['url'] = $url;
            $result['data'] = $data;
    
            if(count($pagination)>0) {
                $result['pagination'] = $pagination;
            }
    
            if(count($search)>0) {
                $result['search'] = $search;
            }
            $result['status'] = $status;
            return Helper::unsetNull($result);
        } else {
            $result['status'] = $status;
            $result['msg'] = $msg;
            $result['url'] = $url;
            echo view('jump',$result);
            die();
        }
    }

    // 判断是否为api访问
    protected function isApi()
    {
        $getRequest = request()->route()->getAction();
        if($getRequest['middleware'][0] === 'api') {
            return true;
        } else {
            return false;
        }
    }
}
