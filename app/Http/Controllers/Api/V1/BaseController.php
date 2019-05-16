<?php

namespace App\Http\Controllers\Api\V1;

use App\Services\Helper;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Laravel\Passport\Client;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Session;
use App\Models\Sms;

class BaseController extends ApiController
{
    use AuthenticatesUsers;

    public function username()
    {
        return 'name';
    }

    // 登录
    public function login(Request $request)
    {
        $username = $request->input('username');
        $password = $request->input('password');
        $device   = $request->input('device');

        if(empty($username) || empty($password)) {
            return $this->error('用户名或密码错误！');
        }

        // 用户名登录
        $nameLoginSuccess = Auth::attempt(['name'=>$username,'password'=>$password]);

        // 邮箱登录
        $emailLoginSuccess = Auth::attempt(['email'=>$username,'password'=>$password]);

        // 手机登录
        $phoneLoginSuccess = Auth::attempt(['phone'=>$username,'password'=>$password]);

        if ($nameLoginSuccess || $emailLoginSuccess || $phoneLoginSuccess) {

            $user = Auth::user();

            // 更新登录信息
            $loginData['last_login_ip'] = $_SERVER["REMOTE_ADDR"];
            $loginData['last_login_time'] = date('Y-m-d H:i:s');
            User::where('id',$user->id)->update($loginData);

            // 根据ip获取地址
            $getAddress = Helper::getAddress($_SERVER["REMOTE_ADDR"]);

            // 记录登录日志
            $log['action'] = '用户登录';

            // 设备为空，则记录ip地址
            if(empty($device)) {
                $log['remark'] = 'APP '.$getAddress['province'].' '.$getAddress['city'];
            } else {
                $log['remark'] = $device;
            }

            Helper::log($log);

            // 返回登录信息
            $data['uid'] = $user->id;
            $data['name'] = $user->name;
            $data['token'] = $user->createToken('AdminCMS')->accessToken;
            return $this->success('登录成功','',$data);
        }

        return $this->error('登录失败');
    }

