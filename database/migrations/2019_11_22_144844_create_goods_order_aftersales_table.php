<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGoodsOrderAftersalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_aftersales', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('uid')->unsigned()->default('0');
            $table->integer('shop_id')->unsigned()->default('0');
            $table->integer('order_id')->unsigned()->default('0');
            $table->integer('goods_order_id')->unsigned()->default('0');
            $table->integer('goods_order_detail_id')->unsigned()->default('0')->comment('退款具体订单详情');
            $table->integer('order_refund_id')->unsigned()->default('0')->comment('如果售后类型为仅退款或者退货退款并且同意退款，则插入退款订单ID');
            $table->decimal('refund_amount',10,2)->comment('如果售后类型为仅退款或者退货退款，则指申请退款的金额');
            $table->string('refund_consignee_name')->comment('退货退款收货人');
            $table->string('refund_consignee_phone')->comment('退货退款收货人联系方式');
            $table->string('refund_consignee_province')->comment('省')->nullable();
            $table->string('refund_consignee_city')->comment('市')->nullable();
            $table->string('refund_consignee_county')->comment('县')->nullable();
            $table->string('refund_consignee_town')->comment('镇')->nullable();
            $table->string('refund_consignee_address')->comment('退货退款退货地址');
            $table->tinyInteger('aftersale_reason')->comment('售后原因:1,商品破损;2:其他');
            $table->string('cover_ids')->comment('照片，用于审核人员参考是否同意申请');
            $table->tinyInteger('aftersale_type')->comment('售后类型：1,退货退款；2,仅退款；3,换货；4,维修；');
            $table->tinyInteger('status')->default(0)->comment('0：提出申请，1：申请处理中，2：同意申请，3：拒绝申请，4：申请已关闭');
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
        Schema::dropIfExists('goods_order_aftersales');
    }
}
