<?php

namespace App\Http\Controllers\PC\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Services\Helper;
use Illuminate\Support\Facades\Auth;
use App\Models\Sms;
use Hash;
use Session;

class UserController extends Controller
{
    /**
     * 用户中心
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $id = auth('web')->user()->id;
        $user = User::where('id',$id)->first();
        return view('pc/user/index',compact('user'));
    }

    /**
     * 个人资料
     *
     * @return \Illuminate\Http\Response
     */
    public function profile(Request $request)
    {
        if($request->isMethod('post')) {
            $id = auth('web')->user()->id;
            $nickname = $request->input('nickname');

            $data['nickname'] = $nickname;

            $result = User::where('id',$id)->update($data);

            if($result) {
                return $this->success('操作成功！');
            } else {
                return $this->error('操作失败！');
            }
        } else {
            $id = auth('web')->user()->id;
            $user = User::where('id',$id)->first();
            return view('pc/user/profile',compact('user'));
        }
    }

    /**
     * 账号安全
     *
     * @return \Illuminate\Http\Response
     */
    public function safety(Request $request)
    {
        $id = auth('web')->user()->id;
        $user = User::where('id',$id)->first();
        return view('pc/user/safety',compact('user'));
    }

    /**
     * 修改用户名
     *
     * @return \Illuminate\Http\Response
     */
    public function username(Request $request)
    {
        if($request->isMethod('post')) {
            $id = auth('web')->user()->id;
            $username = $request->input('username');

            $user = User::where('id',$id)->first();

            if(strpos($user->name,'-ID') === false) {
                return $this->error('您的用户名不能修改！');
            }

            if(empty($username)) {
                return $this->error('用户名不能为空！');
            }
    
            if(6>mb_strlen($username,'utf-8') || 20<mb_strlen($username,'utf-8')) {
                return $this->error('用户名必须在6-20个字符之间');
            }

            $hasUser = User::where('name',$username)->first();

            if($hasUser) {
                return $this->error('用户名已经存在！');
            }

            $data['name'] = $username;

            $result = User::where('id',$id)->update($data);

            if($result) {
                return $this->success('操作成功！','/pc/user/safety');
            } else {
                return $this->error('操作失败！');
            }
        } else {
            $id = auth('web')->user()->id;
            $user = User::where('id',$id)->first();
            return view('pc/user/username',compact('user'));
        }
    }

    /**
     * 修改密码
     *
     * @return \Illuminate\Http\Response
     */
    public function updatePassword(Request $request)
    {
        if($request->isMethod('post')) {
            $id = auth('web')->user()->id;
            $oldpassword = $request->input('oldpassword');
            $password = $request->input('password');
            $repassword = $request->input('repassword');

            if(empty($oldpassword)) {
                return $this->error('原密码不能为空！');
            }

            if($password != $repassword) {
                $this->error('两次输入的密码不一致！');
            }

            if(empty($password)) {
                return $this->error('密码不能为空！');
            }
    
            if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
                return $this->error('密码必须在6-20个字符之间');
            }

            $user = User::where('id',$id)->first();

            // 检验原密码是否正确
            if(!Hash::check($oldpassword, $user->password)) {
                return $this->error('原密码不正确！');
            }

            $data['password'] = bcrypt($password);

            $result = User::where('id',$id)->update($data);

            if($result) {
                return $this->success('操作成功！','/pc/user/safety');
            } else {
                return $this->error('操作失败！');
            }
        } else {
            $id = auth('web')->user()->id;
            $user = User::where('id',$id)->first();
            return view('pc/user/password',compact('user'));
        }
    }

    /**
     * 重置密码
     *
     * @return \Illuminate\Http\Response
     */
    public function password(Request $request)
    {
        if($request->isMethod('post')) {
            $id = auth('web')->user()->id;
            $phone = $request->input('phone');
            $code = $request->input('code');
            $password = $request->input('password');
            $repassword = $request->input('repassword');

            if(empty($phone)) {
                return $this->error('手机号不能为空！');
            }

            if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
                return $this->error('手机号格式错误！');
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

            if($password != $repassword) {
                $this->error('两次输入的密码不一致！');
            }

            if(empty($password)) {
                return $this->error('密码不能为空！');
            }
    
            if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
                return $this->error('密码必须在6-20个字符之间');
            }

            $user = User::where('id',$id)->first();

            $data['password'] = bcrypt($password);

            $result = User::where('id',$id)->update($data);

            if($result) {
                return $this->success('操作成功！','/pc/user/user/profile');
            } else {
                return $this->error('操作失败！');
            }
        } else {
            $id = auth('web')->user()->id;
            $user = User::where('id',$id)->first();
            return view('pc/user/password',compact('user'));
        }
    }

    /**
     * 修改邮箱
     *
     * @return \Illuminate\Http\Response
     */
    public function email(Request $request)
    {
        if($request->isMethod('post')) {
            $email = $request->input('email');

            if(empty($email)) {
                return $this->error('邮箱不能为空！');
            }

            if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                return $this->error('邮箱格式错误！');
            }

            $title = Helper::getConfig('WEB_SITE_NAME').'邮箱修改';
            $token = md5($email.Helper::createRand(10));
            Session::put('token',$token);
            Session::put('email',$email);

            $hasEmail = User::where('email',$email)->first();

            if(!empty($hasEmail)) {
                return $this->error('此邮箱已经注册！');
            }

            $url = url('pc/user/changeEmail?token='.$token);

            $content = '请打开如下链接：'.$url.'，进行邮箱修改。如非本人操作，请忽略。';

            $result = Helper::sendEmail($title,$email,$content);

            if($result) {
                return $this->success('邮件已发送，请登录邮箱完成修改！');
            } else {
                return $this->error('邮件发送失败！');
            }
        } else {
            $id = auth('web')->user()->id;
            $user = User::where('id',$id)->first();
            return view('pc/user/email',compact('user'));
        }
    }

    /**
     * 通过url验证邮箱
     *
     * @return \Illuminate\Http\Response
     */
    public function changeEmail(Request $request)
    {
        $id = auth('web')->user()->id;
        $token = $request->input('token');

        if(empty($token)) {
            return $this->error('参数错误！');
        }

        $getToken = Session::get('token');

        if($token != $getToken) {
            return $this->error('修改失败，请重新修改！');
        }

        $data['email'] = Session::get('email');

        $result = User::where('id',$id)->update($data);

        if($result) {
            $message = '恭喜你，修改成功！';
        } else {
            $message = '修改失败，请重新修改！';
        }

        $user = User::where('id',$id)->first();

        return view('pc/user/changeEmail',compact('user','message'));
    }
    
    /**
     * 修改手机号
     *
     * @return \Illuminate\Http\Response
     */
    public function phone(Request $request)
    {
        if($request->isMethod('post')) {

            $id = auth('web')->user()->id;
            $phone = $request->input('phone');
            $code = $request->input('code');
    
            if(empty($phone)) {
                return $this->error('手机号不能为空！');
            }
    
            if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
                return $this->error('手机号格式错误！');
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

            $result = User::where('id',$id)->update($data);

            if($result) {
                return $this->success('操作成功！','/pc/user/profile');
            } else {
                return $this->error('操作失败！');
            }
        } else {
            $id = auth('web')->user()->id;
            $user = User::where('id',$id)->first();
            return view('pc/user/phone',compact('user'));
        }
    }
}
