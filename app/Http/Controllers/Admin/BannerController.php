<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
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
use App\Models\BannerCategory;
use App\Models\Banner;
use Illuminate\Validation\Rule;
use Validator;
use Hash;
use DB;

class BannerController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '广告';
    }

    /**
     * 列表页
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
        $query = Banner::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('banners.title','like','%'.$search['title'].'%');
            }
            
            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('banners.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('banners.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('banners.deadline', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        // 查询列表
        $lists = $query
        ->join('banner_categories', 'banners.category_id', '=', 'banner_categories.id')
        ->leftjoin('pictures', 'pictures.id', '=', 'banners.cover_id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('banners.status', '>', 0)
        ->orderBy('banners.sort', 'desc')
        ->orderBy('banners.id', 'desc')
        ->select('banners.*','banner_categories.title as category_title','pictures.path')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if($value['cover_id']) {
                $lists[$key]['cover_path'] = Helper::getPicture($value['cover_id']);
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
            Column::make('标题','title')->withA('admin/'.$this->controllerName().'/banner/edit'),
            Column::make('排序','sort'),
            Column::make('位置','category_title'),
            Column::make('图片','cover_path')->isImage(),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/'.$this->controllerName().'/banner/create'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->href('admin/'.$this->controllerName().'/banner/edit'),
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
        $categorys = BannerCategory::all();

        $list = [];
        foreach ($categorys as $key => $category) {
            $list[] = [
                'name'=>$category['title'],
                'value'=>$category['id'],
            ];
        }

        $controls = [
            ID::make('ID','id'),
            Input::make('标题','title')->style(['width'=>200]),
            Select::make('分类','category_id')->option($list)->style(['width'=>400]),
            Input::make('链接','url')->style(['width'=>200])->style(['width'=>400]),
            Image::make('封面图','cover_id'),
            InputNumber::make('排序','sort')->style(['width'=>200])->value(0),
            DatePicker::make('截止时间','deadline')->format("YYYY-MM-DD HH:mm:ss")->value(null),
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
        $title          =   $request->json('title');
        $categoryId     =   $request->json('category_id','');
        $url            =   $request->json('url','');
        $coverId        =   $request->json('cover_id');
        $sort           =   $request->json('sort','');
        $deadline       =   $request->json('deadline');
        $status         =   $request->json('status');
        
        if($coverId) {
            $coverId = $coverId[0]['id'];
        } else {
            return $this->error('请上传图片！');
        }

        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'title' => ['required','max:255'],
            'url' =>  ['required','url','max:255'],
        ];

        // 进行验证
        $validator = Validator::make($rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'title') {
                    $errorMsg = '标题'.$value[0];
                }
                if($key === 'url') {
                    $errorMsg = '链接'.$value[0];
                }
            }
            return $this->error($errorMsg);
        }

        if (empty($categoryId)) {
            return $this->error('请选择位置！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['category_id'] = $categoryId;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['sort'] = $sort;
        $data['deadline'] = $deadline;
        $data['status'] = $status;

        $result = Banner::create($data);
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
        $id = $request->input('id');

        $data = Banner::find($id)->toArray();

        if(empty($data['deadline'])) {
            $data['deadline'] = date('Y-m-d H:i:s',strtotime($data['deadline']));;
        }
        
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
        $id             =   $request->json('id');
        $title          =   $request->json('title');
        $categoryId     =   $request->json('category_id','');
        $url            =   $request->json('url','');
        $coverId        =   $request->json('cover_id',0);
        $sort           =   $request->json('sort','');
        $deadline       =   $request->json('deadline');
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择位置！');
        }

        if($coverId) {
            $coverId = $coverId[0]['id'];
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['category_id'] = $categoryId;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['sort'] = $sort;
        $data['deadline'] = $deadline;
        $data['status'] = $status;

        $result = Banner::where('id',$id)->update($data);
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
        $query = Banner::query();

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
