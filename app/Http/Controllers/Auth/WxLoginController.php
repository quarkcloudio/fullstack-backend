<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Services\Helper;
use App\Models\User;
use App\Models\ActionLog;
use EasyWeChat\Factory;

class WxLoginController extends Controller
{
    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/index';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * 用户退出方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function logout()
    {
        $result = Auth::logout();

        if($result !== false) {
            return $this->success('已退出！');
        } else {
            return $this->error('错误！');
        }
    }

    /**
     * 授权方法
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $targetUrl   = $request->input('targetUrl');

        $app = Factory::officialAccount(Helper::wechatConfig());
        $oauth = $app->oauth;

        $user = Auth::user();
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
        $wechatUser = $oauth->user()->toArray();

        // 定义对象
        $query = User::query()->where('wechat_openid', $wechatUser['original']['openid']);

        if(isset($wechatUser['original']['unionid'])) {
            $query->orWhere('wechat_unionid', $wechatUser['original']['unionid']);
        }

        $user = $query->first();

        if(empty($user)) {

            // 组合数组
            $data['username'] = Helper::makeRand(8) . '-' . time(); // 临时用户名
            $data['email'] = Helper::makeRand(8) . '-' . time(); // 临时邮箱
            $data['phone'] = Helper::makeRand(8) . '-' . time(); // 临时手机号
            $data['nickname'] = Helper::filterEmoji($wechatUser['nickname']);
            $data['sex'] = $wechatUser['original']['sex'];
            $data['password'] = bcrypt(env('APP_KEY'));

            // 将微信头像保存到服务器
            $avatarInfo = Helper::uploadPictureFromUrl($wechatUser['avatar']);

            if($avatarInfo['status'] == 'error') {
                return $avatarInfo;
            }

            $data['avatar'] = $avatarInfo['data']['id'];
            $data['wechat_openid'] = $wechatUser['original']['openid'];
            
            if(isset($wechatUser['original']['unionid'])) {
                $data['wechat_unionid'] = $wechatUser['original']['unionid'];
            }
            $data['last_login_ip'] = Helper::clientIp();
            $data['last_login_time'] = date('Y-m-d H:i:s');

            $uid = User::insertGetId($data);

            if(empty($uid)) {
                return $this->error('创建用户错误！');
            }

            $updateData['phone'] = $updateData['email'] = $updateData['username'] = Helper::makeRand(8) . '-' . $uid;

            $updateResult = User::where('id',$uid)->update($updateData);

            if(empty($updateResult)) {
                return $this->error('更新临时用户名错误！');
            }

        } else {

            // 存在则登录
            $uid = $user['id'];
        }

        // 快捷登录
        Auth::loginUsingId($uid);

        $targetUrl = Session::get('target_url');
        // 跳转
        if($targetUrl) {
            return redirect(url($targetUrl));
        }
    }

    /**
     * 微信账号绑定WEB注册账号
     */
    public function bindAccount(Request $request)
    {
        $uid = auth('web')->user()->id;
        // post请求返回数据
        if($request->isMethod('post')) {
            $phone = $request->input('phone');

            if(empty($phone)) {
                return $this->error('请填写手机号！');
            }

            $hasPhone = User::where('phone',$phone)->first();

            if($hasPhone) {
                return $this->error('此手机号已经注册过了！');
            }

            $data['phone'] = $phone;
            $result = User::where('id',$uid)->update($data);

            if($result) {
                return $this->success('绑定成功！');
            } else {
                return $this->error('错误！');
            }
        } else {
            $user = User::where('id',$uid)->first();
            return view('wechat/user/bindAccount',compact('user'));
        }
    }

    /**
     * 绑定手机号
     */
    public function bindPhone(Request $request)
    {
        $uid = auth('web')->user()->id;
        // post请求返回数据
        if($request->isMethod('post')) {
            $phone = $request->input('phone');

            if(empty($phone)) {
                return $this->error('请填写手机号！');
            }

            $hasPhone = User::where('phone',$phone)->first();

            if($hasPhone) {
                return $this->error('此手机号已经注册过了！');
            }

            $data['phone'] = $phone;
            $result = User::where('id',$uid)->update($data);

            if($result) {
                return $this->success('绑定成功！');
            } else {
                return $this->error('错误！');
            }
        } else {
            $user = User::where('id',$uid)->first();
            return view('wechat/user/bindPhone',compact('user'));
        }
    }
}
