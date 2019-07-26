<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsAttributeAliasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_attribute_alias', function (Blueprint $table) {
            $table->increments('id');             
            $table->integer('goods_attribute_id')->nullable()->COMMENT('商品规格id');
            $table->integer('goods_sku_id')->nullable()->COMMENT('商品单元id');
            $table->string('name')->nullable()->COMMENT('规格别名');     
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods_attribute_alias');
    }
}
