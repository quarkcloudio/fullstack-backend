<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMerchantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('merchants', function (Blueprint $table) {
            $table->engine='innodb';
            $table->bigIncrements('id');
            $table->integer('uid')->default(0);
            $table->integer('score')->nullable()->default(0);
            $table->decimal('money',10,2)->nullable()->default(0.00);
            $table->string('bank_name')->nullable()->comment('开户行');
            $table->string('bank_payee')->nullable()->comment('开户行收款人');
            $table->string('bank_number')->nullable()->comment('开户行帐号');
            $table->string('last_login_ip')->nullable()->default('');
            $table->timestamp('last_login_time')->nullable();
            $table->tinyInteger('status')->default(2);
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
        Schema::dropIfExists('merchants');
    }
}
