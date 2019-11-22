<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id')->unsigned();
            $table->integer('uid');            
            $table->string('order_no',28)->comment('系统单号');
            $table->string('thirdparty_order_no')->nullable()->comment('支付宝或微信单号');
            $table->string('title');
            $table->decimal('amount',10,2)->comment('本次交易订单总金额，单位为人民币（元）');
            $table->decimal('refund_amount',10,2)->comment('已经退款的金额');
            $table->string('pay_type')->nullable()->comment('WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI');
            $table->dateTime('paid_at')->nullable()->comment('交易付款时间');
            $table->string('type',100)->comment('MALL:普通商城,WAIMAI:外卖');
            $table->string('status')->default('NOT_PAID')->comment('NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易超时，关闭订单（长时间未支付，则关闭订单）;PAY_ERROR:支付失败;');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
