<?php

namespace App\Http\Controllers\Cashier;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\Models\Goods;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\GoodsSku;
use App\Models\ShoppingCart;
use Omnipay\Omnipay;
use App\User;
use DB;

class AlipayController extends Controller
{
    /**
     * 手机网站支付
     */
    public function wapPay(Request $request)
    {
        // 获取订单号
        $tradeNo = $request->input('tradeNo');

        // 获取活动订单详情
        $order = Order::where('trade_no',$tradeNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }

        // 登记订单支付方式
        Order::where('trade_no',$tradeNo)->update(['pay_type'=>'ALIPAY_WAP']);

        $body      = $order->title;
        $detail    = $order->title.$order->trade_no;
        $tradeNo   = $order->trade_no;
        $totalFee  = $order->buyer_pay_amount;
        $tradeType = 'Alipay_AopWap';
        $notifyUrl = url('cashier/alipay/notifyUrl?tradeType='.$tradeType);
        $returnUrl = url('cashier/alipay/returnUrl?tradeType='.$tradeType);

        // 初始化网关
        $gateway = Omnipay::create($tradeType);
        $gateway->setSignType(Helper::getConfig('ALIPAY_SIGN_TYPE')); //RSA/RSA2
        $gateway->setAppId(Helper::getConfig('ALIPAY_APP_ID'));
        $gateway->setPrivateKey(Helper::getConfig('ALIPAY_PRIVATE_KEY'));
        $gateway->setAlipayPublicKey(Helper::getConfig('ALIPAY_PUBLIC_KEY'));
        $gateway->setNotifyUrl($notifyUrl);
        $gateway->setReturnUrl($returnUrl);

        $request = $gateway->purchase();
        $request->setBizContent([
            'subject'      => $body,
            'out_trade_no' => $tradeNo,
            'total_amount' => $totalFee,
            'product_code' => 'QUICK_WAP_PAY',
        ]);

        $response = $request->send();

        $response->redirect();
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
        Order::where('trade_no',$tradeNo)->update(['pay_type'=>'ALIPAY_APP']);

        $body      = $order->title;
        $detail    = $order->title.$order->trade_no;
        $tradeNo   = $order->trade_no;
        $totalFee  = $order->buyer_pay_amount;
        $tradeType = 'Alipay_AopApp';
        $notifyUrl = url('cashier/alipay/notifyUrl?tradeType='.$tradeType);

        // 初始化网关
        $gateway = Omnipay::create($tradeType);
        $gateway->setSignType(Helper::getConfig('ALIPAY_SIGN_TYPE')); //RSA/RSA2
        $gateway->setAppId(Helper::getConfig('ALIPAY_APP_ID'));
        $gateway->setPrivateKey(Helper::getConfig('ALIPAY_PRIVATE_KEY'));
        $gateway->setAlipayPublicKey(Helper::getConfig('ALIPAY_PUBLIC_KEY'));
        $gateway->setNotifyUrl($notifyUrl);

        $request = $gateway->purchase();
        $request->setBizContent([
            'subject'      => $body,
            'out_trade_no' => $tradeNo,
            'total_amount' => $totalFee,
            'product_code' => 'QUICK_MSECURITY_PAY',
        ]);
        
        $response = $request->send();

        $result = $response->getOrderString();

        return $this->success('调用成功！','',$result);
    }

    /**
     * 电脑网站支付
     */
    public function pagePay(Request $request)
    {
        // 获取订单号
        $tradeNo = $request->input('tradeNo');

        // 获取活动订单详情
        $order = Order::where('trade_no',$tradeNo)->first();

        if(empty($order)) {
            return $this->error('参数错误！');
        }

        // 登记订单支付方式
        Order::where('trade_no',$tradeNo)->update(['pay_type'=>'ALIPAY_PAGE']);

        $body      = $order->title;
        $detail    = $order->title.$order->trade_no;
        $tradeNo   = $order->trade_no;
        $totalFee  = $order->buyer_pay_amount;
        $tradeType = 'Alipay_AopPage';
        $notifyUrl = url('cashier/alipay/notifyUrl?tradeType='.$tradeType);
        $returnUrl = url('cashier/alipay/returnUrl?tradeType='.$tradeType);

        // 初始化网关
        $gateway = Omnipay::create($tradeType);
        $gateway->setSignType(Helper::getConfig('ALIPAY_SIGN_TYPE')); //RSA/RSA2
        $gateway->setAppId(Helper::getConfig('ALIPAY_APP_ID'));
        $gateway->setPrivateKey(Helper::getConfig('ALIPAY_PRIVATE_KEY'));
        $gateway->setAlipayPublicKey(Helper::getConfig('ALIPAY_PUBLIC_KEY'));
        $gateway->setNotifyUrl($notifyUrl);
        $gateway->setReturnUrl($returnUrl);

        $request = $gateway->purchase();
        $request->setBizContent([
            'subject'      => $body,
            'out_trade_no' => $tradeNo,
            'total_amount' => $totalFee,
            'product_code' => 'FAST_INSTANT_TRADE_PAY',
        ]);

        $response = $request->send();

        $response->redirect();
    }

