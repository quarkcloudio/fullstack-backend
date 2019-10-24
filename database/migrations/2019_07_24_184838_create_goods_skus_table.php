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
            $table->longText('properties')->nullable();
            $table->longText('property_name')->nullable();
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
