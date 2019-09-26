<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->integer('adminid')->default('0')->nullable()->default(0);
            $table->integer('uid')->default('0')->nullable()->default(0);
            $table->integer('category_id');
            $table->string('tags')->nullable()->default('');
            $table->string('title');
            $table->string('name')->nullable()->default('');
            $table->string('author')->nullable()->comment('文章作者')->default('');
            $table->string('source')->nullable()->comment('文章来源')->default('');
            $table->string('description')->nullable()->default('');
            $table->string('password')->nullable()->default('');
            $table->text('cover_ids')->nullable()->default('');
            $table->integer('pid')->default(0)->nullable();
            $table->integer('level')->default(0)->nullable();
            $table->string('type')->default('ARTICLE')->comment('文章类型（ARTICLE/PAGE/LINK等）');
            $table->tinyInteger('show_type')->default(1)->comment('文章展示形式（1：无图，2：单图-小，3：多图，4：单图-大）');
            $table->tinyInteger('position')->default('0')->nullable()->comment('推荐位');
            $table->string('link')->nullable()->comment('外部连接')->default('');
            $table->longText('content');
            $table->integer('comment')->default(0)->nullable()->comment('评论数量');
            $table->integer('view')->default(0)->nullable()->comment('浏览数量');
            $table->string('page_tpl')->nullable()->comment('page类型时模板名称')->default('');
            $table->string('comment_status')->default('open');
            $table->tinyInteger('status')->default(1);
            $table->integer('file_id')->nullable()->default(0);
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
        Schema::dropIfExists('posts');
    }
}
