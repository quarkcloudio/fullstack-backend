<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAreasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('areas', function (Blueprint $table) {
            $table->integer('id');
            $table->string('area_name')->comment('栏目名');
            $table->integer('pid')->nullable()->comment('父栏目');
            $table->string('short_name');
            $table->string('lng');
            $table->string('lat');
            $table->integer('level')->comment('1.省 2.市 3.区 4.镇');
            $table->string('position');
            $table->integer('sort')->default('50')->comment('排序');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void`
     */
    public function down()
    {
        Schema::dropIfExists('areas');
    }
}
