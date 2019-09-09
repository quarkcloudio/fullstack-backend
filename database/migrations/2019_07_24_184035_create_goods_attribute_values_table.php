<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsAttributeValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_attribute_values', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id');             
            $table->integer('goods_attribute_id')->nullable()->comment('商品属性id');
            $table->string('vname')->nullable()->comment('属性值名称');
            $table->string('sort')->nullable();      
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods_attribute_values');
    }
}
