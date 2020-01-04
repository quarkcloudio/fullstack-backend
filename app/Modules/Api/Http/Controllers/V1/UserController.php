<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Services\Helper;
use Illuminate\Http\Request;
use App\User;
use App\Models\Sms;
use App\Models\Log;
use DB;
use Cache;
use Hash;

class UserController extends Controller
{
    // 获取个人中心
    public function index(Request $request)
    {
        $user = Auth::user();

        // 获取用户头像
        if(!empty($user)) {
            return $this->success('获取成功！','',Helper::mobileAdaptor($user));
        } else {
            return $this->error('获取失败！');
        }
    }

    // 获取个人信息
    public function profile(Request $request)
    {
        $user = Auth::user();

        // 获取用户头像
        if(!empty($user)) {
            return $this->success('获取成功！','',Helper::mobileAdaptor($user));
        } else {
            return $this->error('获取失败！');
        }
    }

    // 修改个人头像
    public function changeCover(Request $request)
    {
        $user = Auth::user();

        $id  = $request->input('id');

        $data['cover_id'] = $id;

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 修改用户名
    public function username(Request $request)
    {
        $user = Auth::user();

        $username  = $request->input('username');

        if(strpos($user->name,'-ID'.$user->id) === false) {
            return $this->error('您的用户名不能修改！');
        }

        if(empty($username)) {
            return $this->error('用户名不能为空！');
        }

        if(4>mb_strlen($username,'utf-8') || 16<mb_strlen($username,'utf-8')) {
            return $this->error('用户名必须在4-16个字符之间');
        }

        $data['name'] = $username;

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 修改昵称
    public function nickname(Request $request)
    {
        $user = Auth::user();

        $nickname  = $request->input('nickname');

        if(empty($nickname)) {
            return $this->error('昵称不能为空！');
        }

        $data['nickname'] = $nickname;

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 修改密码
    public function password(Request $request)
    {
        $user = Auth::user();

        $oldPassword    = $request->input('oldPassword');
        $password       = $request->input('password');
        $repassword     = $request->input('repassword');

        if(empty($oldPassword)) {
            return $this->error('当前密码不能为空！');
        }

        if(empty($password)) {
            return $this->error('新密码不能为空！');
        }

        if(empty($repassword)) {
            return $this->error('确认密码不能为空！');
        }

        if($repassword != $password) {
            return $this->error('确认密码不一致！');
        }

        if(6>mb_strlen($password,'utf-8') || 20<mb_strlen($password,'utf-8')) {
            return $this->error('密码必须在6-20个字符之间');
        }

        $user = User::where('id',$user->id)->first();

        // 检验原密码是否正确
        if(!Hash::check($oldPassword, $user->password)) {
            return $this->error('原密码不正确！');
        }

        $data['password'] = bcrypt($password);

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 修改手机号
    public function phone(Request $request)
    {
        $user = Auth::user();

        $phone    = $request->input('phone');
        $code       = $request->input('code');

        if(empty($phone)) {
            return $this->error('手机号不能为空！');
        }

        if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
            return $this->error('手机号格式错误！');
        }

        if(empty($code)) {
            return $this->error('短信验证码不能为空！');
        }

        $user = User::where('phone',$phone)->first();

        if($user) {
            return $this->error('手机号已经存在！');
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

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 绑定微信
    public function bindWechat(Request $request)
    {
        $user = Auth::user();

        $openid   = $request->input('openid');
        $unionid  = $request->input('unionid');

        $data['wechat_openid'] = $openid;
        $data['wechat_unionid'] = $unionid;

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 绑定QQ
    public function bindQq(Request $request)
    {
        $user = Auth::user();

        $openid   = $request->input('openid');

        $data['qq_openid'] = $openid;

        $result = User::where('id',$user->id)->update($data);

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 修改用户邮箱
    public function email(Request $request)
    {
        $user = Auth::user();

        $email    = $request->input('email');

        if(empty($email)) {
            return $this->error('邮箱不能为空！');
        }

        $title = Helper::getConfig('WEB_SITE_NAME').'账号激活';

        $data['uid']    = $user->id;
        $data['token']  = md5(Helper::createRand(10).$email);
        $data['email']  = $email;

        Cache::put('change_email_uid'.$user->id,$data,2880);

        $url = url('tool/emailActivate?token='.$data['token'].'&uid='.$user->id);

        $content = '请打开如下链接激活'.Helper::getConfig('WEB_SITE_NAME').'账号：'.$url.'。如非本人操作，请忽略。';

        $result = Helper::sendEmail($title,$email,$content);

        if($result) {
            return $this->success('邮件已发送，请注意查收！');
        } else {
            return $this->error('邮件发送失败！');
        }
    }

    // 登录日志
    public function loginLog(Request $request)
    {
        $user = Auth::user();

        $page       = $request->input('page',1);
        $limit      = $request->input('limit',10);

        // 定义对象
        $logs = Log::where('status',1)
        ->where('uid',$user->id)
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        $count = Log::where('uid',$user->id)
        ->where('status',1)
        ->count();

        return $this->success('获取成功！','',$logs,$count);
    }
}