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

class AuthController extends Controller
{
    /**
     * 授权方法
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $targetUrl   = $request->input('targetUrl');

        $app = Factory::officialAccount(Helper::wechatConfig());
        $oauth = $app->oauth;

        $user = auth('wechat')->user();
        // 未登录
        if (empty($user)) {
            Session::put('target_url', $targetUrl);
            return $oauth->redirect();
        }
    }

    /**
     * 授权回调方法
     *
     * @return \Illuminate\Http\Response
     */
    public function callback()
    {
        $app = Factory::officialAccount(Helper::wechatConfig());
        $oauth = $app->oauth;

        // 获取 OAuth 授权结果用户信息
        $user = $oauth->user();

        $wechatUser = $user->toArray();

        // 定义对象
        $query = User::query();

        $wechatOpenid = $wechatUser['original']['openid'];
        $query = $query->where('wechat_openid', $wechatOpenid);

        if(isset($wechatUser['original']['unionid'])) {
            $wechatUnionid = $wechatUser['original']['unionid'];
            $data['wechat_unionid'] = $wechatUnionid;
            $query = $query->orWhere('wechat_unionid', $wechatUnionid);
        }

        $userInfo = $query->first();

        if(empty($userInfo)) {
            // 赋值
            $wechatNickname = Helper::filterEmoji($wechatUser['nickname']);
            $wechatSex  = $wechatUser['original']['sex'];
            $wechatAvatar  = $wechatUser['avatar'];

            // 组合数组
            $data['wechat_openid'] = $wechatOpenid;
            $data['nickname'] = $wechatNickname;
            $data['sex'] = $wechatSex;
            $data['cover_id'] = $wechatAvatar;

            $data['password'] = bcrypt(env('APP_KEY'));
            $data['money'] = 0;
            $data['point'] = 0;
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');

            $uid = User::insertGetId($data);
            if($uid) {
                $updateData['name'] = Helper::createRand().'-ID'.$uid;
                User::where('id',$uid)->update($updateData);
            } else {
                return false;
            }

            $wechatUser['uid'] = $uid;
        } else {
            $wechatUser['uid'] = $userInfo->id;
        }

        // 快捷登录
        Auth::guard('wechat')->loginUsingId($wechatUser['uid']);

        // 储存当前登录用户openid
        Session::put('wechatUser', $wechatUser);

        $targetUrl = Session::get('target_url');

        // 跳转
        if($targetUrl) {
            return redirect(url($targetUrl));
        }
    }
}
