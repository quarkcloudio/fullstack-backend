<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Services\Helper;
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
use App\Builder\Forms\Controls\Icon;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use App\Models\Admin;
use App\Models\Menu;
use Spatie\Permission\Models\Permission;
use Validator;
use DB;

class MenuController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '菜单';
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
        $pageSize  = intval($request->get('pageSize',1000));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Menu::query()->where('menus.guard_name',$guardName);

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['query'])) {
                $query->where('menus.name','like','%'.$search['query'].'%');
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('menus.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->count();

        // 查询列表
        $lists = $query
        ->where('status', '>', 0)
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('sort', 'asc')
        ->orderBy('id', 'asc')
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

        foreach ($lists as $key => $list) {
            $status = $list['status'];

            switch ($status) {
                case -1:
                    $lists[$key]['status'] = '已删除';
                    break;
                case 1:
                    $lists[$key]['status'] = '正常';
                    break;
                case 2:
                    $lists[$key]['status'] = '已禁用';
                    break;
                case 3:
                    $lists[$key]['status'] = '待审核';
                    break;
                default:
                    $lists[$key]['status'] = '未知';
                    break;
            }

            if($list['show']) {
                $lists[$key]['show'] = '是';
            } else {
                $lists[$key]['show'] = '否';
            }

            if(empty($list['icon'])) {
                $lists[$key]['icon'] = '无';
            }

            $menuPermissions = Permission::where('menu_id',$list['id'])->get();

            $lists[$key]['permission_name'] = '';
            foreach ($menuPermissions as $key1 => $value1) {
                $lists[$key]['permission_name'] = $lists[$key]['permission_name'].$value1['name']."<br />";
            }
        }

        $menuTrees = Helper::listToTree($lists,'id','pid','children',0);

        $searchs = [
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('名称','name'),
            Column::make('排序','sort'),
            Column::make('图标','icon')->isIcon(),
            Column::make('路由','path'),
            //Column::make('权限url','permission_name'),
            Column::make('显示','show'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->onClick('openModal',['title'=>'新增'.$this->pageTitle,'width'=>500],'admin/'.$this->controllerName().'/create'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->onClick('openModal',['title'=>'编辑'.$this->pageTitle,'width'=>500],'admin/'.$this->controllerName().'/edit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $data = $this->listBuilder($columns,$menuTrees,$pagination,$searchs,[],$headerButtons,null,$actions);

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
        $menus = Menu::query()->where('guard_name','admin')
        ->orderBy('sort', 'asc')
        ->orderBy('id', 'asc')
        ->get()
        ->toArray();

        $menuTrees = Helper::listToTree($menus,'id','pid','children',0);

        $menuTreeLists = Helper::treeToOrderList($menuTrees,0,'name','children');

        $list = [];
        foreach ($menuTreeLists as $key => $menuTreeList) {
            $list[] = [
                'name'=>$menuTreeList['name'],
                'value'=>$menuTreeList['id'],
            ];
        }

        $permissions = Permission::all();

        $getPermissions = [];
        foreach ($permissions as $key => $permission) {
            $getPermissions[] = [
                'name'=>$permission['name'],
                'value'=>$permission['id'],
            ];
        }

        $controls = [
            ID::make('ID','id'),
            Input::make('名称','name')->style(['width'=>200]),
            Select::make('父节点','pid')->option($list)->style(['width'=>200]),
            InputNumber::make('排序','sort')->style(['width'=>200])->value(0),
            Icon::make('图标','icon')->style(['width'=>200]),
            Input::make('路由','path')->style(['width'=>200]),
            Select::make('绑定权限','permission_ids')->mode('tags')->option($getPermissions)->style(['width'=>350]),
            SwitchButton::make('显示','show')->checkedText('是')->unCheckedText('否')->value(true),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>350])
            ->onClick('submit',null,$action)
        ];

        $labelCol['sm'] = ['span'=>4];
        $wrapperCol['sm'] = ['span'=>20];

        $result = $this->formBuilder($controls,$data,$labelCol,$wrapperCol);

        return $result;
    }

    /**
    * 创建菜单
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
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $icon          =   $request->json('icon','');
        $path          =   $request->json('path');
        $permissionIds =   $request->json('permission_ids','');
        $show          =   $request->json('show');
        $status        =   $request->json('status','');
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($show == true) {
            $show = 1;
        } else {
            $show = 0; //隐藏
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['icon'] = $icon;
        $data['path'] = $path;
        $data['show'] = $show;
        $data['status'] = $status;

        $result = Menu::create($data);

        if($permissionIds) {
            Permission::whereIn('id',$permissionIds)->update(['menu_id' => $result['id']]);
        }

        if($result) {
            return $this->success('操作成功！');
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

        $data = Menu::find($id)->toArray();

        $permissionIds= Permission::where('menu_id',$id)->pluck('id');

        foreach ($permissionIds as $key => $value) {
            $data['permission_ids'][] = strval($value);
        }

        $data = $this->form($data);
        
        return $this->success('获取成功！','',$data);
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function save(Request $request)
    {
        $id            =   $request->json('id');
        $name          =   $request->json('name','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $icon          =   $request->json('icon','');
        $path          =   $request->json('path');
        $permissionIds =   $request->json('permission_ids','');
        $show          =   $request->json('show');
        $status        =   $request->json('status','');

        if (empty($id)) {
            return $this->error('请选择数据！');
        }
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($show == true) {
            $show = 1;
        } else {
            $show = 0; //隐藏
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['icon'] = $icon;
        $data['path'] = $path;
        $data['show'] = $show;
        $data['status'] = $status;

        $result = Menu::where('id',$id)->update($data);

        if($permissionIds) {

            // 先清空
            Permission::where('menu_id',$id)->update(['menu_id' => 0]);

            // 赋值
            Permission::whereIn('id',$permissionIds)->update(['menu_id' => $id]);
        }

        if ($result) {
            return $this->success('操作成功！');
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

        $result = Menu::destroy($id);

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
        $query = Menu::query();

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
        $query = Menu::query();

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
