<?php

namespace App\Http\Controllers\Admin;

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
use App\Builder\Tabs;
use App\Builder\TabPane;
use App\Models\Config;
use App\Services\Helper;
use DB;
use Cache;

class ConfigController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '配置';
    }

    /**
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function websiteForm($data = [])
    {
        $action = 'admin/'.$this->controllerName().'/saveWebsite';

        $groupNames = Config::query()
        ->where('status', 1)
        ->orderBy('id', 'asc')
        ->select(['group_name'])
        ->distinct()
        ->get();

        foreach ($groupNames as $key => $value) {

            // 查询列表
            $configs = Config::query()
            ->where('status', 1)
            ->where('group_name', $value['group_name'])
            ->orderBy('id', 'asc')
            ->get()
            ->toArray();

            $controls = [];

            foreach ($configs as $key1 => $config) {
                switch ($config['type']) {
                    case 'text':
                        $controls[] = Input::make($config['title'],$config['name'])
                        ->extra($config['remark'])
                        ->style(['width'=>400])
                        ->value($config['value']);
                        break;
                    case 'file':

                        $file = null;

                        if($config['value']) {
                            $file_id = $config['value'];
                            $file[0]['id'] =$file_id;
                            $file[0]['uid'] =$file_id;
                            $file[0]['name'] = Helper::getFile($file_id,'name');
                            $file[0]['url'] = Helper::getFile($file_id);
                        }
                    
                        $controls[] = File::make($config['title'],$config['name'])
                        ->extra($config['remark'])
                        ->value($file);
                        break;
                    case 'textarea':
                        $controls[] = TextArea::make($config['title'],$config['name'])
                        ->extra($config['remark'])
                        ->style(['width'=>400])
                        ->value($config['value']);
                        break;
                    case 'switch':
                        $controls[] = SwitchButton::make($config['title'],$config['name'])
                        ->extra($config['remark'])
                        ->checkedText('开启')
                        ->unCheckedText('关闭')
                        ->value(true);
                        break;
                    case 'picture':

                        $image= null;

                        if($config['value']) {
                            $image_id = $config['value'];
                            $image[0]['id'] =$image_id;
                            $image[0]['uid'] =$image_id;
                            $image[0]['name'] = Helper::getPicture($image_id,'name');
                            $image[0]['url'] = Helper::getPicture($image_id);
                        }
                    
                        $controls[] = Image::make($config['title'],$config['name'])
                        ->extra($config['remark'])
                        ->value($image);
                        break;
                    default:
                        # code...
                        break;
                }
            }

            $controls[] = Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action);

            $tabPane[] = TabPane::make($value['group_name'],$key+1)->controls($controls);
        }

        $tabs = Tabs::make('tab')->defaultActiveKey('1')->tabPanes($tabPane);

        $result = $this->formBuilder($tabs,$data);

        return $result;
    }

    /**
     * 网站设置
     *
     * @param  Request  $request
     * @return Response
     */
     public function website(Request $request)
     {
        $data = $this->websiteForm();

        return $this->success('获取成功！','',$data);
    }
     /**
    * 保存站点配置数据
    *
    * @param  Request  $request
    * @return Response
    */
    public function saveWebsite(Request $request)
    {

        $requestJson    =   $request->getContent();
        $requestData    =   json_decode($requestJson,true);

        $result = true;
        // 遍历插入数据
        foreach ($requestData as $key => $value) {
            // 修改时清空缓存
            Cache::pull($key);

            $config = Config::where('name',$key)->first();

            if(($config['type'] == 'file') || ($config['type'] == 'picture')) {
                if($value) {
                    $value = $value[0]['id'];
                } else {
                    $value = null;
                }
            }

            $getResult = Config::where('name',$key)->update(['value'=>$value]);
            if($getResult === false) {
                $result = false;
            }
        }

        if ($result) {
            return $this->success('操作成功！','');
        } else {
            return $this->error('操作失败！');
        }
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
        $search     = $request->get('search');
            
        // 定义对象
        $query = Config::query();

        // 查询
        if(!empty($search)) {

            // 标题
            if(isset($search['title'])) {
                if(!empty($search['title'])) {
                    $query->where('title',$search['title']);
                }
            }

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('name',$search['name']);
                }
            }

            // 备注
            if(isset($search['remark'])) {
                if(!empty($search['remark'])) {
                    $query->where('remark',$search['remark']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
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
        ->select('configs.*')
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
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('标题','title')->withA('admin/system/'.$this->controllerName().'/edit'),
            Column::make('名称','name'),
            Column::make('备注','remark'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/system/'.$this->controllerName().'/create'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->href('admin/system/'.$this->controllerName().'/edit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $lists = Helper::listsFormat($lists);

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

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

        $list = [
            [
                'name'=>'输入框',
                'value'=>'text',
            ],
            [
                'name'=>'文本域',
                'value'=>'textarea',
            ],
            [
                'name'=>'图片',
                'value'=>'picture',
            ],
            [
                'name'=>'文件',
                'value'=>'file',
            ],
            [
                'name'=>'开关',
                'value'=>'switch',
            ],
        ];

        $controls = [
            ID::make('ID','id'),
            Input::make('标题','title')->style(['width'=>200]),
            Select::make('表单类型','type')->option($list),
            Input::make('名称','name')->style(['width'=>200]),
            Input::make('分组名称','group_name')->style(['width'=>200]),
            TextArea::make('备注','remark')->style(['width'=>400]),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action)
        ];

        $result = $this->formBuilder($controls,$data);

        return $result;
    }

    /**
     * 创建页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function create()
    {
        $data = $this->form();
        return $this->success('获取成功！','',$data);
    }

    /**
     * 保存创建数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $title          =   $request->json('title');
        $type           =   $request->json('type');
        $name           =   $request->json('name');
        $groupName      =   $request->json('group_name');
        $value          =   $request->json('value');
        $remark         =   $request->json('remark');
        $status         =   $request->json('status');
       
        if (empty($name)) {
            return $this->error('配置名不能为空！');
        }

        $hasName = Config::where('name',$name)->first();

        if (!empty($hasName)) {
            return $this->error('配置名已经存在！');
        }
        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['type'] = $type;
        $data['name'] = $name;
        $data['group_name'] = $groupName;
        $data['value'] = $value;
        $data['remark'] = $remark;
        $data['status'] = $status;

        $result = Config::create($data);
        if ($result) {
            return $this->success('操作成功！','index');
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

        $data = Config::find($id)->toArray();

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
        $id             =   $request->json('id');
        $title          =   $request->json('title');
        $type           =   $request->json('type');
        $name           =   $request->json('name');
        $groupName      =   $request->json('group_name');
        $value          =   $request->json('value');
        $remark         =   $request->json('remark');
        $status         =   $request->json('status');
       
        if (empty($name)) {
            return $this->error('配置名不能为空！');
        }

        $hasName = Config::where('name',$name)->where('id','<>',$id)->first();

        if (!empty($hasName)) {
            return $this->error('配置名已经存在！');
        }
        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['type'] = $type;
        $data['name'] = $name;
        $data['group_name'] = $groupName;
        $data['value'] = $value;
        $data['remark'] = $remark;
        $data['status'] = $status;

        $result = Config::where('id',$id)->update($data);
        if ($result) {
            return $this->success('操作成功！','index');
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
        $query = Config::query();

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
     * 改变多个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeMultiStatus(Request $request)
    {
        $data = $request->input('data');
        $status = $request->input('status');

        foreach (json_decode($data,true) as $key => $value) {
            $ids[] = $value['id'];
        }

        if($status == -1) {
            $result = Config::destroy($ids);
        } else {
            $result = Config::whereIn('id',$ids)->update(['status'=>$status]);
        }

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }
    
}
