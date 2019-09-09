<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsAttributesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_attributes', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id');
            $table->integer('shop_id')->unsigned()->nullable()->comment('商家id，可选');
            $table->integer('goods_type_id')->nullable()->comment('商品类型');
            $table->string('name')->nullable()->comment('属性或规格名称');
            $table->string('description')->nullable()->comment('属性或规格描述');
            $table->tinyInteger('style')->nullable()->comment('显示样式：1多选，2单选，3文本，多选：以复选框的形式让商家勾选属性值；');
            $table->integer('sort')->nullable()->comment('排序');
            $table->tinyInteger('status')->nullable()->comment('状态'); 
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
        Schema::dropIfExists('goods_attributes');
    }
}
