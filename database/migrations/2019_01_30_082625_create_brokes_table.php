<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBrokesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('brokes', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('uid')->nullable();
            $table->string('name')->nullable();
            $table->string('phone')->nullable();
            $table->longText('content');
            $table->string('cover_ids')->nullable();
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
        Schema::dropIfExists('brokes');
    }
}