    /**
     * 快捷登录
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function quickLogin(Request $request)
    {

        $phone      = $request->input('phone');
        $code       = $request->input('code');
        $device     = $request->input('device');

        $validateStatus = Helper::validateSmsCode($phone,$code);

        if($validateStatus != 'ok') {
            return $this->error($validateStatus);
        }

        $hasPhone = User::where('phone',$phone)->first();

        // 不存在则创建用户
        if(empty($hasPhone)) {
            $data['phone'] = $phone;
            $data['password'] = bcrypt(env('APP_KEY'));
            $data['money'] = 0;
            $data['point'] = 0;
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');

            $uid = User::insertGetId($data);
            if($uid) {
                $updateData['name'] = Helper::createRand().'-ID'.$uid;
                $updateData['nickname'] = Helper::createRand().'-ID'.$uid;
                User::where('id',$uid)->update($updateData);
            } else {
                return $this->error('注册失败，请重试！');
            }
        } else {
            $uid = $hasPhone->id;
        }

        // 通过uid登录
        $quickLoginSuccess = Auth::loginUsingId($uid);

        if ($quickLoginSuccess) {
            $user = Auth::user();

            // 更新登录信息
            $loginData['last_login_ip'] = $_SERVER["REMOTE_ADDR"];
            $loginData['last_login_time'] = date('Y-m-d H:i:s');
            User::where('id',$user->id)->update($loginData);

            // 根据ip获取地址
            $getAddress = Helper::getAddress($_SERVER["REMOTE_ADDR"]);

            // 记录登录日志
            $log['action'] = '用户登录';

            // 设备为空，则记录ip地址
            if(empty($device)) {
                $log['remark'] = 'APP '.$getAddress['province'].' '.$getAddress['city'];
            } else {
                $log['remark'] = $device;
            }

            Helper::log($log);

            $data['uid'] = $user->id;
            $data['name'] = $user->name;
            $data['token'] = $user->createToken('AdminCMS')->accessToken;
            return $this->success('登录成功','',$data);
        } else {

            // 记录登录日志
            $log['action'] = $phone.'LOGIN_ERROR';
            $log['remark'] = '用户'.$phone.'尝试登录出错！';
            Helper::log($log);

            return $this->error('用户名或密码错误！');
        }
    }

    /**
     * 微信快捷登录
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function wechatLogin(Request $request)
    {
        $wechatOpenid       = $request->input('wechatOpenid');
        $wechatUnionid      = $request->input('wechatUnionid');
        $nickname           = $request->input('nickname');
        $coverId            = $request->input('coverId');
        $device             = $request->input('device');

        if(empty($wechatOpenid) && empty(wechatUnionid)) {
            return $this->error('参数错误！');
        }

        if(!empty($wechatUnionid)) {
            $userInfo = User::where('wechat_unionid',$wechatUnionid)->first();
        } else {
            $userInfo = User::where('wechat_openid',$wechatOpenid)->first();
        }

        if(empty($userInfo)) {
            // 不存在则创建用户
            $data['password'] = bcrypt(env('APP_KEY'));
            $data['cover_id'] = $coverId;
            $data['money'] = 0;
            $data['point'] = 0;
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['wechat_openid'] = $wechatOpenid;
            $data['wechat_unionid'] = $wechatUnionid;

            $uid = User::insertGetId($data);
            if($uid) {
                $updateData['name'] = Helper::createRand().'-ID'.$uid;
                $updateData['nickname'] = $nickname;
                User::where('id',$uid)->update($updateData);
            } else {
                return $this->error('注册失败，请重试！');
            }
        } else {
            $uid = $userInfo->id;
        }

        // 通过uid登录
        $quickLoginSuccess = Auth::loginUsingId($uid);

        if ($quickLoginSuccess) {
            $user = Auth::user();

            // 更新登录信息
            $loginData['last_login_ip'] = $_SERVER["REMOTE_ADDR"];
            $loginData['last_login_time'] = date('Y-m-d H:i:s');
            User::where('id',$user->id)->update($loginData);

            // 根据ip获取地址
            $getAddress = Helper::getAddress($_SERVER["REMOTE_ADDR"]);

            // 记录登录日志
            $log['action'] = '用户登录';

            // 设备为空，则记录ip地址
            if(empty($device)) {
                $log['remark'] = '微信 '.$getAddress['province'].' '.$getAddress['city'];
            } else {
                $log['remark'] = $device;
            }

            Helper::log($log);

            $data['uid'] = $user->id;
            $data['name'] = $user->name;
            $data['token'] = $user->createToken('AdminCMS')->accessToken;
            return $this->success('登录成功','',$data);
        } else {

            // 记录登录日志
            $log['action'] = 'wechatLOGIN_ERROR';
            $log['remark'] = '用户微信尝试登录出错！';
            Helper::log($log);

            return $this->error('登录失败！');
        }
    }

    /**
     * qq快捷登录
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function qqLogin(Request $request)
    {
        $qqOpenid       = $request->input('qqOpenid');
        $nickname       = $request->input('nickname');
        $coverId        = $request->input('coverId');
        $device         = $request->input('device');

        if(empty($qqOpenid)) {
            return $this->error('参数错误！');
        }

        $userInfo = User::where('qq_openid',$qqOpenid)->first();

        if(empty($userInfo)) {
            // 不存在则创建用户
            $data['password'] = bcrypt(env('APP_KEY'));
            $data['cover_id'] = $coverId;
            $data['money'] = 0;
            $data['point'] = 0;
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['qq_openid'] = $qqOpenid;

            $uid = User::insertGetId($data);
            if($uid) {
                $updateData['name'] = Helper::createRand().'-ID'.$uid;
                $updateData['nickname'] = $nickname;
                User::where('id',$uid)->update($updateData);
            } else {
                return $this->error('注册失败，请重试！');
            }
        } else {
            $uid = $userInfo->id;
        }

        // 通过uid登录
        $quickLoginSuccess = Auth::loginUsingId($uid);

        if ($quickLoginSuccess) {
            $user = Auth::user();

            // 更新登录信息
            $loginData['last_login_ip'] = $_SERVER["REMOTE_ADDR"];
            $loginData['last_login_time'] = date('Y-m-d H:i:s');
            User::where('id',$user->id)->update($loginData);

            // 根据ip获取地址
            $getAddress = Helper::getAddress($_SERVER["REMOTE_ADDR"]);

            // 记录登录日志
            $log['action'] = '用户登录';

            // 设备为空，则记录ip地址
            if(empty($device)) {
                $log['remark'] = 'QQ '.$getAddress['province'].' '.$getAddress['city'];
            } else {
                $log['remark'] = $device;
            }

            Helper::log($log);

            $data['uid'] = $user->id;
            $data['name'] = $user->name;
            $data['token'] = $user->createToken('AdminCMS')->accessToken;
            return $this->success('登录成功','',$data);
        } else {

            // 记录登录日志
            $log['action'] = 'qqLOGIN_ERROR';
            $log['remark'] = '用户QQ尝试登录出错！';
            Helper::log($log);

            return $this->error('登录失败！');
        }
    }

    /**
     * 注册
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $input = $request->all();

        // 获取注册方式
        $type = $request->input('type');
        $password = $request->input('password');
        $repassword = $request->input('repassword');

        if($password != $repassword) {
            $this->error('两次输入的密码不一致！');
        }

        // 根据注册类型调用注册方法
        switch ($type) {
            case 'phone':
                $result = $this->phoneRegister($request);
                break;
            
            case 'email':
                $result = $this->emailRegister($request);
                break;

            default:
                $result = $this->nameRegister($request);
                break;
        }

        return $result;
    }

    /**
     * 用户名注册
     *
     * @return \Illuminate\Http\Response
     */
    protected function nameRegister($request) 
    {
        $name = $request->input('username');
        $password = $request->input('password');
        $captcha = $request->input('captcha');

        $getCaptcha = Session::get('captcha');

        if (empty($captcha) || ($captcha != $getCaptcha)) {
            return $this->error('验证码错误！');
        }
        // 清空验证码Session
        Session::put('captcha', '');

        if(empty($name)) {
            return $this->error('用户名不能为空！');
        }

        if(empty($password)) {
            return $this->error('密码不能为空！');
        }

        if(6>mb_strlen($name,'utf-8') || 20<mb_strlen($name,'utf-8')) {
            return $this->error('用户名必须在6-20个字符之间');
        }

        if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
            return $this->error('密码必须在6-20个字符之间');
        }

