<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVideosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('videos', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
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
            $table->string('cover_ids')->nullable()->default('');
            $table->integer('pid')->default(0)->nullable();
            $table->integer('level')->default(0)->nullable();
            $table->tinyInteger('position')->default('0')->nullable()->comment('推荐位');
            $table->integer('path')->comment('file里面的id');
            $table->integer('duration')->comment('时长');
            $table->integer('comment')->default(0)->nullable()->comment('评论数量');
            $table->integer('view')->default(0)->nullable()->comment('浏览数量');
            $table->string('comment_status')->default('open');
            $table->tinyInteger('status')->default(1);
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
        Schema::dropIfExists('videos');
    }
}
