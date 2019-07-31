<?php

namespace App\Http\Controllers\Cashier;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\Models\Order;
use App\Models\GroupbuyOrder;
use App\Models\GroupbuyOrderTicket;
use App\Models\GroupbuyGoods;
use App\Models\MiaoshaGoods;
use App\Models\MiaoshaGoodsPhoto;
use App\Models\MiaoshaOrder;
use Omnipay\Omnipay;
use App\User;
use DB;

class VirtuaCurrencyController extends Controller
{
    /**
     * 虚拟货币支付
     */
    public function pay(Request $request)
    {
        // 获取订单号
        $orderNo = $request->input('orderNo');

        // 获取活动订单详情
        $order = Order::where('order_no',$orderNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }

        $user = User::where('id',$order['uid'])
        ->where('status',1)
        ->sharedLock()
        ->first();

        if(empty($user)) {
            return $this->error('下单用户不存在！');
        }

    }
    /**
     * 虚拟货币app支付
     */
    public function appPay(Request $request)
    {
        // 获取订单号
        $orderNo = $request->input('orderNo');

        // 登记订单支付方式
        Order::where('order_no',$orderNo)->update(['pay_type'=>'GANGCOIN']);
        
        // 获取订单详情
        $order = Order::where('order_no',$orderNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }
    }
    /**
     * 支付成功页面
     */
    public function successPage(Request $request)
    {

    }

    /**
     * 支付失败页面
     */
    public function errorPage(Request $request)
    {

    }

}
