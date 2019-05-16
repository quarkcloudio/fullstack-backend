<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Services\Helper;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class BaseController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your wap screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/index/index';
    
    protected $username;

    /**
     * 登录
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function login(Request $request)
    {
        if($request->isMethod('post')) {
            $username = $request->input('username');
            $password = $request->input('password');
            if (Auth::guard('web')->attempt(['name' => $username, 'password' => $password])) {
                $id = auth('web')->user()->id;
                // 更新登录信息
                $data['last_login_ip'] = $_SERVER["REMOTE_ADDR"];
                $data['last_login_time'] = date('Y-m-d H:i:s');
                User::where('id',$id)->update($data);
                return Helper::success('登录成功','index/index');
            } else {
                return Helper::error('用户名或密码错误！');
            }
        } else {
            return view('mobile/base/login');
        }
    }

    /**
     * 注册
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        if($request->isMethod('post')){
            $username = $request->input('username');
            $password = $request->input('password');

        } else {
            return view('mobile/base/register');
        }
    }

    /**
     * 退出
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function logout()
    {
        $result = Auth::guard('web')->logout();
        return redirect('mobile/base/login');
    }
}