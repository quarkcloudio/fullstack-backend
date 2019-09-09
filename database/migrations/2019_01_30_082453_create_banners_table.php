<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBannersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banners', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('category_id')->default(0)->nullable();
            $table->string('title');
            $table->string('url_type')->comment('url类型1：自定义链接，2：常用链接（首页、用户中心），3：文章分类（新闻、音乐），4：文章详情');
            $table->string('url')->comment('例如：https://www.baidu.com，/article/1.html');
            $table->string('cover_id');
            $table->integer('sort')->default(0)->nullable();
            $table->tinyInteger('status')->default(0);
            $table->timestamp('deadline')->nullable();
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
        Schema::dropIfExists('banners');
    }
}
