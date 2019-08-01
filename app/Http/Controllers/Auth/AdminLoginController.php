<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Services\Helper;
use App\Models\Admin;
use App\Models\ActionLog;
use Laravel\Passport\Client;
use Gregwar\Captcha\CaptchaBuilder;
use Gregwar\Captcha\PhraseBuilder;

class AdminLoginController extends Controller
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
        $this->middleware('guest:admin', ['except' => 'logout']);
    }

    /**
     * 用户退出方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function logout(Request $request)
    {
        // 得到认证凭据
        $authorization = $request->header('Authorization');

        // 分割出token
        $token = explode(' ',$authorization);

        // 删除认证缓存
        cache([$token[1] => null]);

        // 同时退出登录
        $result = Auth::guard('admin')->logout();

        if($result !== false) {

            return $this->success('已退出！');
        } else {
            return $this->error('错误！');
        }
    }

    /**
     * 登录方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function login(Request $request)
    {
        $type = $request->json('type');

        switch ($type) {
            case 'account':

                // 账号登录
                $loginResult = $this->accountLogin($request);
                break;
            case 'mobile':

                // 手机登录
                $loginResult = $this->mobileLogin($request);
                break;
            default:

                // 账号登录
                $loginResult = $this->accountLogin($request);
                break;
        }

        if ($loginResult['status'] === 'success') {

            $data['msg'] = '登录成功';
            $data['status'] = 'success';
            $data['type'] = $type;
            $data['id'] = $loginResult['data']['id'];
            $data['username'] = $loginResult['data']['username'];
            $data['nickname'] = $loginResult['data']['nickname'];
            $data['currentAuthority'] = 'admin';
            $data['token'] = $loginResult['data']['token'];

            return $data;
        } else {

            $data['msg'] = $loginResult['msg'];
            $data['status'] = 'error';
            $data['type'] = $type;

            return $data;
        }

    }

    /**
     * 账号登录方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    protected function accountLogin($request)
    {
        $username = $request->json('username');
        $password = $request->json('password');
        $captcha = $request->json('captcha');

        $getCaptcha = cache('adminCaptcha');
        if(empty($captcha) || ($captcha != $getCaptcha)) {
            return $this->error('验证码错误！');
        }

        if(empty($username)) {
            return $this->error('用户名不能为空！');
        }

        if(empty($password)) {
            return $this->error('密码不能为空！');
        }

        $loginResult = Auth::guard('admin')->attempt(['username' => $username, 'password' => $password]);

        if($loginResult) {

            $user = Auth::guard('admin')->user();

            if($user['status'] !== 1) {
                return $this->error('用户被禁用！');
            }

            // 更新登录信息
            $data['last_login_ip'] = Helper::clientIp();
            $data['last_login_time'] = date('Y-m-d H:i:s');
            Admin::where('id',$user->id)->update($data);

            // 记录日志
            $log['action'] = '管理员登录';
            $log['type'] = 'ADMIN';
            $log['remark'] = Auth::guard('admin')->user()->username.'登录后台';
            Helper::actionLog($log);

            $result['id'] = $user->id;
            $result['username'] = $user->username;
            $result['nickname'] = $user->nickname;
            $result['token'] = $user->createToken('FullStack')->accessToken;

            // 将认证信息写入缓存，这里用hack方法做后台api登录认证
            cache([$result['token'] => $result],60*60*3);

            return $this->success('登录成功！','',$result);
        } else {

            // 记录登录日志
            $log['action'] = $username.'LOGIN_ERROR';
            $log['type'] = 'ADMIN';
            $log['remark'] = '管理员'.$username.'尝试登录出错！';
            Helper::actionLog($log);

            // 清除验证码
            cache(['adminCaptcha'=>null],60*10);

            return $this->error('用户名或密码错误！');
        }
    }

    /**
     * 手机登录方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    protected function mobileLogin($request)
    {
        $phone = $request->json('phone');
        $code = $request->json('code');

        if(empty($phone)) {
            return $this->error('手机号不能为空！');
        }

        if(empty($code)) {
            return $this->error('短信验证码不能为空！');
        }

        $validateStatus = Helper::validateSmsCode($phone,$code);

        if($validateStatus['status'] !== 'success') {
            return $this->error($validateStatus['msg']);
        }

        $getPhone = Admin::where('phone',$phone)->first();

        if(empty($getPhone)) {
            return $this->error('无此用户！');
        } else {
            $uid = $getPhone->id;
        }

        // 通过uid登录
        $loginResult = Auth::guard('admin')->loginUsingId($uid);

        if($loginResult) {

            $user = Auth::guard('admin')->user();

            // 更新登录信息
            $data['last_login_ip'] = Helper::clientIp();
            $data['last_login_time'] = date('Y-m-d H:i:s');
            Admin::where('id',$user->id)->update($data);

            // 记录日志
            $log['action'] = '管理员登录';
            $log['type'] = 'ADMIN';
            $log['remark'] = Auth::guard('admin')->user()->username.'登录后台';
            Helper::actionLog($log);

            $result['id'] = $user->id;
            $result['username'] = $user->username;
            $result['nickname'] = $user->nickname;
            $result['token'] = $user->createToken('FullStack')->accessToken;

            // 将认证信息写入缓存，这里用hack方法做后台api登录认证
            cache([$result['token'] => $result],60*60*3);

            return $this->success('登录成功！','',$result);
        } else {

            // 记录登录日志
            $log['action'] = $phone.'LOGIN_ERROR';
            $log['type'] = 'ADMIN';
            $log['remark'] = '管理员'.$phone.'尝试登录出错！';
            Helper::actionLog($log);

            return $this->error('登录失败！');
        }
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
        $builder->setBackgroundColor(244, 252, 255);
        $builder->setMaxAngle(0);
        $builder->setMaxBehindLines(0);
        $builder->setMaxFrontLines(0);
        // 可以设置图片宽高及字体
        $builder->build($width = 110, $height = 38, $font = null);
        cache(['adminCaptcha' => $builder->getPhrase()],60*10);
        return response($builder->output())->header('Content-type','image/jpeg');
    }
}
