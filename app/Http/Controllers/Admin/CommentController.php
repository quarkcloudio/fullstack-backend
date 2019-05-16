<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Post;
use App\Models\Category;
use App\Models\Comment;
use DB;

class CommentController extends Controller
{
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
        $types=DB::table('comments')->select('type')->distinct()->get()->toArray();

        foreach ($types as $key => $value) {
            switch ($value->type) {
                case 'ARTICLE':
                    $types[$key]->typeT = '文章评论';
                    break;
                case 'PAGE':
                    $types[$key]->typeT = '单页评论';
                    break;
                case 'GROUPBUY':
                    $types[$key]->typeT = '订单评论';
                    break;
                default:
                    $types[$key]->typeT = '未知';
                    break;
            } 
        }

        foreach ($lists as $key => $value) {
            if(empty($value['title'])) {
                $lists[$key]['title'] = '暂无';
            }
        }

        // 模板数据
        $data['types']=$types;
        $data['lists'] = $this->commentListsFormat($lists);

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
        $coverIds = json_decode($comment['cover_ids'],true);
        if($coverIds) {
            foreach ($coverIds as $key => $value) {
                // 获取封面图列表
                $data['cover_list'][$key]['uid'] = $value;
                $data['cover_list'][$key]['name'] = Helper::getPicture($value,0,'name');
                $data['cover_list'][$key]['url'] = Helper::getPicture($value);
                $data['cover_list'][$key]['status'] = 'done';
            }
        } else {
            $data['cover_list'] = [];
            $comment['cover_path'] = Helper::getPicture($coverIds);
        }

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
        
        $data['comment'] = $comment;
        
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

        $result = Comment::destroy($id);

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
