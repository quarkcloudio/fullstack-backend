<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('pid')->default(0)->nullable();
            $table->string('title');
            $table->integer('sort')->default(0)->nullable();
            $table->string('cover_id')->default(0)->nullable();
            $table->string('name')->comment('分类缩略名');
            $table->string('description')->nullable()->comment('分类描述')->default('');
            $table->integer('count')->default(0)->nullable()->comment('分类数量');
            $table->string('index_tpl')->nullable()->default('');
            $table->string('lists_tpl')->nullable()->default('');
            $table->string('detail_tpl')->nullable()->default('');
            $table->integer('page_num')->default(10)->comment('分页数量');
            $table->tinyInteger('status')->default(1);
            $table->string('type')->default('ARTICLE')->comment('分类类型（ARTICLE/GOODS/STORE/TAG等）');
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
        Schema::dropIfExists('categories');
    }
}
