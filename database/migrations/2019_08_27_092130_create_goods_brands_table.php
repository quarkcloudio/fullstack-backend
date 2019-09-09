<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsBrandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_brands', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->nullable()->comment('品牌名称：雅诗兰黛');
            $table->string('letter')->nullable()->comment('品牌名称首字母');
            $table->string('site_url')->nullable()->comment('品牌网址');
            $table->integer('logo')->nullable()->comment('品牌logo');
            $table->integer('promotion_image')->nullable()->comment('品牌推广图');
            $table->string('description')->nullable()->comment('品牌描述');
            $table->tinyInteger('is_recommend')->nullable()->comment('是否推荐');
            $table->integer('sort')->nullable();
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
        Schema::dropIfExists('goods_brands');
    }
}