    /**
     * 同步验证
     */
    public function returnUrl(Request $request)
    {
        // 获取交易方式
        $tradeType = $request->input('tradeType');

        // 初始化网关
        $gateway = Omnipay::create($tradeType);
        $gateway->setSignType(Helper::getConfig('ALIPAY_SIGN_TYPE')); //RSA/RSA2
        $gateway->setAppId(Helper::getConfig('ALIPAY_APP_ID'));
        $gateway->setPrivateKey(Helper::getConfig('ALIPAY_PRIVATE_KEY'));
        $gateway->setAlipayPublicKey(Helper::getConfig('ALIPAY_PUBLIC_KEY'));

        $request = $gateway->completePurchase();
        $request->setParams(array_merge($_POST, $_GET));

        try {
            $response = $request->send();

            if($response->isPaid()){

                /**
                 * Payment is successful
                 */
                $outTradeNo = $_GET['out_trade_no']; // 商户自身订单号
                $tradeNo = $_GET['trade_no']; // 支付宝内部订单号

                $order = Order::where('trade_no',$outTradeNo)->first();

                // 如果订单存在，检查订单是否已经更新过支付状态
                if ($order->trade_status == 'TRADE_CLOSED' || $order->trade_status == 'TRADE_SUCCESS' || $order->trade_status == 'TRADE_FINISHED') {
                    header('location:'. url('cashier/alipay/successPage')); // 跳转
                    die();
                } else {
                    $result = $this->successful($order,$tradeNo);
                }
                if($result) {
                    header('location:'. url('cashier/alipay/successPage')); // 跳转
                }
            }else{
                /**
                 * Payment is not successful
                 */
                die('fail'); //The notify response
            }
        } catch (Exception $e) {
            /**
             * Payment is not successful
             */
            die('fail'); //The notify response
        }
    }

    /**
     * 异步通知
     */
    public function notifyUrl(Request $request)
    {
        // 获取交易方式
        $tradeType = $request->input('tradeType');

        // 初始化网关
        $gateway = Omnipay::create($tradeType);
        $gateway->setSignType(Helper::getConfig('ALIPAY_SIGN_TYPE')); //RSA/RSA2
        $gateway->setAppId(Helper::getConfig('ALIPAY_APP_ID'));
        $gateway->setPrivateKey(Helper::getConfig('ALIPAY_PRIVATE_KEY'));
        $gateway->setAlipayPublicKey(Helper::getConfig('ALIPAY_PUBLIC_KEY'));

        $request = $gateway->completePurchase();
        $request->setParams(array_merge($_POST, $_GET));

        try {
            $response = $request->send();

            if($response->isPaid()){

                /**
                 * Payment is successful
                 */
                $outTradeNo = $_POST['out_trade_no']; // 商户自身订单号
                $tradeNo = $_POST['trade_no']; // 支付宝内部订单号

                $order = Order::where('trade_no',$outTradeNo)->first();

                // 如果订单存在，检查订单是否已经更新过支付状态
                if ($order->trade_status == 'TRADE_CLOSED' || $order->trade_status == 'TRADE_SUCCESS' || $order->trade_status == 'TRADE_FINISHED') {
                    die('success'); // 已经支付成功了就不再更新了
                } else {
                    $result = $this->successful($order,$tradeNo);
                }
                if($result) {
                    die('success'); //The notify response should be 'success' only
                }
            }else{
                /**
                 * Payment is not successful
                 */
                die('fail'); //The notify response
            }
        } catch (Exception $e) {
            /**
             * Payment is not successful
             */
            die('fail'); //The notify response
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
        $payMoney = $order['buyer_pay_amount'];

        // 渲染页面
        return view('cashier/alipay/successPage',compact('payMoney'));
    }

    // 支付成功调用
    protected function successful($order,$outTradeNo)
    {
        // 判断参数
        if(empty($order) || empty($outTradeNo)) {
            return false;
        }

        // 启动事务
        DB::beginTransaction();
        try {

            $data['out_trade_no'] = $outTradeNo;
            $data['trade_status'] = 'TRADE_SUCCESS';
            $data['pay_type'] = 'ALIPAY_WAP';
            $data['paid_at'] = date('Y-m-d H:i:s');
            $data['type'] = 3;

            // 更新状态
            $result = Order::where('trade_no',$order->trade_no)->update($data);
            // 增加数量
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

        if($result) {
            return true;
        } else {
            return false;
        }
    }
}
