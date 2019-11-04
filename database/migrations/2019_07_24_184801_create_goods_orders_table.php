<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_orders', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id')->unsigned();
            $table->integer('order_id')->unsigned()->default('0');
            $table->decimal('total_amount',10,2)->comment('本次交易需要支付的总金额，单位为人民币（元）');
            $table->decimal('pay_amount',10,2)->comment('本次交易需要支付的金额，单位为人民币（元）pay_amount=total_amount-point_amount-discount_amount');
            $table->decimal('point_amount',10,2)->comment('本次交易支付积分抵扣金额');
            $table->decimal('discount_amount',10,2)->comment('本次交易优惠金额');
            $table->decimal('freight_amount',10,2)->comment('运费金额');
            $table->string('cart_ids')->nullable()->comment('购物车json数据，用于购买完商品之后，清除购物车信息');
            $table->string('consignee')->nullable()->comment('收货人');
            $table->string('address')->nullable()->comment('收货地址');
            $table->string('phone')->nullable()->comment('收货人电话');
            $table->string('status')->default('NOT_PAID')->comment('NOT_PAID:等待买家付款;PAY_PENDING:付款确认中;PAID:买家已付款;SEND:卖家已发货;SUCCESS:交易成功;CLOSED:交易关闭;REFUND:退款中的订单');
            $table->longText('remark')->nullable()->comment('备注');
            $table->tinyInteger('is_virtual')->default(0)->comment('是否为虚拟商品');
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
        Schema::dropIfExists('goods_orders');
    }
}
