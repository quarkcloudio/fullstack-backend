<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Admin;
use Spatie\Permission\Models\Role;
use App\Models\Category;
use App\Models\AccountLog;
use Validator;
use DB;

class AdminController extends Controller
{
    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function index(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Admin::query();

        // 查询
        if(!empty($search)) {

            // 用户名
            if(isset($search['username'])) {
                $query->where('name','like','%'.$search['username'].'%');
            }

            // 昵称
            if(isset($search['nickname'])) {
                $query->where('nickname','like','%'.$search['nickname'].'%');
            }

            // 邮箱
            if(isset($search['email'])) {
                $query->where('email','like','%'.$search['email'].'%');
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        // 模板数据
        $data['lists'] = Helper::listsFormat($lists);
        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {
        // 查询列表
        $roles = Role::where('guard_name','admin')->get()->toArray();
        $data['roles'] = $roles;
        return $this->success('获取成功！','',$data);
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $requestJson    =   $request->getContent();
        $requestData    =   json_decode($requestJson,true);
        $roleIds        =   $requestData['roleIds'];
        // 删除modelName
        unset($requestData['modelName']);
        unset($requestData['roleIds']);

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'min' => '不得小于6位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'username' => ['required','max:255',Rule::unique('admins')],
            'password' => ['required','max:255','min:6'],
            'nickname' => ['required','max:255',Rule::unique('admins')],
            'email' =>  ['required','email','max:255',Rule::unique('admins')],
            'phone' =>  ['required','max:11',Rule::unique('admins')],
        ];

        // 进行验证
        $validator = Validator::make($requestData,$rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'username') {
                    $errorMsg = '用户名'.$value[0];
                }

                if($key === 'nickname') {
                    $errorMsg = '昵称'.$value[0];
                }

                if($key === 'email') {
                    $errorMsg = '邮箱'.$value[0];
                }

                if($key === 'password') {
                    $errorMsg = '密码'.$value[0];
                }

                if($key === 'phone') {
                    $errorMsg = '手机号'.$value[0];
                }
            }

            return $this->error($errorMsg);
        }

        if (!empty($requestData['password'])) {
            $requestData['password'] = bcrypt($requestData['password']);
        }

        if ($requestData['status'] == true) {
            $requestData['status'] = 1;
        } else {
            $requestData['status'] = 2;
        }

        $admin = Admin::create($requestData);

        // You may also pass an array
        $result = $admin->syncRoles($roleIds);

        if ($result) {
            return $this->success('操作成功！','/admin/user/index');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function edit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $admin = Admin::find($id);

        if(empty($admin['last_login_ip'])) {
            $admin['last_login_ip'] = '暂无';
        }

        if(empty($admin['last_login_time'])) {
            $admin['last_login_time'] = '暂无';
        }

        // 查询列表
        $roles = Role::where('guard_name','admin')->get()->toArray();

        $checkedRoles = [];

        foreach ($roles as $key => $role) {
            $hasRole = $admin->hasRole($role['name']);
            if($hasRole) {
                $checkedRoles[] = $role['id'];
            }
        }

        $data['admin'] = $admin;
        $data['roles'] = $roles;
        $data['checkedRoles'] = $checkedRoles;

        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function save(Request $request)
    {
        $requestJson    =   $request->getContent();
        $requestData    =   json_decode($requestJson,true);
        $roleIds        =   $requestData['roleIds'];

        // 删除modelName
        unset($requestData['modelName']);
        unset($requestData['roleIds']);

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'username' => ['required','max:255',Rule::unique('admins')->ignore($requestData['id'])],
            'nickname' => ['required','max:255',Rule::unique('admins')->ignore($requestData['id'])],
            'email' =>  ['required','email','max:255',Rule::unique('admins')->ignore($requestData['id'])],
            'phone' =>  ['required','max:11',Rule::unique('admins')->ignore($requestData['id'])],
        ];

        // 进行验证
        $validator = Validator::make($requestData,$rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'username') {
                    $errorMsg = '用户名'.$value[0];
                }

                if($key === 'nickname') {
                    $errorMsg = '昵称'.$value[0];
                }

                if($key === 'email') {
                    $errorMsg = '邮箱'.$value[0];
                }

                if($key === 'phone') {
                    $errorMsg = '手机号'.$value[0];
                }
            }

            return $this->error($errorMsg);
        }

        if (!empty($requestData['password'])) {
            $requestData['password'] = bcrypt($requestData['password']);
        }

        if ($requestData['status'] == true) {
            $requestData['status'] = 1;
        } else {
            $requestData['status'] = 2;
        }

        $result = Admin::where('id',$requestData['id'])->update($requestData);

        // 同步角色
        $result1 = Admin::where('id',$requestData['id'])->first()->syncRoles($roleIds);

        if ($result) {
            return $this->success('操作成功！','/admin/user/index');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 删除单个数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function destroy(Request $request)
    {
        $id = $request->json('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $result = Admin::destroy($id);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = Admin::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 导出数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function export(Request $request)
    {
        // 获取参数
        $search = $request->get('search');
            
        // 定义对象
        $query = Admin::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('posts.title','like','%'.$search['title'].'%');
            }

            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('posts.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('posts.status',$search['status']);
                }
            }

            // 作者
            if(isset($search['author'])) {
                if(!empty($search['author'])) {
                    $query->where('posts.author',$search['author']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('posts.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        $fileName = 'data';

        $title = ['ID','标题'];

        Helper::export($fileName,$title,$lists);
    }

}
