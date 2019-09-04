<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
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
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use App\Models\Admin;
use App\Models\Navigation;
use Validator;
use DB;

class NavigationController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '导航';
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
        $pageSize  = intval($request->get('pageSize',1000));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Navigation::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['query'])) {
                $query->where('title','like','%'.$search['query'].'%');
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
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
            if($status == 1) {
                $lists[$key]['status'] = '正常';
            }

            if($status == 2) {
                $lists[$key]['status'] = '已禁用';
            }

            $lists[$key]['cover_path'] = Helper::getPicture($list['cover_id']);
        }

        $navigationTrees = Helper::listToTree($lists,'id','pid','children',0);

        $searchs = [
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('标题','title'),
            Column::make('排序','sort'),
            Column::make('图标','cover_path')->isImage(),
            Column::make('url','url'),
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

        $data = $this->listBuilder($columns,$navigationTrees,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
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
        $navigations = Navigation::where('status',1)->get()->toArray();
        $navigationTrees     = Helper::listToTree($navigations);
        $navigationTreeLists = Helper::treeToOrderList($navigationTrees,0,'title');

        // 模板数据
        $list = [];

        $list[0]['name'] = '请选择父节点';
        $list[0]['value'] = '0';

        foreach ($navigationTreeLists as $key => $navigationTreeList) {
            $list[$key+1]['name'] = $navigationTreeList['title'];
            $list[$key+1]['value'] = $navigationTreeList['id'];
        }

        $controls = [
            ID::make('ID','id'),
            Input::make('标题','title')->style(['width'=>200]),
            Select::make('父节点','pid')->option($list),
            Input::make('链接','url')->style(['width'=>200]),
            Image::make('图标','cover_id'),
            InputNumber::make('排序','sort')->style(['width'=>200])->value(0),
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
        $title         =   $request->json('title','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $url           =   $request->json('url','');
        $coverId       =   $request->json('cover_id');
        $status        =   $request->json('status','');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        if($coverId) {
            $coverId = $coverId[0]['id'];
        } else {
            $coverId = 0;
        }

        $data['title'] = $title;
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['status'] = $status;

        $result = Navigation::create($data);

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

        $data = Navigation::find($id)->toArray();

        $cover_id = $data['cover_id'];

        unset($data['cover_id']);

        $data['cover_id'][0]['id'] =$cover_id;
        $data['cover_id'][0]['uid'] =$cover_id;
        $data['cover_id'][0]['name'] = Helper::getPicture($cover_id,'name');
        $data['cover_id'][0]['url'] = Helper::getPicture($cover_id);

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
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
        $title         =   $request->json('title','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $url           =   $request->json('url');
        $coverId       =   $request->json('cover_id');
        $status        =   $request->json('status','');

        if (empty($id)) {
            return $this->error('请选择数据！');
        }
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        if($coverId) {
            $coverId = $coverId[0]['id'];
        } else {
            $coverId = 0;
        }

        $data['title'] = $title;
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['status'] = $status;

        $result = Navigation::where('id',$id)->update($data);

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
        $query = Navigation::query();

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