        $hasName = User::where('name',$name)->first();

        if($hasName) {
            return $this->error('用户名已经存在！');
        }

        $data['name'] = $name;
        $data['nickname'] = $name;
        $data['password'] = bcrypt($password);
        $data['money'] = 0;
        $data['point'] = 0;
        $data['status'] = 1;

        $result = User::create($data);

        if($result) {
            return $this->success('注册成功！','/login');
        } else {
            return $this->error('注册失败，请重试！');
        }
    }

    /**
     * 手机号注册
     *
     * @return \Illuminate\Http\Response
     */
    protected function phoneRegister($request) 
    {
        $phone = $request->input('phone');
        $password = $request->input('password');
        $code = $request->input('code');

        if(empty($phone)) {
            return $this->error('手机号不能为空！');
        }

        if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
            return $this->error('手机号格式错误！');
        }

        if(empty($password)) {
            return $this->error('密码不能为空！');
        }

        if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
            return $this->error('密码必须在6-20个字符之间');
        }

        $hasPhone = User::where('phone',$phone)->first();

        if($hasPhone) {
            return $this->error('手机号已经存在！');
        }

        if(empty($code)) {
            return $this->error('手机验证码不能为空！');
        }

        $sms = Sms::where('phone',$phone)->orderBy('id','desc')->first();

        // 判断验证码是否正确
        if($sms->code != $code) {

            // 更新错误次数
            Sms::where('id',$sms->id)->increment('error_times');
            return $this->error('手机验证码错误！');
        }

        // 验证码有效时间6分钟，最多允许6次错误
        if(((time() - strtotime($sms->created_at)) > 3600) || ($sms->error_times)>6) {
            return $this->error('手机验证码已经失效，请重新获取！');
        }

        $data['phone'] = $phone;
        $data['password'] = bcrypt($password);
        $data['money'] = 0;
        $data['point'] = 0;
        $data['status'] = 1;
        $data['created_at'] = date('Y-m-d H:i:s');

        $uid = User::insertGetId($data);

        if($uid) {

            $updateData['name'] = Helper::createRand().'-ID'.$uid;
            $updateData['nickname'] = Helper::createRand().'-ID'.$uid;
            User::where('id',$uid)->update($updateData);

            return $this->success('注册成功！','/login');
        } else {
            return $this->error('注册失败，请重试！');
        }
    }

    /**
     * 邮箱注册
     *
     * @return \Illuminate\Http\Response
     */
    protected function emailRegister($request) 
    {
        $email = $request->input('email');
        $password = $request->input('password');

        if(empty($email)) {
            return $this->error('邮箱不能为空！');
        }

        if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return $this->error('邮箱格式错误！');
        }

        if(empty($password)) {
            return $this->error('密码不能为空！');
        }

        if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
            return $this->error('密码必须在6-20个字符之间');
        }

        $hasEmail = User::where('email',$email)->first();

        if($hasEmail) {
            return $this->error('邮箱已经存在！');
        }

        $data['email'] = $email;
        $data['password'] = bcrypt($password);
        $data['money'] = 0;
        $data['point'] = 0;
        $data['status'] = 1;
        $data['created_at'] = date('Y-m-d H:i:s');

        $uid = User::insertGetId($data);

        if($uid) {
            $updateData['name'] = Helper::createRand().'-ID'.$uid;
            $updateData['nickname'] = Helper::createRand().'-ID'.$uid;
            User::where('id',$uid)->update($updateData);

            return $this->success('注册成功！','/login');
        } else {
            return $this->error('注册失败，请重试！');
        }
    }

    // 退出
    public function logout(Request $request)
    {
        if (Auth::guard('api')->check()){
            Auth::guard('api')->user()->token()->revoke();
        }

        return $this->success('退出成功');
    }

    /**
     * 重置密码
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function resetPassword(Request $request)
    {
        $phone      = $request->input('phone');
        $code       = $request->input('code');
        $password   = $request->input('password');
        $repassword = $request->input('repassword');

        $validateStatus = Helper::validateSmsCode($phone,$code);

        if($validateStatus != 'ok') {
            return $this->error($validateStatus);
        }

        if(empty($password)) {
            return $this->error('密码不能为空！');
        }

        if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
            return $this->error('密码必须在6-20个字符之间');
        }

        // 密码不一致！
        if($password !== $repassword) {
            return $this->error('确认密码不一致！');
        }

        $userInfo = User::where('phone',$phone)->first();

        // 用户不存在！
        if(empty($userInfo)) {
            return $this->error('用户不存在！');
        }

        $data['password'] = bcrypt($password);

        $result = User::where('id',$userInfo->id)->update($data);

        if ($result) {
            return $this->success('操作成功，请重新登录！');
        } else {
            // 记录登录日志
            $log['action'] = $phone.'LOGIN_ERROR';
            $log['remark'] = '用户'.$phone.'重置密码出错！';
            Helper::log($log);

            return $this->error('操作失败！');
        }
    }

    // 验证用户名等是否合法
    public function verifyField(Request $request)
    {
        $type  = $request->input('type');
        $field = $request->input('field');

        if(empty($type) || empty($field)) {
            return $this->error('参数错误！');
        }

        switch ($type) {
            case 'username':
                $hasResult = User::where('name',$field)->first();

                if($hasResult) {
                    return $this->error('用户名已经注册！');
                }
                break;
            case 'phone':
                $hasResult = User::where('phone',$field)->first();

                if($hasResult) {
                    return $this->error('手机号已经注册！');
                }
                break;
            case 'email':
                $hasResult = User::where('email',$field)->first();

                if($hasResult) {
                    return $this->error('邮箱已经注册！');
                }
                break;
            default:
                $hasResult = User::where('name',$field)->first();

                if($hasResult) {
                    return $this->error('用户名已经注册！');
                }
                break;
        }
    }

    /**
     * 第三方登录状态
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function thirdPartyLogin(Request $request)
    {
        $result = Helper::getAddress($_SERVER["REMOTE_ADDR"]);

        if($result['country'] == '中国') {
            return $this->success('获取成功！','','on');
        } else {
            return $this->success('获取成功！','','off');
        }
    }
}