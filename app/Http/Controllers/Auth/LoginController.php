<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Services\Helper;
use App\Models\User;
use App\Models\ActionLog;
use Laravel\Passport\Client;

class LoginController extends Controller
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
     * 登录方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function login(Request $request)
    {
        $type = $request->input('type');

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
                return $this->error('参数错误！');
                break;
        }

        if ($loginResult['status'] === 'success') {

            $data['msg'] = '登录成功';
            $data['status'] = 'success';
            $data['type'] = $type;
            $data['uid'] = $loginResult['data']['uid'];
            $data['username'] = $loginResult['data']['username'];
            $data['nickname'] = $loginResult['data']['nickname'];
            $data['currentAuthority'] = 'admin';
            $data['token'] = $loginResult['data']['token'];

            return $data;
        } else {

            $data['msg'] = '登录失败';
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
        $username = $request->input('username');
        $password = $request->input('password');
        $captcha = $request->input('captcha');

        // 一天内累计6次登录错误，则必须开启验证码
        $loginErrorTimes = ActionLog::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->where('action',$username.'LOGIN_ERROR')
        ->count();
        
        if($loginErrorTimes > 6) {
            $getCaptcha = session('captcha');
            if(empty($captcha) || ($captcha != $getCaptcha)) {
                return $this->error('验证码错误！');
            }
        }

        if(empty($username)) {
            return $this->error('用户名不能为空！');
        }

        if(empty($password)) {
            return $this->error('密码不能为空！');
        }

        $loginResult = Auth::attempt(['username' => $username, 'password' => $password]);

        if($loginResult) {

            $user = Auth::user();

            // 更新登录信息
            $data['last_login_ip'] = Helper::clientIp();
            $data['last_login_time'] = date('Y-m-d H:i:s');
            Admin::where('id',$user->id)->update($data);

            // 记录日志
            $log['action'] = '管理员登录';
            $log['type'] = 'ADMIN';
            $log['remark'] = Auth::user()->username.'登录后台';
            Helper::actionLog($log);

            $result['uid'] = $user->id;
            $result['username'] = $user->username;
            $result['nickname'] = $user->nickname;
            $result['token'] = $user->createToken('FullStack')->accessToken;

            return $this->success('登录成功！','',$result);
        } else {

            // 记录登录日志
            $log['action'] = $username.'LOGIN_ERROR';
            $log['type'] = 'ADMIN';
            $log['remark'] = '管理员'.$username.'尝试登录出错！';
            Helper::actionLog($log);

            // 清除验证码
            session(['captcha'=>null]);

            return $this->error('登录失败！');
        }
    }

    /**
     * 手机登录方法
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    protected function mobileLogin($request)
    {
        $phone = $request->input('phone');
        $code = $request->input('code');

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
        $result = Auth::loginUsingId($uid);

        if($result) {

            $user = Auth::user();

            // 更新登录信息
            $data['last_login_ip'] = Helper::clientIp();
            $data['last_login_time'] = date('Y-m-d H:i:s');
            User::where('id',$user->id)->update($data);

            // 记录日志
            $log['action'] = '用户登录';
            $log['type'] = 'USER';
            $log['remark'] = Auth::user()->username.'登录后台';
            Helper::actionLog($log);

            $result['uid'] = $user->id;
            $result['username'] = $user->username;
            $result['nickname'] = $user->nickname;

            return $this->success('登录成功！','',$result);
        } else {

            // 记录登录日志
            $log['action'] = $phone.'LOGIN_ERROR';
            $log['type'] = 'USER';
            $log['remark'] = '用户'.$phone.'尝试登录出错！';
            Helper::actionLog($log);

            return $this->error('登录失败！');
        }
    }
}
