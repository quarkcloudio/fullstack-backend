<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGoodsOrderStatusRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_status_records', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('order_id');
            $table->integer('goods_order_id');
            $table->string('status')->default('NOT_PAID')->comment('NOT_PAID:等待买家付款;PAY_PENDING:付款确认中;PAID:买家已付款;SEND:卖家已发货;SUCCESS:交易成功;CLOSED:交易关闭;REFUND:退款中的订单');
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
        Schema::dropIfExists('goods_order_status_records');
    }
}
