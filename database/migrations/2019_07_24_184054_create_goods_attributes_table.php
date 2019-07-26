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
            $table->increments('id');
            $table->integer('shop_id')->unsigned()->nullable(); 
            $table->integer('goods_type_id')->nullable(); 
            $table->string('name')->nullable;
            $table->string('description')->nullable();
            $table->tinyInteger('style')->nullable();
            $table->integer('sort')->nullable();
            $table->tinyInteger('status')->nullable(); 
            $table->tinyInteger('type')->nullable();    
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
