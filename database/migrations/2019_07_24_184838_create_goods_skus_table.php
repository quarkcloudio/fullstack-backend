<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsSkusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_skus', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id');            
            $table->integer('goods_id')->unsigned()->nullable();
            $table->integer('shop_id')->unsigned()->nullable();
            $table->longText('properties')->nullable()->comment('商品所有规格值的组合：10004:653780895;1627207:1007902496;');
            $table->longText('property_ids')->nullable()->comment('商品的所有规格名称id集合');
            $table->longText('property_names')->nullable()->comment('商品的所有规格名称集合，用于搜索：4G全网通 幻夜黑 官方标配 6+128GB');
            $table->integer('stock_num')->nullable(); 
            $table->decimal('cost_price',10,2)->nullable();
            $table->decimal('goods_price',10,2)->nullable();
            $table->decimal('market_price',10,2)->nullable();
            $table->string('goods_sn')->nullable();
            $table->string('goods_barcode')->nullable();
            $table->tinyInteger('status')->default('1');    
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods_skus');
    }
}
