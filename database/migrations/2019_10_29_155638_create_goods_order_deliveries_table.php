<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGoodsOrderDeliveriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_deliveries', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('order_id')->unsigned()->default('0');
            $table->integer('goods_order_id')->unsigned()->default('0');
            $table->string('delivery_no')->nullable()->comment('发货单编号');
            $table->string('express_type')->nullable()->comment('1,无需配送；2，第三方物流');
            $table->integer('goods_express_id')->nullable()->comment('快递id');
            $table->string('express_no')->nullable()->comment('快递单号');
            $table->dateTime('express_send_at')->nullable()->comment('快递发送时间');
            $table->tinyInteger('status')->default(0)->comment('1：待发货，2：已发货');
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
        Schema::dropIfExists('goods_order_deliveries');
    }
}
