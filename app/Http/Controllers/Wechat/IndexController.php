<?php

namespace App\Http\Controllers\Wechat;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PostCate;
use App\Models\Post;
use App\Models\PostRelationships;
use App\Services\Helper;
use EasyWeChat\Foundation\Application;
use DB;

class IndexController extends CommonController
{

    public function index()
    {
        $jsApi = '';

        // 微信中登录认证
        if(isset($_SERVER['HTTP_USER_AGENT'])) {
            if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
                $app = new Application(Helper::wechatConfig());
                $js = $app->js;
                $jsApi = $js->config(array('onMenuShareTimeline','onMenuShareAppMessage'));
            }
        }
        return view('wechat/index/index',compact('jsApi'));
    }
}