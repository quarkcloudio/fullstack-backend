<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShopCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop_categories', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id')->unsigned();
            $table->integer('pid')->default('0');
            $table->string('title');                       
            $table->integer('sort')->default('0');
            $table->string('cover_id')->default('0');
            $table->string('name')->comment('分类缩略名');
            $table->string('description')->nullable()->comment('分类描述');
            $table->string('index_tpl')->nullable();
            $table->string('lists_tpl')->nullable();
            $table->string('detail_tpl')->nullable();
            $table->integer('page_num')->default('10')->comment('分页数量');
            $table->tinyInteger('status')->default('1');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shop_categories');
    }
}
