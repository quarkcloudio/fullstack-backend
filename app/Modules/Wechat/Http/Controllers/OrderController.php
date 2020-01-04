<?php

namespace App\Http\Controllers\Wechat;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Goods;
use App\Models\GoodsSku;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Promotion;
use App\Services\Helper;
use DB;
use Session;

class OrderController extends Controller
{
	/**
     * 订单列表
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $uid = auth('web')->user()->id;

        $status = $request->input('status');
        
        switch ($status) {
            case 'WAIT_BUYER_PAY':
                $trade_status = $status;

                $orders = Order::where('uid', $uid)
                ->where('trade_status', $trade_status)
                ->orderBy('id','desc')
                ->paginate(3);
                break;
            case 'TRADE_SUCCESS':
                $trade_status = $status;

                $orders = Order::where('uid', $uid)
                ->where('trade_status', $trade_status)
                ->where('refund_status','<>', 2)
                ->orderBy('id','desc')
                ->paginate(3);
                break;
            case 'REFUND':
                $trade_status = 'TRADE_CLOSED';

                $orders = Order::where('uid', $uid)
                ->where('trade_status', $trade_status)
                ->where('refund_status','=', 2)
                ->orderBy('id','desc')
                ->paginate(3);
                break;
            case 'WAIT_SEND':

                $orders = Order::where('uid', $uid)
                ->where('trade_status','TRADE_SUCCESS')
                ->where('send_status','<',1)
                ->orderBy('id','desc')
                ->paginate(3);
                break;
            case 'TRADE_FINISHED':

                $orders = Order::where('uid', $uid)
                ->where('trade_status','TRADE_FINISHED')
                ->orderBy('id','desc')
                ->paginate(3);
                break;
            default:
                $orders = Order::where('uid', $uid)->orderBy('id','desc')->paginate(3);
                break;
        }

        foreach ($orders as $key => $order) {
            $orderDetails = OrderDetail::where('order_id', $order->id)->get();
            foreach ($orderDetails as $detailKey => $orderDetail) {
                $sku = GoodsSku::where('status',1)
                ->where('id',$orderDetail->goods_sku_id)
                ->first();
    
                $orderDetails[$detailKey]->sku_data = json_decode($sku->sku_data);
            }
            $orders[$key]->orderDetails = $orderDetails;
        }
        return view('wechat/order/index',compact('orders'));
    }

	/**
     * 订单信息
     * @author tangtanglove
	 */
    public function info(Request $request)
    {
        $jsonData = $request->input('data');
        $cartIds = $request->input('cartIds');

        $getData = json_decode($jsonData,true);

        $totalMoney = 0;
        $promotionOverMoney = [];

        foreach ($getData as $key => $value) {
            // 商品id
            $goodId = $value[0];
            $skuId  = $value[1];
            $num    = $value[2];

            $goods[$key]['info'] = Goods::withTrashed()->where('id', $goodId)->first();
            $sku = GoodsSku::where('status',1)
            ->where('id',$skuId)
            ->first();

            $sku->sku_data = json_decode($sku->sku_data);

            $sku->promotion_title = '';

            if(!empty($sku->promotion_ids)) {
                $promotion = Promotion::where('id',$sku->promotion_ids)
                ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                ->first();
                if(!empty($promotion)) {
                    $sku->promotion_title = $promotion['title'];
                }

                // 促销钱满足的价格
                if(isset($promotionOverMoney[$sku->promotion_ids])) {
                    $promotionOverMoney[$sku->promotion_ids] = $promotionOverMoney[$sku->promotion_ids]+$num*$sku->now_price;
                } else {
                    $promotionOverMoney[$sku->promotion_ids] = $num*$sku->now_price;
                }

            }

            $goods[$key]['sku'] = $sku;
            $goods[$key]['num'] = $num;
            $goods[$key]['money'] = $num*$sku->now_price;
            $totalMoney = $totalMoney + $goods[$key]['money'];
        }
        
        // 判断都有哪些促销活动
        $promotionText = '';
        $reduceMoney = 0;
        if(!empty($promotionOverMoney)) {
            foreach($promotionOverMoney as $key1 => $value1) {
                $getPromotion = Promotion::where('id',$key1)->first();
                if($value1 >= $getPromotion['over_money']) {
                    if($getPromotion['type'] == 1) {
                        // 满减
                        $reduceMoney = $reduceMoney + $getPromotion['reduce_money'];
                    } else {
                        // 满赠
                        $promotionText = $promotionText.'<br>'.$getPromotion->title;
                    }
                }
            }
        }

        return view('wechat/order/info',compact('goods','totalMoney','reduceMoney','jsonData','cartIds'));
    }

