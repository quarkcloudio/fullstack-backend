<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\User;
use App\Models\Category;
use App\Models\AccountLog;
use Validator;
use DB;

class UserController extends Controller
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
        $query = User::query();

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

            // 手机号
            if(isset($search['phone'])) {
                $query->where('phone','like','%'.$search['phone'].'%');
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

        foreach ($lists as $key => $value) {
            $lists[$key]['cover_path'] = Helper::getPicture($value['cover_id']);
        }

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
        return $this->success('获取成功！');
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

        // 删除modelName
        unset($requestData['modelName']);

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
            'name' => ['required','max:255',Rule::unique('users')],
            'password' => ['required','max:255','min:6'],
            'nickname' => ['required','max:255',Rule::unique('users')],
            'email' =>  ['required','email','max:255',Rule::unique('users')],
            'phone' =>  ['required','max:11',Rule::unique('users')],
        ];

        // 进行验证
        $validator = Validator::make($requestData,$rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'name') {
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

                if($key === 'password') {
                    $errorMsg = '密码'.$value[0];
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

        $result = User::create($requestData);

        if ($result) {
            return $this->success('操作成功！','/user/index');
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

        $data = User::find($id)->toArray();

        $data['cover_path'] = Helper::getPicture($data['cover_id']);

        if(empty($data['last_login_ip'])) {
            $data['last_login_ip'] = '暂无';
        }

        if(empty($data['last_login_time'])) {
            $data['last_login_time'] = '暂无';
        }

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

        // 删除modelName
        unset($requestData['modelName']);

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'name' => ['required','max:255',Rule::unique('users')->ignore($requestData['id'])],
            'nickname' => ['required','max:255',Rule::unique('users')->ignore($requestData['id'])],
            'email' =>  ['required','email','max:255',Rule::unique('users')->ignore($requestData['id'])],
            'phone' =>  ['required','max:11',Rule::unique('users')->ignore($requestData['id'])],
        ];

        // 进行验证
        $validator = Validator::make($requestData,$rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'name') {
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

        $result = User::where('id',$requestData['id'])->update($requestData);

        if ($result) {
            return $this->success('操作成功！','/user/index');
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

        $result = User::destroy($id);

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
        $query = User::query();

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
    * 用户充值
    *
    * @param  Request  $request
    * @return Response
    */
    public function recharge(Request $request)
    {
        $id = $request->json('id');
        $money     =   $request->json('money',0);
        $point     =   $request->json('point',0);
        $remark    =   $request->json('remark');

        if (empty($remark)) {
            return $this->error('理由必需填写！');
        }

        // 开启事务
        DB::beginTransaction();
        try {
            $result = true;

            if (!empty($money)) {
                User::where('id',$id)->increment('money', $money);
            }

            if (!empty($point)) {
                User::where('id',$id)->increment('point', $point);
            }

            $data['adminid'] = ADMINID;
            $data['uid'] = $id;
            $data['money'] = $money;
            $data['point'] = $point;
            $data['type'] = 3;
            $data['remark'] = $remark;

            AccountLog::create($data);
            
            DB::commit();
        } catch (\Exception $e) {
            $result = false;
            DB::rollBack();
        }

        if ($result) {
            return $this->success('操作成功！','/user/index');
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
        $query = User::query();

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
