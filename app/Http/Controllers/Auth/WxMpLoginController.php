<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Services\Helper;
use App\Models\User;
use App\Models\ActionLog;
use EasyWeChat\Factory;

class WxMpLoginController extends Controller
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
        $code = $request->input('code');
        $vi = $request->input('vi');
        $encryptedData = $request->input('encryptedData');

        if(empty($code) || empty($vi) || empty($encryptedData)) {
            return $this->error('错误！');
        }
        
        $app = Factory::miniProgram(Helper::wechatMPConfig());

        $wxMpAuth = $app->auth->session($code);

        $query = User::query();

        if(isset($wxMpAuth['unionid'])) {
            $query->where('wechat_unionid',$wxMpAuth['unionid']);
        } else {
            if(empty($wxMpAuth['openid'])) {
                return $this->error('授权失败！');
            }
            $query->where('wechat_openid',$wxMpAuth['openid']);
        }

        $user = $query->where('status',1)->first();

        if(empty($user)) {

            $decryptedData = $app->encryptor->decryptData($wxMpAuth['session_key'], $vi, $encryptedData);

            // 不存在用户，插入到数据库中
            $data['username'] = Helper::makeRand(8) . '-' . time(); // 临时用户名
            $data['nickname'] = $decryptedData['nickName'];
            $data['sex'] = $decryptedData['gender'];
            $data['password'] = bcrypt(env('APP_KEY'));
            $data['cover_id'] = $decryptedData['avatarUrl'];
            $data['wechat_openid'] = $decryptedData['openId'];
            if(isset($decryptedData['unionId'])) {
                $data['wechat_unionid'] = $decryptedData['unionId'];
            }
            $data['last_login_ip'] = Helper::clientIp();
            $data['last_login_time'] = date('Y-m-d H:i:s');

            $uid = User::insertGetId($data);

            if(empty($uid)) {
                return $this->error('创建用户错误！');
            }

            $updateResult = User::where('id',$uid)->update(['username' => Helper::makeRand(8) . '-' . $uid]);

            if(empty($updateResult)) {
                return $this->error('更新临时用户名错误！');
            }

        } else {
            // 存在则登录
            $uid = $user['id'];
        }

        $loginResult = Auth::loginUsingId($uid);

        if(empty($loginResult)) {

            return $this->error('登录失败！');
        }

        $result['token'] = Auth::user()->createToken('FullStack')->accessToken;
        return $this->success('登录成功！','',$result);
    }
}
