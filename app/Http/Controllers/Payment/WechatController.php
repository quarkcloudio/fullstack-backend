<?php

namespace App\Http\Controllers\Cashier;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Goods;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\GoodsSku;
use App\Models\ShoppingCart;
use App\User;
use DB;
use Session;
use Illuminate\Support\Facades\Auth;

class WechatController extends Controller
{
    /**
     * 微信公众号或者H5网站支付
     */
    public function jsapiPay(Request $request)
    {
        // 获取订单号
        $tradeNo = $request->input('tradeNo');

        // 获取活动订单详情
        $order = Order::where('trade_no',$tradeNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }

        // 登记订单支付方式
        Order::where('trade_no',$tradeNo)->update(['pay_type'=>'WECHAT_JSAPI']);

        $body      = $order->title;
        $detail    = $order->title.$order->trade_no;
        $totalFee  = $order->buyer_pay_amount;
        $tradeType = 'JSAPI';
        $notifyUrl = url('cashier/wechat/notifyUrl');
    
        // 获取openid
        $wechatUser = Session::get('wechatUser');

        // 创建对象
        $app = Factory::payment(Helper::wechatPayConfig());

        $attributes = [
            'trade_type'       => $tradeType, // JSAPI，NATIVE，APP...
            'body'             => $body,
            'detail'           => $detail,
            'out_trade_no'     => $tradeNo,
            'total_fee'        => intval($totalFee*100), // 单位：分
            'notify_url'       => $notifyUrl, // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'openid'           => $wechatUser['original']['openid']
        ];

        // 创建订单
        $result = $app->order->unify($attributes);

        // 返回结果
        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS') {
            // 调用app支付
            $prepayId = $result['prepay_id'];
            $jspay = $app->jssdk->bridgeConfig($prepayId);

            // 支付成功跳转地址
            $targetUrl = url('cashier/wechat/successPage?tradeNo='.$tradeNo);

            // 渲染页面
            return view('cashier/wechat/jsapiPay',compact('jspay','totalFee','targetUrl'));
        } else {
            echo $result['return_msg'];
        }
    }

    /**
     * app支付
     */
    public function appPay(Request $request)
    {
        // 获取订单号
        $tradeNo = $request->input('tradeNo');

        // 获取活动订单详情
        $order = Order::where('trade_no',$tradeNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }

        // 登记订单支付方式
        Order::where('trade_no',$tradeNo)->update(['pay_type'=>'WECHAT_APP']);

        $body      = $order->title;
        $detail    = $order->title.$order->trade_no;
        $tradeNo   = $order->trade_no;
        $totalFee  = $order->buyer_pay_amount;
        $tradeType = 'APP';
        $notifyUrl = url('cashier/wechat/notifyUrl?tradeType=APP');

        // 创建对象
        $app = Factory::payment(Helper::wechatAppPayConfig());

        $result = $app->order->unify([
            'body' => $body,
            'out_trade_no' => $tradeNo,
            'total_fee' => intval($totalFee*100),
            'notify_url' => $notifyUrl, // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'trade_type' => $tradeType
        ]);

        // 返回结果
        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS') {

            // 调用app支付
            $prepayId = $result['prepay_id'];
            $config = $app->jssdk->appConfig($prepayId);
            return $this->success('调用成功！','',$config);
        } else {
            return $this->success('调用失败！','',$result);
        }
    }

    /**
     * 电脑网页支付
     */
    public function nativePay(Request $request)
    {
        // 获取订单号
        $tradeNo = $request->input('tradeNo');

        $order = Order::where('trade_no', $tradeNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }

        // 登记订单支付方式
        Order::where('trade_no',$tradeNo)->update(['pay_type'=>'WECHAT_NATIVE']);

        $body      = $order->title;
        $detail    = $order->title.$order->trade_no;
        $tradeNo   = $order->trade_no;
        $totalFee  = $order->buyer_pay_amount;
        $tradeType = 'NATIVE';
        $notifyUrl = url('cashier/wechat/notifyUrl');

        // 创建对象
        $app = Factory::payment(Helper::wechatPayConfig());

        $result = $app->order->unify([
            'body' => $body,
            'out_trade_no' => $tradeNo,
            'total_fee' => intval($totalFee*100),
            'notify_url' => $notifyUrl, // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'trade_type' => $tradeType
        ]);

        // 返回结果
        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS') {
            $codeUrl = $result['code_url'];

            // 支付成功跳转地址
            $targetUrl = url('cashier/wechat/successPage');

            // 渲染页面
            return view('cashier/wechat/nativePay',compact('codeUrl','totalFee','targetUrl'));

        } else {
            echo $result['return_msg'];
        }
    }

    /**
     * 支付成功页面
     */
    public function successPage(Request $request)
    {
        // 获取活动订单号
        $tradeNo = $request->input('tradeNo');
        $order = Order::where('trade_no',$tradeNo)->first();

        // 渲染页面
        return view('cashier/wechat/successPage');
    }

    /**
     * notifyUrl (异步通知)
     */
    public function notifyUrl(Request $request)
    {
        $tradeType = $request->input('tradeType');

        // 调用app支付配置
        if($payType == 'APP') {
            $app = Factory::payment(Helper::wechatAppPayConfig());
        } else {
            $app = Factory::payment(Helper::wechatPayConfig());
        }

        $response = $app->handlePaidNotify(function($message, $fail) {
            // 使用通知里的 "微信支付订单号" 或者 "商户订单号" 去自己的数据库找到订单
            $order = Order::where('trade_no',$message['out_trade_no'])->first();

            if(empty($order)) {
                return false;
            }

            // 如果订单存在，检查订单是否已经更新过支付状态
            if ($order->trade_status == 'TRADE_CLOSED' || $order->trade_status == 'TRADE_SUCCESS' || $order->trade_status == 'TRADE_FINISHED') {
                return true; // 已经支付成功了就不再更新了
            }

            // return_code 表示通信状态，不代表支付状态
            if ($message['return_code'] === 'SUCCESS') {

                // 用户是否支付成功
                if (array_get($message, 'result_code') === 'SUCCESS') {
                    $this->successful($order,$message['transaction_id']);
                }
            } else {
                return $fail('通信失败，请稍后再通知我');
            }

            return true; // 返回处理完成
        });

        return $response;
    }

    // 支付成功调用
    protected function successful($order,$outTradeNo)
    {
        // 启动事务
        DB::beginTransaction();
        try {

            $data['out_trade_no'] = $outTradeNo;
            $data['trade_status'] = 'TRADE_SUCCESS';
            $data['paid_at'] = date('Y-m-d H:i:s');
            $data['type'] = 3;

            // 更新状态
            $result = Order::where('trade_no',$order->trade_no)->update($data);

            $orderDetails = OrderDetail::where('order_id', $order->id)->get();

            foreach ($orderDetails as $key => $value) {

                // 商品库存和销售数量
                GoodsSku::where('id',$value->goods_sku_id)->increment('sales_num',$value->num);
                GoodsSku::where('id',$value->goods_sku_id)->decrement('stock_num',$value->num);

                // 增加商品总销售数量
                Goods::where('id',$value->goods_id)->increment('sales_num',$value->num);
            }

            // 清空购物车
            if(!empty($order->cart_ids)) {
                ShoppingCart::whereIn('id',json_decode($order->cart_ids,true))->delete();
            }

            // 提交事务
            DB::commit();
        } catch (\Exception $e) {

            // 回滚事务
            DB::rollback();
        }

        return $result;
    }

	/**
     * 获取订单支付状态
     * @author tangtanglove
	 */
    public function getPayStatus(Request $request)
    {
        $tradeNo = $request->input('tradeNo');
        $uid = auth('web')->user()->id;

        $order = Order::where('trade_no',$tradeNo)->where('uid', $uid)->first();

        if($order->trade_status == 'TRADE_SUCCESS') {
            return $this->success('您已支付成功！');
        } else {
            return $this->error('正在等待支付！');
        }
    }
}
