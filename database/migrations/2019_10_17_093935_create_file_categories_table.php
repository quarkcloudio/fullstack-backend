<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFileCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('file_categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('obj_type')->default('ADMINID')->comment('图片归属角色的类型（ADMINID/UID/SHOPID/MCHID等）');
            $table->integer('obj_id')->default(0)->nullable()->comment('图片归属角色id，用于将来多用户角色使用');
            $table->string('title');
            $table->integer('sort')->default(0)->nullable();
            $table->string('description')->nullable()->comment('分类描述')->default('');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('file_categories', function (Blueprint $table) {
            Schema::dropIfExists('file_categories');
        });
    }
}
