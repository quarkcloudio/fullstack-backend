<?php

namespace App\Http\Controllers\PC\Plugin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\PC\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Comment;
use App\Models\Post;
use App\User;
use App\Services\Helper;
use App\Models\GroupbuyGoods;
use App\Models\GroupbuyShop;
use App\Models\GroupbuyOrder;
use Session;
use DB;

class CommentController extends BaseController
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

        switch ($type) {
            case 'ARTICLE':
                // $tpl = 'mobile/plugin/comment/index';
                // break;
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
                    $comments[$key]['cover_path'] = Helper::getPicture($user->cover_id);
                    $comments[$key]['user'] = $user;

                    // 官方回复
                    $replys = Comment::where('type', $type)
                    ->where('status',1)
                    ->where('pid',$comment['id'])
                    ->get()
                    ->toArray();
                    $comments[$key]['replys'] = $replys;

                    // 时间格式化
                    $comments[$key]['created_at'] = date("Y/m/d H:i:s",strtotime($comment['created_at']));
                }

                $count = Comment::where('type', $type)
                ->where('status',1)
                ->where('object_id',$objectId)
                ->count();

                return $this->success('获取成功！','',$comments,$count);

            case 'GROUPBUY':
                // 商品信息
                $groupbuyOrder = GroupbuyOrder::where('goods_id',$objectId)
                ->join('groupbuy_goods','groupbuy_orders.goods_id','groupbuy_goods.id')
                ->join('orders','groupbuy_orders.order_id','orders.id')
                ->where('trade_status','TRADE_SUCCESS')
                ->orwhere('trade_status','TRADE_FINISHED')
                ->select('groupbuy_orders.*','groupbuy_goods.goods_name as goods_name','orders.buyer_pay_amount as buyer_pay_amount','groupbuy_goods.expiry_date as expiry_date')
                ->first();

                $tpl = 'pc/plugin/comment/groupbuyIndex';
                $data['groupbuyOrder'] = $groupbuyOrder;

                $data['object_id'] = $objectId;
                $data['type'] = $type;
                return view($tpl,$data);
                break;

            default:
                break;
        }

        
    }

    /**
     * 评论列表
     */
    public function lists(Request $request)
    {
        $objectId   = $request->input('objectId');
        $shop_id    = $request->input('shopId');
        $page       = $request->input('page',1);
        $limit      = $request->input('limit',4);
        $type       = $request->input('type');
        $rateAvg    = 0;   //评分
        $objectIds = array();

        if(!empty($shop_id)) {
            $groupsbuyGoods = GroupbuyGoods::where('groupbuy_goods.status',1)->where('shop_id',$shop_id)->get()->toArray();
            if($groupsbuyGoods) {
                foreach($groupsbuyGoods as $key=>$value) {
                    $objectIds[$key] = $value['id'];
                }
            }
        } else {
            $objectIds[0] = $objectId;
        }
        // 评论
        $query = Comment::query()->whereIn('comments.object_id',$objectIds)->where('comments.type',$type)->where('comments.pid',0)->where('comments.status',1);
        
        // 评论总量
        $commentCount = $query->count();

        // 评论列表
        $comments = $query
            ->join('users','users.id','=','comments.uid')
            ->orderBy('comments.id','desc')
            ->select('comments.*','users.cover_id as user_cover_id','users.nickname as user_nickname','users.phone as user_phone')
            ->skip(($page-1)*$limit)
            ->take($limit)
            ->get()
            ->toArray();

        // 评论图片及回复
        if($comments) {
            $rateSum = 0;
            foreach ($comments as $key => $comment) {
                $comments[$key]['user_cover_path'] = Helper::getPicture($comment['user_cover_id']);
                $coverIds = json_decode($comment['cover_ids'], true);
                if($coverIds) {
                    foreach ($coverIds as $key1 => $coverId) {
                        $comments[$key]['cover_paths'][$key1] = Helper::getPicture($coverId);
                    }
                }
                
                $comments[$key]['replys'] = Comment::whereIn('comments.object_id',$objectIds)
                ->where('comments.type',$type)
                ->where('comments.pid',$comment['id'])
                ->join('users','users.id','=','comments.uid')
                ->orderBy('comments.id','desc')
                ->select('comments.*','users.cover_id as user_cover_id','users.nickname as user_nickname','users.phone as user_phone')
                ->get()
                ->toArray();
                // 评分
                $rateSum += $comment['rate'];
            }
            $rateAvg = round($rateSum/$commentCount,1);

            switch ($type) {
                case 'ARTICLE':
                    $tpl = 'pc/plugin/comment/articleList';
                    break;
                    
                case 'GROUPBUY':
                    foreach($comments as $key=>$comment) {
                        $groupbuyGoods = GroupbuyGoods::where('id',$comment['object_id'])->first();
                        $comments[$key]['goods_name'] = $groupbuyGoods['goods_name'];
                    }
                    
                    $tpl = 'pc/plugin/comment/groupbuyList';
                    $data['groupbuyGoods'] = $groupbuyGoods;
    
                default:
                    break;
            }
        }  
        

        $data['comments'] = $comments;
        $data['commentCount'] = $commentCount;
        $data['rateAvg'] = $rateAvg;
        return $this->success('获取成功','',$data);
    }

	/**
     * 评论详情页
     * @author tangtanglove
	 */
    public function detail(Request $request)
    {
        $id = $request->input('id');

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

        $rate       = $request->input('rate');
        $cover_ids  = $request->input('cover_ids');
       
        if (empty($objectId) || empty($type)) {
            return $this->error('参数错误！');
        }

        if(empty($content)) {
            return $this->error('请填写评论内容！');
        }

        if(empty(UID)) {
            return $this->error('请先登录！');
        }
        $user = Auth::user();
        $data['uid'] = $user->id;
        $data['object_id'] = $objectId;
        $data['type'] = $type;
        $data['content'] = $content;
        $data['rate'] = $rate;
        $data['cover_ids'] = json_encode($cover_ids);
        $data['status'] = 2;

        // 启动事务
        DB::beginTransaction();
        try {

            $result = Comment::create($data);
            switch ($type) {
                case 'GROUPBUY':
                    // 商品评分-加入商品表
                    $goodsRateAvg = Comment::where('object_id',$objectId)->where('pid',0)->avg('rate');
                    $result = GroupbuyGoods::where('id',$objectId)->update(['rate'=>intval($goodsRateAvg)]);

                    // 商家评分
                    $groupbuyShop = GroupbuyGoods::where('id',$objectId)->first();
                    $shopsRateAvg = GroupbuyGoods::where('shop_id',$groupbuyShop['shop_id'])->avg('rate');
                    $result = GroupbuyShop::where('id',$groupbuyShop['shop_id'])->update(['rate'=>intval($shopsRateAvg)]);
            
                default:
                    break;
            }

            // 提交事务
            DB::commit();
        } catch (\Exception $e) {
            
            // 回滚事务
            $result = false;
            DB::rollback();
        }

        if($result) {
            return $this->success('评论成功');
        } else {
            return $this->error('操作失败');
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