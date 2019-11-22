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
            $table->integer('uid')->unsigned()->default('0');
            $table->integer('shop_id')->unsigned()->default('0');
            $table->integer('order_id')->unsigned()->default('0');
            $table->decimal('total_amount',10,2)->comment('本次交易需要支付的总金额，单位为人民币（元）total_amount=buyer_pay_amount+freight_amount-point_amount-discount_amount');
            $table->decimal('buyer_pay_amount',10,2)->comment('买家实付金额，单位为元，两位小数。该金额代表该笔交易买家实际支付的金额，不包含商户折扣等金额，单位为人民币（元）');
            $table->decimal('point_amount',10,2)->comment('本次交易支付积分抵扣金额');
            $table->decimal('mdiscount_amount',10,2)->comment('商家优惠金额');
            $table->decimal('discount_amount',10,2)->comment('平台优惠金额');
            $table->decimal('freight_amount',10,2)->comment('运费金额');
            $table->string('cart_ids')->nullable()->comment('购物车json数据，用于购买完商品之后，清除购物车信息');
            $table->string('consignee_name')->nullable()->comment('收货人');
            $table->string('consignee_phone')->nullable()->comment('收货人电话');
            $table->string('consignee_province')->comment('省')->nullable();
            $table->string('consignee_city')->comment('市')->nullable();
            $table->string('consignee_county')->comment('县')->nullable();
            $table->string('consignee_town')->comment('镇')->nullable();
            $table->string('consignee_address')->nullable()->comment('收货地址');
            $table->string('status')->default('NOT_PAID')->comment('NOT_PAID:等待买家付款;PAY_PENDING:付款确认中;PAID:买家已付款（虚拟商品，标记为待核销状态）;SEND:卖家已发货;SUCCESS:交易成功;CLOSED:交易关闭;REFUND:退款中的订单;');
            $table->tinyInteger('close_type')->comment('订单关闭类型：1，买家取消订单；2，超时关闭');
            $table->tinyInteger('close_reason')->comment('订单关闭原因：1，我不想买了；2，信息填写错误，重新拍；3，卖家缺货；4，付款遇到问题；5，拍错了；6，其他原因');
            $table->string('timeout_express')->nullable()->comment('该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m');
            $table->string('virtual_code')->nullable()->comment('goods_mode为电子卡券时：消费码');
            $table->longText('remark')->nullable()->comment('备注');
            $table->tinyInteger('goods_mode')->default('1')->nullable()->comment('1实物商品（物流发货），2电子卡券（无需物流，如：团购类型需要消费码的商品），3服务商品（无需物流，如：点卡，Q币，游戏装备，激活码）');
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
