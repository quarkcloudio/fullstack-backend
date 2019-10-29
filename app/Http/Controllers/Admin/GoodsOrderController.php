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
use App\Models\Goods;
use App\Models\Category;
use App\Models\Order;
use App\Models\GoodsOrder;
use App\Models\GoodsOrderDetail;
use DB;

class GoodsOrderController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '订单评论';
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
        $query = Comment::where('comments.type','ORDER');

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('comments.title','like','%'.$search['title'].'%');
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
        ->orderBy('comments.id', 'desc')
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

        $advancedSearchs = [
            RangePicker::make('评论时间','created_at')->format("YYYY-MM-DD HH:mm:ss"),
            Select::make('状态','status')->option($status)->value('0'),
            Button::make('搜索')->type('primary')->onClick('search'),
            Button::make('重置')->onClick('resetSearch'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('评论对象','object_title')->withA('admin/mall/goodsOrder/commentEdit'),
            Column::make('用户','uid'),
            Column::make('评论标题','title'),
            Column::make('内容','content'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('评论时间','created_at'),
        ];

        $headerButtons = [
            Button::make('刷新')->icon('reload')->type('default')->href('admin/mall/goodsOrder/commentIndex'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/commentChangeStatus'),
            Button::make('编辑')->type('link')->href('admin/mall/goodsOrder/commentEdit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/commentChangeStatus'),
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
     * form页面模板
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
            Text::make('评论对象','object_title')->style(['width'=>400])->value($data['object_title']),
            Text::make('标题','title')->style(['width'=>400])->value($data['title']),
            Image::make('晒图','cover_ids')->mode('multiple')->rule('1111'),
            Text::make('内容','content')->style(['width'=>400])->value($data['content']),
            Text::make('顶','ding')->style(['width'=>200])->value($data['ding']),
            Text::make('举报','report')->style(['width'=>200])->value($data['report']),
            Text::make('评分','rate')->style(['width'=>200])->value($data['rate']),
            Text::make('评论时间')->style(['width'=>200])->value($data['created_at']),
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
    public function commentEdit(Request $request)
    {
        $id = $request->input('id');

        $comment = Comment::find($id)->toArray();

        //评论对象
        $goods =  Goods::find($comment['object_id']);
        if($goods['goods_name']) {
            $comment['object_title'] = $goods['goods_name'];
        } else {
            $comment['object_title'] = '暂无';
        }
        
        //获取图片
        $cover_ids = json_decode($comment['cover_ids'],true);
        unset($comment['cover_ids']);
        foreach($cover_ids as $key=>$cover_id) {
            $comment['cover_ids'][$key]['id'] =$cover_id;
            $comment['cover_ids'][$key]['uid'] =$cover_id;
            $comment['cover_ids'][$key]['name'] = Helper::getPicture($cover_id,'name');
            $comment['cover_ids'][$key]['url'] = Helper::getPicture($cover_id);
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

        if ($comment['status'] == 1) {
            $comment['status'] = true;
        } else {
            $comment['status'] = false;
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

        $comment = Comment::find($id)->toArray();

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }
       
        $data['status'] = $status;

        $result = Comment::where('id',$id)->update($data);

        if ($result) {
            return $this->success('操作成功！','CommentIndex');
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
}
