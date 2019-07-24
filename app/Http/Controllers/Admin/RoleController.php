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
use App\Builder\Forms\Controls\Tree;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use App\Models\Admin;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Menu;
use Validator;
use DB;
use Cache;

class RoleController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '角色';
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
        $guardName = $request->get('guardName','admin');
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Role::query()->where('guard_name',$guardName);

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['query'])) {
                $query->where('name','like','%'.$search['query'].'%');
            }
        }

        // 查询数量
        $total = $query
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($lists as $key => $list) {
            $menu = Menu::where('path',$list['name'])->where('guard_name','admin')->first();
            if(isset($menu->name)) {
                $lists[$key]['title'] = $menu->name;
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $searchs = [
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('名称','name')->withA('admin/admin/'.$this->controllerName().'/edit'),
            Column::make('guard名称','guard_name'),
            Column::make('创建时间','created_at'),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/admin/'.$this->controllerName().'/create'),
        ];

        $toolbarButtons = [
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $actions = [
            Button::make('编辑')->type('link')->href('admin/admin/'.$this->controllerName().'/edit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,$toolbarButtons,$actions);
        
        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
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
        $menus = Menu::where('status',1)->where('guard_name','admin')->select('name as title','id as key','pid')->get()->toArray();

        $menus = Helper::listToTree($menus,'key','pid','children',0);

        $controls = [
            ID::make('ID','id'),
            Input::make('名称','name')->style(['width'=>200]),
            Tree::make('权限','menuIds')->list($menus),
            $controls[] = Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action)
        ];

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
        $name          =   $request->json('name','');
        $menuIds       =   $request->json('menuIds');
        
        if (empty($name)) {
            return $this->error('角色名称必须填写！');
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';

        // 添加角色
        $role = Role::create($data);

        // 根据菜单id获取所有权限
        $permissions = Permission::whereIn('menu_id',$menuIds)->pluck('id')->toArray();

        // 同步权限
        $result = $role->syncPermissions(array_filter(array_unique($permissions)));

        if ($result) {
            return $this->success('操作成功！','/admin/role/index');
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

        // 所有菜单
        $menus = Menu::where('status',1)->where('guard_name','admin')->select('name as title','id as key','pid')->get()->toArray();

        $data = Role::find($id);

        $checkedMenus = [];

        foreach ($menus as $key => $menu) {
            $permissionIds = Permission::where('menu_id',$menu['key'])->pluck('id');

            $roleHasPermission = DB::table('role_has_permissions')
            ->whereIn('permission_id',$permissionIds)
            ->where('role_id',$data['id'])
            ->first();

            if($roleHasPermission) {
                $checkedMenus[] = strval($menu['key']);
            }

            $menus[$key]['key'] = strval($menu['key']);
        }

        $data['menuIds'] = $checkedMenus;

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
        $id            =   $request->json('id','');
        $name          =   $request->json('name','');
        $menuIds       =   $request->json('menuIds');
        
        if (empty($id)) {
            return $this->error('参数错误！');
        }

        if (empty($name)) {
            return $this->error('角色名称必须填写！');
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';

        // 更新角色
        $result = Role::where('id',$id)->update($data);

        // 根据菜单id获取所有权限
        $permissions = Permission::whereIn('menu_id',$menuIds)->pluck('id')->toArray();

        // 同步权限
        $result1 = Role::where('id',$id)->first()->syncPermissions(array_filter(array_unique($permissions)));

        if ($result && $result1) {
            return $this->success('操作成功！','/admin/role/index');
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
    public function changeStatus(Request $request)
    {
        $id = $request->json('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $result = Role::destroy($id);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

}
