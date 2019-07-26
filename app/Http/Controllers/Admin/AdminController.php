<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Builder\Forms\Controls\ID;
use App\Builder\Forms\Controls\Input;
use App\Builder\Forms\Controls\Text;
use App\Builder\Forms\Controls\TextArea;
use App\Builder\Forms\Controls\InputNumber;
use App\Builder\Forms\Controls\Checkbox;
use App\Builder\Forms\Controls\Radio;
use App\Builder\Forms\Controls\Select;
use App\Builder\Forms\Controls\SwitchButton;
use App\Builder\Forms\Controls\DatePicker;
use App\Builder\Forms\Controls\RangePicker;
use App\Builder\Forms\Controls\Editor;
use App\Builder\Forms\Controls\Image;
use App\Builder\Forms\Controls\File;
use App\Builder\Forms\Controls\Button;
use App\Builder\Forms\Controls\Popconfirm;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Admin;
use Spatie\Permission\Models\Role;
use App\Models\Category;
use App\Models\AccountLog;
use Validator;
use DB;

class AdminController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '管理员';
    }

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

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $searchs = [
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','username'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('用户名','username')->withA('admin/'.$this->controllerName().'/user/edit'),
            Column::make('昵称','nickname'),
            Column::make('邮箱','email'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('注册时间','created_at'),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/'.$this->controllerName().'/user/create'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->href('admin/'.$this->controllerName().'/user/edit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $lists = Helper::listsFormat($lists);

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function form($data = [])
    {
        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/save';
        } else {
            $action = 'admin/'.$this->controllerName().'/store';
        }

        // 查询列表
        $roles = Role::where('guard_name','admin')->get()->toArray();

        $checkboxList = [];
        foreach ($roles as $key => $role) {
            $checkboxList[] = [
                'name'=>$role['name'],
                'value'=>$role['id'],
            ];
        }

        $controls = [
            ID::make('ID','id'),
            Input::make('用户名','username')->style(['width'=>200]),
            Checkbox::make('角色','roleIds')->list($checkboxList),
            Input::make('昵称','nickname')->style(['width'=>200]),
            Input::make('邮箱','email')->style(['width'=>200]),
            Input::make('密码','password')->style(['width'=>200])->type('password'),
            Input::make('手机号','phone')->style(['width'=>200]),
        ];

        if(isset($data['id'])) {

            if(empty($data['last_login_ip'])) {
                $data['last_login_ip'] = '暂无';
            }
    
            if(empty($data['last_login_time'])) {
                $data['last_login_time'] = '暂无';
            }

            if(empty($data['created_at'])) {
                $data['created_at'] = '暂无';
            }
            $controls[] = Text::make('注册时间')->style(['width'=>200])->value($data['created_at']);
            $controls[] = Text::make('登录时间')->style(['width'=>200])->value($data['last_login_time']);
            $controls[] = Text::make('登录IP')->style(['width'=>200])->value($data['last_login_ip']);
        }

        $controls[] = SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true);
        $controls[] = Button::make('提交')
        ->type('primary')
        ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
        ->onClick('submit',null,$action);

        $result = $this->formBuilder($controls,$data);

        return $result;
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {
        $data = $this->form();
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

        if(!isset($requestData['roleIds'])) {
            return $this->error('请选择角色');
        }

        $roleIds        =   $requestData['roleIds'];
        // 删除modelName
        unset($requestData['actionUrl']);
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

        $data = Admin::find($id);

        unset($data['password']);

        // 查询列表
        $roles = Role::where('guard_name','admin')->get()->toArray();

        $checkedRoles = [];

        foreach ($roles as $key => $role) {
            $hasRole = $data->hasRole($role['name']);
            if($hasRole) {
                $checkedRoles[] = $role['id'];
            }
        }

        $data = $data->toArray();

        $data['roleIds'] = $checkedRoles;

        $data = $this->form($data);

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

        if(!isset($requestData['roleIds'])) {
            return $this->error('请选择角色');
        }

        $roleIds        =   $requestData['roleIds'];

        // 删除modelName
        unset($requestData['actionUrl']);
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

}
