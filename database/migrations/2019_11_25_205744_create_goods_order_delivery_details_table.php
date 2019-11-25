<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGoodsOrderDeliveryDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_delivery_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('order_id')->unsigned()->default('0');
            $table->integer('goods_order_id')->unsigned()->default('0');
            $table->integer('goods_order_delivery_id')->unsigned()->default('0');
            $table->integer('goods_order_detail_id')->unsigned()->default('0');
            $table->integer('num')->comment('发货数量');
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
        Schema::dropIfExists('goods_order_delivery_details');
    }
}
