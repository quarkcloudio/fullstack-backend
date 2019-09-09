<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsCategoryAttributesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_category_attributes', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id');
            $table->integer('goods_category_id')->unsigned()->nullable()->comment('商品分类'); 
            $table->integer('goods_attribute_id')->nullable()->comment('关联属性id或规格id');
            $table->string('gorup_name')->nullable()->comment('分组名');
            $table->integer('sort')->nullable()->comment('排序');
            $table->integer('type')->nullable()->comment('1:spu商品属性,2:sku商品规格用于销售');
            $table->tinyInteger('is_required')->nullable()->comment('是否必填');
            $table->tinyInteger('is_filter')->nullable()->comment('是否筛选 勾选后此属性、规格会作为筛选条件展示在前台的商品列表页的筛选区域');
            $table->tinyInteger('is_alias')->nullable()->comment('允许别名 勾选此项后，此规格的名称就可以被店铺修改，例如：平台方此规格是颜色，店铺在自己编辑时把颜色改为版本，其他店铺依旧是颜色');
            $table->tinyInteger('is_desc')->nullable()->comment('勾选此项后，店铺在编辑此规格时即可以为规格添加备注，前台鼠标经过规格时展示该备注');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('goods_category_attributes');
    }
}