	/**
     * 提交订单
     * @author tangtanglove
	 */
    public function submit(Request $request)
    {
        $uid = auth('web')->user()->id;

        $jsonData = $request->input('data');
        $getData = json_decode($jsonData,true);
        $cartIds = $request->input('cartIds');

        $consignee = $request->input('consignee');
        $phone = $request->input('phone');
        $address = $request->input('address');
        $remark = $request->input('remark');

        // 启动事务
        DB::beginTransaction();
        try {
            $totalMoney = 0;
            $promotionOverMoney = [];
            foreach ($getData as $key => $value) {
                // 商品id
                $goodId = $value[0];
                $skuId  = $value[1];
                $num    = $value[2];

                $info = Goods::where('id', $goodId)->first();
                $goods[$key]['info'] = $info;
                $sku = GoodsSku::where('status',1)
                ->where('id',$skuId)
                ->first();

                $sku->sku_data = json_decode($sku->sku_data);

                $sku->promotion_title = '';

                if(!empty($sku->promotion_ids)) {
                    $promotion = Promotion::where('id',$sku->promotion_ids)
                    ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                    ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                    ->first();
                    if(!empty($promotion)) {
                        $sku->promotion_title = $promotion['title'];
                    }
    
                    // 促销钱满足的价格
                    if(isset($promotionOverMoney[$sku->promotion_ids])) {
                        $promotionOverMoney[$sku->promotion_ids] = $promotionOverMoney[$sku->promotion_ids]+$num*$sku->now_price;
                    } else {
                        $promotionOverMoney[$sku->promotion_ids] = $num*$sku->now_price;
                    }
                }

                $goods[$key]['sku'] = $sku;
                $goods[$key]['num'] = $num;
                $goods[$key]['money'] = $num*$sku->now_price;
                $totalMoney = $totalMoney + $goods[$key]['money'];
            }

            // 判断都有哪些促销活动
            $promotionText = '';
            $reduceMoney = 0;
            if(!empty($promotionOverMoney)) {
                foreach($promotionOverMoney as $key1 => $value1) {
                    $getPromotion = Promotion::where('id',$key1)->first();
                    if($value1 >= $getPromotion['over_money']) {
                        if($getPromotion['type'] == 1) {
                            // 满减
                            $reduceMoney = $reduceMoney + $getPromotion['reduce_money'];
                        } else {
                            // 满赠
                            $promotionText = $promotionText.'<br>'.$getPromotion->title;
                        }
                    }
                }
            }

            $data['cart_ids']   = $cartIds;
            $data['uid']        = $uid;
            $data['trade_no']   = Helper::createTradeNo();
            $data['title']     = '购买商品';
            $data['total_amount'] = $totalMoney;
            $data['buyer_pay_amount'] = $totalMoney-$reduceMoney;
            $data['consignee'] = $consignee;
            $data['phone'] = $phone;
            $data['address'] = $address;
            $data['type'] = 3;
            $data['remark'] = $remark;

            // 加入订单表
            $order = Order::create($data);

            foreach ($getData as $key2 => $value2) {
                // 商品id
                $goodId = $value2[0];
                $skuId  = $value2[1];
                $num    = $value2[2];

                $info = Goods::where('id', $goodId)->first();

                // sku数据
                $sku = GoodsSku::where('status',1)
                ->where('id',$skuId)
                ->first();

                $dataDetail['uid']        = $uid;
                $dataDetail['category_id']   = $info->category_id;
                $dataDetail['goods_id']     = $info->id;
                $dataDetail['goods_sku_id'] = $skuId;
                $dataDetail['order_id'] = $order->id;
                $dataDetail['title'] = $info->title;
                $dataDetail['num'] = $num;
                $dataDetail['now_price'] = $sku->now_price;
                $dataDetail['pre_price'] = $sku->pre_price;
                $dataDetail['description'] = $info->description;
                $dataDetail['cover_ids'] = $info->cover_ids;
                $dataDetail['content'] = $info->content;

                // 插入订单详情表
                OrderDetail::create($dataDetail);
            }

            $result = true;
            // 提交事务
            DB::commit();
        } catch (\Exception $e) {

            $result = false;
            // 回滚事务
            DB::rollback();
        }

        if($result == false) {
            return $this->error('错误！');
        } else {
            return $this->success('创建成功！','',$data['trade_no']);
        }
    }

