<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsPhotosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_photos', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id');
            $table->integer('goods_id')->unsigned()->nullable();
            $table->integer('goods_color_attribute_value_id')->nullable()->comment('商品颜色属性值的id，为每个颜色上传不同的商品图');      
            $table->integer('cover_id')->default('0')->nullable()->comment('商品相册');
            $table->integer('sort')->default('0')->nullable()->comment('排序');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods_photos');
    }
}
