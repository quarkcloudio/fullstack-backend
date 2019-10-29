<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGoodsOrderRefundsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_refunds', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('uid')->unsigned()->default('0');
            $table->integer('order_id')->unsigned()->default('0');
            $table->integer('goods_order_id')->unsigned()->default('0');
            $table->integer('goods_order_detail_id')->unsigned()->default('0')->comment('退款具体商品');
            $table->integer('order_refund_id')->unsigned()->default('0')->comment('如果同意退款，则插入退款订单ID');
            $table->decimal('refund_amount',10,2)->comment('退款金额，单位为人民币（元）');
            $table->string('refund_reason')->comment('退款原因');
            $table->tinyInteger('status')->default(0)->comment('0：申请退款，1：已退款，2：拒绝退款');
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
        Schema::dropIfExists('goods_order_refunds');
    }
}
