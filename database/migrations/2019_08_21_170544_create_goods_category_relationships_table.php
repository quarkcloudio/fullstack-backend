<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsCategoryRelationshipsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_category_relationships', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('goods_id')->unsigned()->nullable()->comment('商品ID');
            $table->string('goods_category_id')->nullable()->comment('商品分类ID');
            $table->tinyInteger('status')->default(1);
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
        Schema::dropIfExists('goods_category_relationships');
    }
}