	/**
     * 快速提交订单
     * @author tangtanglove
	 */
    public function quickSubmit(Request $request)
    {
        $uid = auth('web')->user()->id;

        $jsonData = $request->input('data');
        $getData = json_decode($jsonData,true);
        $cartIds = $request->input('cartIds');

        // 启动事务
        DB::beginTransaction();
        try {
            $totalMoney = 0;
            foreach ($getData as $key => $value) {
                // 商品id
                $goodId = $value[0];
                $skuId  = $value[1];
                $num    = $value[2];

                $info = Goods::where('id', $goodId)->first();
                $goods[$key]['info'] = $info;
                $sku = GoodsSku::where('status',1)
                ->where('id',$skuId)
                ->first();

                $sku->sku_data = json_decode($sku->sku_data);

                $goods[$key]['sku'] = $sku;
                $goods[$key]['num'] = $num;
                $goods[$key]['money'] = $num*$sku->now_price;
                $totalMoney = $totalMoney + $goods[$key]['money'];
            }

            $data['cart_ids']   = $cartIds;
            $data['uid']        = $uid;
            $data['trade_no']   = Helper::createTradeNo();
            $data['title']     = '购买商品';
            $data['total_amount'] = $totalMoney;
            $data['buyer_pay_amount'] = $totalMoney;
            $data['pay_type'] = 'WECHAT';
            $data['type'] = 3;

            // 加入订单表
            $order = Order::create($data);

            foreach ($getData as $key1 => $value1) {
                // 商品id
                $goodId = $value1[0];
                $skuId  = $value1[1];
                $num    = $value1[2];

                $info = Goods::where('id', $goodId)->first();

                // sku数据
                $sku = GoodsSku::where('status',1)
                ->where('id',$skuId)
                ->first();

                $dataDetail['uid']        = $uid;
                $dataDetail['category_id']   = $info->category_id;
                $dataDetail['goods_id']     = $info->id;
                $dataDetail['goods_sku_id'] = $skuId;
                $dataDetail['order_id'] = $order->id;
                $dataDetail['title'] = $info->title;
                $dataDetail['num'] = $num;
                $dataDetail['now_price'] = $sku->now_price;
                $dataDetail['pre_price'] = $sku->pre_price;
                $dataDetail['description'] = $info->description;
                $dataDetail['cover_ids'] = $info->cover_ids;
                $dataDetail['content'] = $info->content;

                // 插入订单详情表
                OrderDetail::create($dataDetail);
            }

            $result = true;
            // 提交事务
            DB::commit();
        } catch (\Exception $e) {

            $result = false;
            // 回滚事务
            DB::rollback();
        }

        if($result == false) {
            return $this->error('错误！');
        } else {
            // 如果是微信跳转到微信支付
            if(Helper::isWechat()) {
                $targetUrl = url('wechat/wechat/jspay?tradeNo='.$data['trade_no']);
            } else {
                $targetUrl = url('wechat/alipay/wapPay?tradeNo='.$data['trade_no']);
            }
            header('location:'. $targetUrl); // 跳转
        }
    }

