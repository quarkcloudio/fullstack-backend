<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePrintersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('printers', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('shop_id')->default(0);
            $table->string('name')->comment('打印机名称');
            $table->string('machine_code')->comment('易联云打印机终端号');
            $table->string('phone')->comment('手机卡号码');
            $table->string('client_id')->comment('应用ID');
            $table->string('client_secret')->comment('应用密钥');
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
        Schema::dropIfExists('printers');
    }
}
