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
use App\Builder\Tabs;
use App\Builder\TabPane;
use App\Models\Post;
use App\Models\Category;

class ArticleController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '文章';
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
        $query = Post::query();

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
        }

        // 查询数量
        $total = $query
        ->where('posts.status', '>', 0)
        ->where('posts.type', 'ARTICLE')
        ->count();

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if(empty($value['name'])) {
                $lists[$key]['name'] = '暂无';
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

        $categorys         = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        $getCategorys = [];

        $getCategorys[0]['name'] = '所有分类';
        $getCategorys[0]['value'] = '0';

        foreach ($categoryTreeLists as $key => $categoryTreeList) {
            $getCategorys[$key+1]['name'] = $categoryTreeList['title'];
            $getCategorys[$key+1]['value'] = $categoryTreeList['id'];
        }

        $lists = Helper::listsFormat($lists);

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
            Select::make('分类','categorys')->option($getCategorys)->value('0'),
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('标题','title')->withA('admin/'.$this->controllerName().'/edit'),
            Column::make('作者','author'),
            Column::make('分类','category_title'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('发布时间','created_at'),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs);

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
        $categorys         = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
        $getCategorys = [];

        $getCategorys[0]['name'] = '请选择分类';
        $getCategorys[0]['value'] = '0';

        foreach ($categoryTreeLists as $key => $categoryTreeList) {
            $getCategorys[$key+1]['name'] = $categoryTreeList['title'];
            $getCategorys[$key+1]['value'] = $categoryTreeList['id'];
        }

        $checkboxList = [
            [
                'name'=>'首页推荐',
                'value'=>1,
            ],
            [
                'name'=>'频道推荐',
                'value'=>2,
            ],
            [
                'name'=>'列表推荐',
                'value'=>4,
            ],
            [
                'name'=>'详情推荐',
                'value'=>8,
            ],
        ];

        $radioList = [
            [
                'name'=>'无图',
                'value'=>1,
            ],
            [
                'name'=>'单图（小）',
                'value'=>2,
            ],
            [
                'name'=>'多图',
                'value'=>3,
            ],
            [
                'name'=>'单图（大）',
                'value'=>4,
            ],
        ];

        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/save';
        } else {
            $action = 'admin/'.$this->controllerName().'/store';
        }

        $baseControls = [
            ID::make('ID','id'),
            Input::make('标题','title')->style(['width'=>400]),
            TextArea::make('描述','description')->style(['width'=>400]),
            Input::make('标签','tags')->style(['width'=>400]),
            Input::make('作者','author')->style(['width'=>200]),
            Input::make('来源','source')->style(['width'=>200]),
            Checkbox::make('推荐位','position')->list($checkboxList),
            Radio::make('展现形式','show_type')->list($radioList)->value(1),
            Image::make('封面图','cover_ids')->mode('multiple'),
            Select::make('分类','category_id')->style(['width'=>200])->option($getCategorys)->value('0'),
            SwitchButton::make('允许评论','comment_status')->checkedText('是')->unCheckedText('否')->value(true),
            Editor::make('内容','content'),
            DatePicker::make('创建时间','created_at')->format("YYYY-MM-DD HH:mm:ss"),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action),
        ];

        $extendControls = [
            Input::make('别名','name')->style(['width'=>200]),
            InputNumber::make('排序','level')->extra('越大越靠前')->max(10000)->value(1),
            InputNumber::make('浏览量','view')->value(0),
            InputNumber::make('评论量','comment')->value(0),
            Input::make('访问密码','password')->style(['width'=>200]),
            File::make('附件','file_id'),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action),
        ];

        $tabPane = [
            TabPane::make('基本',1)->controls($baseControls),
            TabPane::make('扩展',2)->controls($extendControls)
        ];

        $tabs = Tabs::make('tab')->defaultActiveKey(1)->tabPanes($tabPane);

        $result = $this->formBuilder($tabs,$data);

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

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $title          =   $request->json('title','');
        $description    =   $request->json('description','');
        $categoryId     =   $request->json('category_id',0);
        $tags           =   $request->json('tags','');
        $commentStatus  =   $request->json('comment_status');
        $content        =   $request->json('content','');
        $createdAt      =   $request->json('created_at');
        $name           =   $request->json('name','');
        $author         =   $request->json('author','');
        $source         =   $request->json('source','');
        $level          =   $request->json('level',0);
        $comment        =   $request->json('comment',0);
        $view           =   $request->json('view',0);
        $password       =   $request->json('password');
        $position       =   $request->json('position',0);
        $showType       =   $request->json('show_type');
        $coverIds       =   $request->json('cover_ids',0);
        $fileId         =   $request->json('file_id',0);
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if($fileId) {
            $fileId = $fileId[0]['id'];
        } else {
            $fileId = 0;
        }

        if ($commentStatus == true) {
            $commentStatus = 'open';
        } else {
            $commentStatus = 'close'; //禁用
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['description'] = $description;
        $data['adminid'] = ADMINID;
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['comment_status'] = $commentStatus;
        $data['content'] = $content;
        $data['created_at'] = $createdAt;
        $data['name'] = $name;
        $data['author'] = $author;
        $data['source'] = $source;
        $data['level'] = $level;
        $data['comment'] = $comment;
        $data['view'] = $view;
        $data['password'] = $password;
        $data['show_type'] = $showType;
        $data['position'] = collect($position)->sum();
        $data['cover_ids'] = json_encode($coverIds);
        $data['file_id'] = $fileId;
        $data['status'] = $status;
        $data['type'] = 'ARTICLE';

        $result = Post::create($data);

        if($result) {
            return $this->success('操作成功！','/article/index');
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

        $data = Post::find($id)->toArray();

        $data['cover_ids'] = json_decode($data['cover_ids'],true);

        $fileId = $data['file_id'];

        unset($data['file_id']);

        $data['file_id'][0]['id'] =$fileId;
        $data['file_id'][0]['uid'] =$fileId;
        $data['file_id'][0]['name'] = Helper::getFile($fileId,'name');
        $data['file_id'][0]['url'] = Helper::getFile($fileId);

        $position = [];

        if(in_array($data['position'], [1,3,5,7,9,15])) {
            $position[] = 1;
        }

        if(in_array($data['position'], [2,3,6,7,9,10,14,15])) {
            $position[] = 2;
        }

        if(in_array($data['position'], [4,5,6,7,12,13,14,15])) {
            $position[] = 4;
        }

        if(in_array($data['position'], [8,9,10,11,12,13,14,15])) {
            $position[] = 8;
        }

        $data['position'] = $position;

        if ($data['comment_status'] == 'open') {
            $data['comment_status'] = true;
        } else {
            $data['comment_status'] = false;
        }

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }

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
        $id             =   $request->json('id');
        $title          =   $request->json('title','');
        $description    =   $request->json('description','');
        $categoryId     =   $request->json('category_id',0);
        $tags           =   $request->json('tags','');
        $commentStatus  =   $request->json('comment_status');
        $content        =   $request->json('content','');
        $createdAt      =   $request->json('created_at');
        $name           =   $request->json('name','');
        $author         =   $request->json('author','');
        $level          =   $request->json('level',0);
        $comment        =   $request->json('comment',0);
        $view           =   $request->json('view',0);
        $password       =   $request->json('password');
        $position       =   $request->json('position',0);
        $showType       =   $request->json('show_type');
        $coverIds       =   $request->json('cover_ids',0);
        $fileId         =   $request->json('file_id',0);
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if ($commentStatus == true) {
            $commentStatus = 'open';
        } else {
            $commentStatus = 'close';
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['description'] = $description;
        $data['adminid'] = ADMINID;
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['comment_status'] = $commentStatus;
        $data['content'] = $content;
        $data['created_at'] = $createdAt;
        $data['name'] = $name;
        $data['author'] = $author;
        $data['level'] = $level;
        $data['comment'] = $comment;
        $data['view'] = $view;
        $data['password'] = $password;
        $data['show_type'] = $showType;
        $data['position'] = collect($position)->sum();
        $data['cover_ids'] = json_encode($coverIds);
        $data['file_id'] = json_encode($fileId);
        $data['status'] = $status;
        $data['type'] = 'ARTICLE';

        $result = Post::where('id',$id)->update($data);
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
        $query = Post::query();

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
        $query = Post::query();

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

    /**
     * 我发布的文章列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function myPublished(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Post::query();

        if(ADMINID) {
            $query->where('posts.adminid',ADMINID);
        }

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
        }

        // 查询数量
        $total = $query
        ->where('posts.status', '>', 0)
        ->where('posts.type', 'ARTICLE')
        ->count();

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if(empty($value['name'])) {
                $lists[$key]['name'] = '暂无';
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

        $categorys         = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        $getCategorys = [];

        $getCategorys[0]['name'] = '所有分类';
        $getCategorys[0]['value'] = '0';

        foreach ($categoryTreeLists as $key => $categoryTreeList) {
            $getCategorys[$key+1]['name'] = $categoryTreeList['title'];
            $getCategorys[$key+1]['value'] = $categoryTreeList['id'];
        }

        $lists = Helper::listsFormat($lists);

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
            Select::make('分类','categorys')->option($getCategorys)->value('0'),
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('标题','title')->withA('admin/article/edit'),
            Column::make('作者','author'),
            Column::make('分类','category_title'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('发布时间','created_at'),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

}
