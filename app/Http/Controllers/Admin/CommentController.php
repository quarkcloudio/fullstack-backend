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
use EasyWeChat\Factory;
use App\Models\Post;
use App\Models\Category;
use App\Models\Comment;
use DB;

class CommentController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '评论';
    }

    /**
     * 评论列表页
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
        $query = Comment::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('comments.title','like','%'.$search['title'].'%');
            }

            // 类型
            if(isset($search['typeid'])) {
                if(!empty($search['typeid'])) {
                    $query->where('comments.type',$search['typeid']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('comments.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('comments.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
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

        //获取类型
        $commentTypes = DB::table('comments')->select('type')->distinct()->get()->toArray();

        $types[] = [
            'name'=>'所有类型',
            'value'=>'0',
        ];

        foreach ($commentTypes as $key => $value) {
            switch ($value->type) {
                case 'ARTICLE':
                    $types[] = [
                        'name'=>'文章评论',
                        'value'=>'ARTICLE',
                    ];
                    break;
                case 'PAGE':
                    $types[] = [
                        'name'=>'单页评论',
                        'value'=>'PAGE',
                    ];
                    break;
                case 'GROUPBUY':
                    $types[] = [
                        'name'=>'团购评论',
                        'value'=>'GROUPBUY',
                    ];
                    break;
                default:
                    $types[] = [
                        'name'=>'未知',
                        'value'=>'WEIZHI',
                    ];
                    break;
            } 
        }

        foreach ($lists as $key => $value) {
            if(empty($value['title'])) {
                $lists[$key]['title'] = '暂无';
            }
        }

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
            Select::make('评论类型','types')->option($types)->value('0'),
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $advancedSearchs = [
            Select::make('评论类型','types')->option($types)->value('0'),
            RangePicker::make('评论时间','created_at')->format("YYYY-MM-DD HH:mm:ss"),
            Select::make('状态','status')->option($status)->value('0'),
            Button::make('搜索')->type('primary')->onClick('search'),
            Button::make('重置')->onClick('resetSearch'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('评论对象','object_title')->withA('admin/plugin/'.$this->controllerName().'/edit'),
            Column::make('类型','type'),
            Column::make('用户','uid'),
            Column::make('评论标题','title'),
            Column::make('内容','content'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('评论时间','created_at'),
        ];

        $headerButtons = [
            Button::make('刷新')->icon('reload')->type('default')->href('admin/plugin/'.$this->controllerName().'/index'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->href('admin/plugin/'.$this->controllerName().'/edit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $lists = $this->commentListsFormat($lists);

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,$advancedSearchs,$headerButtons,null,$actions);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }   
    }

    /**
     * 格式化数据
     */
    public function commentListsFormat($lists)
    {
        if($lists) {
            foreach ($lists as $key => $value) {
                //格式化状态
                switch ($value['status']) {
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
                //格式化评论类型
                switch ($value['type']) {
                    case 'ARTICLE':
                        $lists[$key]['type'] = '文章评论';

                        // 评论对象标题
                        $post = Post::where('id',$value['object_id'])->first();
                        if($post['title']) {
                            $lists[$key]['object_title'] = $post['title'];
                        } else {
                            $lists[$key]['object_title'] = '暂无';
                        }
                        break;
                    case 'PAGE':
                        $lists[$key]['type'] = '单页评论';

                        // 评论对象标题
                        $post = Post::where('id',$value['object_id'])->first();
                        if($post['title']) {
                            $lists[$key]['object_title'] = $post['title'];
                        } else {
                            $lists[$key]['object_title'] = '暂无';
                        }
                        break;
                    case 'GROUPBUY':
                        $lists[$key]['type'] = '订单评论';
                        $lists[$key]['object_title'] = '暂无';
                        break;
                    default:
                        $lists[$key]['type'] = '未知';
                        $lists[$key]['object_title'] = '暂无';
                        break;
                }  
                //格式化用户ID
                $users=DB::table('users')->where('id',$value['uid'])->get();
                foreach($users as $user){
                    $lists[$key]['uid']=$user->name;
                }
            }
        }

        return $lists;
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
            Input::make('标题','title')->style(['width'=>200]),
            Image::make('晒图','cover_ids')->mode('multiple'),
            Input::make('类型','type')->style(['width'=>200]),
            Input::make('内容','content')->style(['width'=>200]),
            InputNumber::make('顶','ding')->style(['width'=>200]),
            Input::make('举报','report')->style(['width'=>200]),
            Input::make('评分','rate')->style(['width'=>200]),
            DatePicker::make('评论时间','created_at')->format("YYYY-MM-DD HH:mm:ss"),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action),
        ];

        $result = $this->formBuilder($controls,$data);

        return $result;
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

        $comment = Comment::find($id);

        //获取图片
        $comment['cover_ids'] = json_decode($comment['cover_ids'],true);

        switch ($comment['type']) {
            case 'ARTICLE':
                $comment['type'] = '文章评论';
                break;
            case 'PAGE':
                $comment['type'] = '单页评论';
                break;
            case 'GROUPBUY':
                $comment['type'] = '订单评论';
                break;
            default:
                $comment['type'] = '未知';
                break;
        }  
        
        switch ($comment['report']) {
            case '0':
                $comment['report'] = '暂无举报';
                break;
            case '1':
                $comment['report'] = '淫秽色情';
                break;
            case '2':
                $comment['report'] = '垃圾广告';
                break;
            case '3':
                $comment['report'] = '违法信息';
                break;
            default:
                $comment['report'] = '未知';
                break;
        }
        
        $data = $this->form($comment);
        
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
        $id      =   $request->json('id');
        $status  =   $request->json('status');

        $comment = Comment::find($id);

        if ($status == 'on') {
            $status = 1;
            $this->updateCommentNum($comment,'increment');
        } else {
            $status = 2; //禁用
            $this->updateCommentNum($comment,'decrement');
        }
       
        $data['status'] = $status;

        $result = Comment::where('id',$id)->update($data);

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
        $query = Comment::query();

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
     * 更新对象评论数量
     *
     * @param  Request  $request
     * @return Response
     */
    protected function updateCommentNum($comment,$type)
    {
        if($type == 'increment') {

            // 评论对象评论数量增加
            switch ($comment['type']) {
                case 'ARTICLE':
                    Post::where('id',$comment['object_id'])->increment('comment',1);
                    break;
                
                default:
                    return $this->error('参数错误！');
                    break;
            }
        } elseif($type == 'decrement') {

            // 评论对象评论数量减少
            switch ($comment['type']) {
                case 'ARTICLE':
                    Post::where('id',$comment['object_id'])->decrement('comment',1);
                    break;
                
                default:
                    return $this->error('参数错误！');
                    break;
            }
        }
    }
}
