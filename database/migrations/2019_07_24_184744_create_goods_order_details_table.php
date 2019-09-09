<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_details', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id')->unsigned();
            $table->integer('uid')->unsigned()->default('0'); 
            $table->integer('goods_id')->unsigned()->default('0');
            $table->integer('goods_sku_id');
            $table->integer('goods_order_id')->unsigned()->default('0'); 
            $table->string('title');
            $table->integer('num')->comment('购买数量');
            $table->decimal('goods_price',10,2)->comment('现价');
            $table->decimal('market_price',10,2)->comment('原价');
            $table->string('description')->nullable();
            $table->string('cover_ids');
            $table->tinyInteger('status')->default('0')->comment('0:等待付款，1:已付款，2：已退款');                     
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
        Schema::dropIfExists('goods_order_details');
    }
}
