<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Comment;
use App\Models\Post;
use App\User;
use App\Services\Helper;
use Session;

class CommentController extends Controller
{
	/**
     * 根据对象获取评论列表
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $page       = $request->input('page',1);
        $limit      = $request->input('limit',10);
        $type       = $request->input('type');
        $objectId   = $request->input('objectId');

        // 定义对象
        $comments = Comment::where('type', $type)
        ->where('status',1)
        ->where('pid',0)
        ->where('object_id',$objectId)
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($comments as $key => $comment) {

            // 获取评论用户昵称
            $user = User::where('id',$comment['uid'])->first();
            $comments[$key]['nickname'] = $user->nickname;

            // 官方回复
            $replys = Comment::where('type', $type)
            ->where('status',1)
            ->where('pid',$comment['id'])
            ->get();
            $comments[$key]['replys'] = $replys;

            // 时间格式化
            $comments[$key]['created_at'] = date("Y/m/d H:i:s",strtotime($comment['created_at']));
        }

        $data = Helper::mobileAdaptor($comments);

        $count = Comment::where('type', $type)
        ->where('status',1)
        ->count();

        return $this->success('获取成功！','',$data,$count);
    }

	/**
     * 评论列表页
     * @author tangtanglove
	 */
    public function lists(Request $request)
    {
        $user = Auth::user();

        $page       = $request->input('page',1);
        $limit      = $request->input('limit',10);
        $type       = $request->input('type');

        // 定义对象
        $comments = Comment::where('type', $type)
        ->where('status',1)
        ->where('pid',0)
        ->where('uid',$user->id)
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($comments as $key => $comment) {

            // 获取评论用户昵称
            $user = User::where('id',$comment['uid'])->first();
            $comments[$key]['nickname'] = $user->nickname;

            // 官方回复
            $replys = Comment::where('type', $type)
            ->where('status',1)
            ->where('pid',$comment['id'])
            ->get();
            $comments[$key]['replys'] = $replys;

            // 时间格式化
            $comments[$key]['created_at'] = date("Y/m/d H:i:s",strtotime($comment['created_at']));
        }

        $data = Helper::mobileAdaptor($comments);

        $count = Comment::where('type', $type)
        ->where('status',1)
        ->count();

        return $this->success('获取成功！','',$data,$count);
    }

	/**
     * 评论详情页
     * @author tangtanglove
	 */
    public function detail(Request $request)
    {
        $id      = $request->input('id');

        if (empty($id)) {
            return $this->error('参数错误！');
        }

        $comment = Comment::where('id', $id)
        ->where('status',1)
        ->first();

        $data = Helper::mobileAdaptor($comment);

        return $this->success('获取成功','',$data);
    }

	/**
     * 提交评论
     * @author tangtanglove
	 */
    public function add(Request $request)
    {
        $objectId   = $request->input('objectId');
        $type       = $request->input('type');
        $content    = $request->input('content');

        if (empty($objectId) || empty($type)) {
            return $this->error('参数错误！');
        }

        if(empty($content)) {
            return $this->error('请填写评论内容！');
        }

        $user = Auth::user();
        if(empty($user)) {
            return $this->error('请先登录！');
        }

        $data['uid'] = $user->id;
        $data['object_id'] = $objectId;
        $data['type'] = $type;
        $data['content'] = $content;
        $data['status'] = 2;

        // 定义对象
        $result = Comment::create($data);

        if($result) {
            return $this->success('评论成功！');
        } else {
            return $this->error('错误！');
        }
    }

	/**
     * 顶或踩评论
     * @author tangtanglove
	 */
    public function dingCai(Request $request)
    {
        $id         = $request->input('id');
        $type       = $request->input('type');

        if (empty($id) || empty($type)) {
            return $this->error('参数错误！');
        }

        $user = Auth::user();
        if(empty($user)) {
            return $this->error('请先登录！');
        }

        if(Session::get('comment_id'.$id)) {
            return $this->error('您已经顶过了！');
        }

        if($type == 'DING') {
            $result = Comment::where('id', $id)->increment('ding');
        } elseif($type == 'CAI') {
            $result = Comment::where('id', $id)->increment('cai');
        }

        if($result) {
            Session::put('comment_id'.$id,1);
            return $this->success('操作成功！');
        } else {
            return $this->error('错误！');
        }
    }

	/**
     * 删除评论
     * @author tangtanglove
	 */
    public function delete(Request $request)
    {
        $id   = $request->input('id');

        if (empty($id)) {
            return $this->error('参数错误！');
        }

        $user = Auth::user();
        if(empty($user)) {
            return $this->error('请先登录！');
        }

        // 定义对象
        $result = Comment::where('id',$id)->where('uid',$user->id)->delete();

        if($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('错误！');
        }
    }
}