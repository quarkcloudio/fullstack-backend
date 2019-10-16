<?php

namespace App\Http\Controllers\MiniProgram\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use EasyWeChat\Factory;
use DB;

class IndexController extends Controller
{

    public function index()
    {
        $jsApi = '';
        if(Helper::isWechat()) {
            $app = Factory::officialAccount(Helper::wechatConfig());
            $jsApi = $app->jssdk->buildConfig(array('onMenuShareTimeline','onMenuShareAppMessage'), $debug = false, $beta = false, $json = true);    
        }

        $data['jsApi'] = $jsApi;
        return view('wechat/index/index',$data);
    }
}