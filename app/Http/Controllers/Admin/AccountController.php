<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use App\Models\Admin;
use App\Models\Menu;
use Validator;
use Hash;

class AccountController extends Controller
{
    /**
     * 获取账号信息
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function info()
    {
        $admin = Admin::where('id',ADMINID)->first();

        // 获取用户信息
        if(!empty($admin)) {
            // 获取用户头像
            if(!empty($admin['avatar'])) {
                $admin['avatar'] = Helper::getPicture($admin['avatar']);
            } else {
                $admin['avatar'] = '//'.$_SERVER['HTTP_HOST'].'/images/user.png';
            }
            return $this->success('获取成功！','',$admin);
        } else {
            return $this->error('获取失败！');
        }
    }

    /**
     * 修改账号信息
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function profile(Request $request)
    {
        $requestJson    =   $request->getContent();
        $requestData    =   json_decode($requestJson,true);

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'nickname' => ['required','max:255',Rule::unique('admins')->ignore(ADMINID)],
            'email' =>  ['required','email','max:255',Rule::unique('admins')->ignore(ADMINID)],
        ];

        // 进行验证
        $validator = Validator::make($requestData,$rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'nickname') {
                    $errorMsg = '昵称'.$value[0];
                }
                if($key === 'email') {
                    $errorMsg = '邮箱'.$value[0];
                }
            }

            return $this->error($errorMsg);
        }

        $result = Admin::where('id',ADMINID)->update($requestData);

        if(!empty($result)) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 修改账号密码
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function password(Request $request)
    {
        $requestJson    =   $request->getContent();
        $requestData    =   json_decode($requestJson,true);

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'min' => '不得小于6位',
            'same' => '与密码输入的不一致',
        ];

        // 表单验证规则
        $rules = [
            'oldPassword' => ['required','max:255'],
            'password' => ['required','max:255','min:6'],
            'repassword' => ['required','max:255',"same:password"],
        ];

        // 进行验证
        $validator = Validator::make($requestData,$rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'oldPassword') {
                    $errorMsg = '原密码'.$value[0];
                }
                if($key === 'password') {
                    $errorMsg = '密码'.$value[0];
                }
                if($key === 'repassword') {
                    $errorMsg = '确认密码'.$value[0];
                }
            }

            return $this->error($errorMsg);
        }

        $adminInfo = Admin::where('id',ADMINID)->first();

        if(!Hash::check($requestData['oldPassword'], $adminInfo->password)) {
            return $this->error('原密码错误！');
        }

        $result = Admin::where('id',ADMINID)->update(['password' => bcrypt($requestData['password'])]);

        if(!empty($result)) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 获取权限菜单
    *
    * @param  Request  $request
    * @return Response
    */
    public function menus(Request $request)
    {
        // 通过当前url倒推二级菜单和一级菜单

        // id等于1时默认为超级管理员
        if(ADMINID == 1) {

            // 查询列表
            $data = Menu::where('status', 1)
            ->where('guard_name', 'admin')
            ->orderBy('sort', 'asc')
            ->get()
            ->toArray();

        } else {
            // 获取当前用户的所有权限
            $getPermissions = Admin::where('id',ADMINID)->first()->getPermissionsViaRoles();

            foreach ($getPermissions as $key => $value) {
                $menuIds[] = $value->menu_id;
            }


            // 三级查询列表
            $lists = Menu::where('status', 1)
            ->where('guard_name', 'admin')
            ->where('pid','<>', 0)
            ->whereIn('id',$menuIds)
            ->orderBy('sort', 'asc')
            ->get()
            ->toArray();

            foreach ($lists as $key => $value) {
                if(!empty($value['pid'])) {
                    $pids[] = $value['pid'];
                }
            }

            // 二级菜单查询列表
            $lists1 = Menu::where('status', 1)
            ->where('guard_name', 'admin')
            ->whereIn('id',$pids)
            ->orderBy('sort', 'asc')
            ->get()
            ->toArray();

            $pids1 = [];

            foreach ($lists1 as $key1 => $value1) {
                if(!empty($value1['pid'])) {
                    $pids1[] = $value1['pid'];
                }
            }

            // 一级菜单查询列表
            $lists2 = Menu::where('status', 1)
            ->where('guard_name', 'admin')
            ->where('pid', 0)
            ->whereIn('id',$pids1)
            ->orderBy('sort', 'asc')
            ->get()
            ->toArray();

            $data = array_merge($lists,$lists1,$lists2);
        }

        foreach ($data as $key => $value) {
            $data[$key]['locale'] = 'menu'.str_replace("/",".",$value['path']);
            if(!$value['show']) {
                $data[$key]['hideInMenu'] = true;
            }

            if(empty($data[$key]['icon'])) {
                unset($data[$key]['icon']);
            }
        }

        $menuTrees = Helper::listToTree($data,'id','pid','children');

        return $this->success('获取成功！','',$menuTrees);
    }
}
