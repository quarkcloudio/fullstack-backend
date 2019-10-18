<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsInfoAttributeValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_info_attribute_values', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id');
            $table->integer('goods_id')->unsigned()->nullable()->comment('商品id'); 
            $table->integer('goods_sku_id')->nullable()->comment('商品sku，可以为空'); 
            $table->integer('goods_attribute_id')->nullable()->comment('商品规格id');
            $table->string('goods_attribute_value_id')->nullable()->comment('商品规格值id或者商品规格值');           
            $table->tinyInteger('type')->nullable()->comment('1:spu商品属性,2:sku商品规格用于销售');  
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods_info_attribute_values');
    }
}
