<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNavigationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('navigations', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('pid');
            $table->integer('uid');
            $table->string('title');
            $table->integer('cover_id');
            $table->string('url_type')->comment('url类型1：自定义链接，2：常用链接（首页、用户中心），3：文章分类（新闻、音乐），4：文章详情');
            $table->string('url')->comment('例如：https://www.baidu.com，/article/1.html');
            $table->integer('sort');
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
        Schema::dropIfExists('navigations');
    }
}
