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
use App\Services\Helper;
use App\Models\Printer;
use App\Models\Shop;
use Illuminate\Validation\Rule;
use Validator;
use DB;
use Cache;

class PrinterController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '打印机';
    }

    /**
     * 打印机列表页
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
        $query = Printer::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('printers.title','like','%'.$search['title'].'%');
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('printers.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('printers.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        $lists = $query
        ->where('printers.status', '>', 0)
        ->orderBy('printers.id', 'desc')
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
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('名称','name')->withA('admin/plugin/'.$this->controllerName().'/edit'),
            Column::make('手机卡号','phone'),
            Column::make('应用ID','client_id'),
            Column::make('应用密钥','client_secret'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('添加时间','created_at'),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/plugin/'.$this->controllerName().'/create'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->href('admin/plugin/'.$this->controllerName().'/edit'),
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

        $controls = [
            ID::make('ID','id'),
            Input::make('打印机名称','name')->style(['width'=>200]),
            Input::make('手机卡号','phone')->style(['width'=>200]),
            Input::make('应用ID','client_id')->style(['width'=>200]),
            Input::make('应用密钥','client_secret')->style(['width'=>200]),
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
        $name             =   $request->json('name','');
        $phone            =   $request->json('phone','');
        $client_id        =   $request->json('client_id');
        $client_secret    =   $request->json('client_secret');
        $status           =   $request->json('status');

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'name' => ['required','max:255'],
            'client_id' =>  ['required'],
            'client_secret' =>  ['required'],
        ];

        // 进行验证
        $validator = Validator::make($rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'name') {
                    $errorMsg = '标题'.$value[0];
                }
                if($key === 'client_id') {
                    $errorMsg = '应用ID'.$value[0];
                }
                if($key === 'client_secret') {
                    $errorMsg = '应用密钥'.$value[0];
                }
            }
            return $this->error($errorMsg);
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name'] = $name;
        $data['phone'] = $phone;
        $data['client_id'] = $client_id;
        $data['client_secret'] = $client_secret;
        $data['status'] = $status;

        $result = Printer::create($data);

        if($result) {
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
        $id = $request->input('id');

        $printer = Printer::find($id)->toArray();

        $data = $this->form($printer);

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
        $id               =   $request->json('id');
        $name             =   $request->json('name','');
        $phone            =   $request->json('phone','');
        $client_id        =   $request->json('client_id');
        $client_secret    =   $request->json('client_secret');
        $status           =   $request->json('status');

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'name' => ['required','max:255'],
            'client_id' =>  ['required'],
            'client_secret' =>  ['required'],
        ];

        // 进行验证
        $validator = Validator::make($rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'name') {
                    $errorMsg = '标题'.$value[0];
                }
                if($key === 'client_id') {
                    $errorMsg = '应用ID'.$value[0];
                }
                if($key === 'client_secret') {
                    $errorMsg = '应用密钥'.$value[0];
                }
            }
            return $this->error($errorMsg);
        }

        $data['name'] = $name;
        $data['phone'] = $phone;
        $data['client_id'] = $client_id;
        $data['client_secret'] = $client_secret;
        $data['status'] = $status;

        $result = Printer::where('id',$id)->update($data);
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
        $query = Printer::query();

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