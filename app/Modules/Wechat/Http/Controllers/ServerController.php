<?php

namespace App\Http\Controllers\Wechat;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\User;
use DB;
use Session;
use Illuminate\Support\Facades\Auth;

class ServerController extends Controller
{
    /**
     * token
     *
     * @return \Illuminate\Http\Response
     */
    public function token(Request $request)
    {

        $type = $request->get('type');

        switch ($type) {
            case 'dyh':
                // 这里使用的是订阅号
                $app = Factory::officialAccount(Helper::wechatConfig('dyh'));
                break;
            case 'fwh':
                // 这里使用的是服务号
                $app = Factory::officialAccount(Helper::wechatConfig('fwh'));
                break;
            default:
                $app = Factory::officialAccount(Helper::wechatConfig('fwh'));
                break;
        }

        // 从项目实例中得到服务端应用实例。
        $app->server->push(function ($message) {

            $openid = $message['FromUserName']; // 用户的 openid

            switch ($message['MsgType']) {
                case 'event':
                    switch ($message['Event']) {
                        case 'subscribe':
                            return "欢迎关注微信公众平台！";
                            break;
                        case 'CLICK':
                            return $this->menuClick($message);
                            break;
                        default:
                            # code...
                            break;
                    }
                    break;
                case 'text':
                    $content = $message['Content'];
                    if($content == 'test') {
                        return "ok";
                    }

                    break;
                default:
                    return "欢迎关注微信公众平台！";
                    break;
            }
        });

        $response = $app->server->serve();

        return  $response;
    }

    // 菜单按钮事件
    public function menuClick($message)
    {
        $eventKey = $message['EventKey'];
        $openid = $message['FromUserName']; // 用户的 openid
        switch ($eventKey) {
            case 'test':
                return "敬请期待！";
                break;
            default:
                # code...
                break;
        }
    }
}
