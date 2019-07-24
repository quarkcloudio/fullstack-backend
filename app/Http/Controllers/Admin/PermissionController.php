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
use App\Models\Admin;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Menu;
use Validator;
use DB;
use Route;

class PermissionController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '权限';
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
        $query = Permission::query()->where('guard_name',$guardName);

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['name'])) {
                $query->where('name','like','%'.$search['name'].'%');
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
            if(isset($menu->title)) {
                $lists[$key]['title'] = $menu->title;
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
            Column::make('名称','name'),
            Column::make('guard名称','guard_name'),
            Column::make('创建时间','created_at'),
        ];

        $headerButtons = [
            Button::make('同步'.$this->pageTitle)->icon('sync')->type('primary')->onClick('submit',null,'admin/'.$this->controllerName().'/store'),
        ];

        $toolbarButtons = [
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $actions = [
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,$toolbarButtons,$actions);
        
        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 同步权限
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $routes = Route::getRoutes();

        foreach($routes as $route) {
            // 只处理后台接口
            if(strpos($route->uri,'api/admin') !== false) {
                $hasPermission = Permission::where('name',$route->uri)->first();
                if(empty($hasPermission)) {
                    $data['name'] = $route->uri;
                    $data['guard_name'] = 'admin';
                    $result = Permission::create($data);
                }
                $urls[] = $route->uri;
            }
        }

        // 清除废弃url
        Permission::whereNotIn('name',$urls)->delete();

        return $this->success('操作成功！');
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
        $query = Permission::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->delete();

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

}
