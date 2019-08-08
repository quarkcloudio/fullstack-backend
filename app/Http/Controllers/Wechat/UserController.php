<?php

namespace App\Http\Controllers\Mobile;

use Illuminate\Http\Request;
use App\Services\Helper;
use App\User;

class UserController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $uid = auth('web')->user()->id;

        $user = User::where('id',$uid)->first();
        return view('wechat/user/index',compact('user'));
    }

    /**
     * 编辑手机号
     */
    public function phone(Request $request)
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
            return view('wechat/user/phone',compact('user'));
        }

    }
}
