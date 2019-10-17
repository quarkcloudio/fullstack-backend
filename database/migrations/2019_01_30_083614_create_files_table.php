<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('files', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('obj_type')->default('ADMINID')->comment('文件归属角色的类型（ADMINID/UID/SHOPID/MCHID等）');
            $table->integer('obj_id')->default(0)->nullable()->comment('文件归属角色id，用于将来统计用户使用空间大小');
            $table->integer('file_category_id')->default(0)->nullable()->comment('文件目录id');
            $table->integer('sort')->default(0)->nullable();
            $table->string('name')->comment('名称');
            $table->string('size')->comment('文件大小');
            $table->string('ext')->default(0)->nullable()->comment('文件扩展名');
            $table->text('path')->comment('路径');
            $table->longText('md5')->comment('md5唯一标识');
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
        Schema::dropIfExists('files');
    }
}
