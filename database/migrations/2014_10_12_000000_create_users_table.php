<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('username')->unique();
            $table->string('nickname');
            $table->string('realname')->nullable();
            $table->string('email')->unique();
            $table->string('phone')->unique();
            $table->tinyInteger('sex')->default(1);
            $table->string('password');
            $table->string('avatar')->nullable();
            $table->decimal('money',10,2)->nullable()->default(0.00);
            $table->integer('score')->nullable()->default(0);
            $table->string('wechat_openid')->nullable()->default('');
            $table->string('wechat_unionid')->nullable()->default('');
            $table->string('qq_openid')->nullable()->default('');
            $table->string('weibo_uid')->nullable()->default('');
            $table->string('last_login_ip')->nullable()->default('');
            $table->timestamp('last_login_time')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamp('email_verified_at')->nullable();            
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
