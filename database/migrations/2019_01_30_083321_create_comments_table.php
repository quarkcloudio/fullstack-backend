<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pid')->default(0)->nullable();
            $table->integer('uid');
            $table->integer('object_id')->comment('评论对象的id（article/page/order等的id）');
            $table->string('title')->nullable();
            $table->string('cover_ids')->nullable()->comment('晒图');
            $table->string('type')->default('ARTICLE')->comment('评论类型（ARTICLE/PAGE/ORDER等）');
            $table->longText('content');
            $table->integer('ding')->default(0)->nullable()->comment('顶');
            $table->integer('cai')->default(0)->nullable()->comment('踩');
            $table->tinyInteger('report')->default(0)->nullable()->comment('举报（1：淫秽色情，2：垃圾广告，3：违法信息，4：其他）');
            $table->tinyInteger('status')->default(1);
            $table->tinyInteger('rate')->default(0)->nullable()->comment('评分（1，2，3，4，5）');
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
        Schema::dropIfExists('comments');
    }
}
