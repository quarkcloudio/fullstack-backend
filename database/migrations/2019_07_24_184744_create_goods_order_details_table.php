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
            $table->longtext('goods_properties')->comment('商品所有规格值的组合，例如：10004:653780895;1627207:1007902496;');
            $table->longtext('goods_property_names')->comment('商品的所有规格名称集合，例如：4G全网通 幻夜黑 官方标配 6+128GB');
            $table->integer('goods_order_id')->unsigned()->default('0');
            $table->string('title');
            $table->integer('num')->comment('购买数量');
            $table->string('virtual_code')->comment('核销码');
            $table->decimal('goods_price',10,2)->comment('现价');
            $table->decimal('market_price',10,2)->comment('原价');
            $table->string('description')->nullable();
            $table->string('cover_ids');
            $table->tinyInteger('status')->default('0')->comment('0:未核销，1:已核销');
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
