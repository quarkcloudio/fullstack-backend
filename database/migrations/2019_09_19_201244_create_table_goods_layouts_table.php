<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableGoodsLayoutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_layouts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('layout_name')->nullable()->comment('布局名称');
            $table->string('position')->nullable()->comment('模板位置：1详情顶部，2详情底部，3包装清单，4售后保障');
            $table->longText('content')->comment('模板内容');
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
        Schema::dropIfExists('goods_layouts');
    }
}