	/**
     * 确认订单
     * @author tangtanglove
	 */
    public function confirm(Request $request)
    {
        $uid = auth('web')->user()->id;

        $trade_no = $request->input('tradeNo');

        $order = Order::where('trade_no', $trade_no)->where('uid', $uid)->first();

        if(empty($order)) {
            return $this->error('无此订单！');
        }

        $orderDetails = OrderDetail::where('order_id', $order->id)->get();
        $totalMoney = 0;
        $promotionOverMoney = [];

        foreach ($orderDetails as $key => $value) {
            // 商品id

            $sku = GoodsSku::where('status',1)
            ->where('id',$value->goods_sku_id)
            ->first();

            $sku->sku_data = json_decode($sku->sku_data);

            $sku->promotion_title = '';

            if(!empty($sku->promotion_ids)) {
                $promotion = Promotion::where('id',$sku->promotion_ids)
                ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                ->first();
                if(!empty($promotion)) {
                    $sku->promotion_title = $promotion['title'];
                }

                // 促销钱满足的价格
                if(isset($promotionOverMoney[$sku->promotion_ids])) {
                    $promotionOverMoney[$sku->promotion_ids] = $promotionOverMoney[$sku->promotion_ids]+$value->num*$sku->now_price;
                } else {
                    $promotionOverMoney[$sku->promotion_ids] = $value->num*$sku->now_price;
                }
            }

            $orderDetails[$key]->sku = $sku;
            $orderDetails[$key]->num = $value->num;
            $orderDetails[$key]->money = $value->num*$sku->now_price;
            $totalMoney = $totalMoney + $orderDetails[$key]->money;
        }

        $promotionText = '';
        $reduceMoney = 0;
        // 判断都有哪些促销活动
        if(!empty($promotionOverMoney)) {
            foreach($promotionOverMoney as $key1 => $value1) {
                $getPromotion = Promotion::where('id',$key1)->first();
                if($value1 >= $getPromotion['over_money']) {
                    if($getPromotion['type'] == 1) {
                        // 满减
                        $reduceMoney = $reduceMoney + $getPromotion['reduce_money'];
                    } else {
                        // 满赠
                        $promotionText = $promotionText.'<br>'.$getPromotion->title;
                    }
                }
            }
        }

        return view('wechat/order/confirm',compact('order','orderDetails','reduceMoney','promotionText','totalMoney'));
    }

	/**
     * 取消订单
     * @author tangtanglove
	 */
    public function cancel(Request $request)
    {
        $uid = auth('web')->user()->id;

        $trade_no = $request->input('tradeNo');

        $order = Order::where('trade_no', $trade_no)->where('uid', $uid)->first();
        
        if(empty($order)) {
            return $this->error('无此订单！');
        }

        if($order->trade_status != 'WAIT_BUYER_PAY') {
            return $this->error('无此取消此订单！');
        }

        $data['trade_status'] = 'TRADE_CLOSED';
        $result = Order::where('trade_no', $trade_no)->where('uid', $uid)->update($data);

        if($result) {
            return $this->success('取消成功！');
        } else {
            return $this->error('取消失败！');
        }
    }

	/**
     * 申请退款
     * @author tangtanglove
	 */
    public function refund(Request $request)
    {
        $uid = auth('web')->user()->id;

        $trade_no = $request->input('tradeNo');

        $order = Order::where('trade_no', $trade_no)->where('uid', $uid)->first();
        
        if(empty($order)) {
            return $this->error('无此订单！');
        }

        if($order->trade_status != 'TRADE_SUCCESS') {
            return $this->error('此订单无法退款！');
        }

        if($order->refund_status != 0) {
            return $this->error('请勿重复提交！');
        }

        $data['refund_status'] = 1;
        $result = Order::where('trade_no', $trade_no)->where('uid', $uid)->update($data);

        if($result) {
            return $this->success('退款申请已提交，请等待客服处理！');
        } else {
            return $this->error('退款失败！');
        }
    }

}