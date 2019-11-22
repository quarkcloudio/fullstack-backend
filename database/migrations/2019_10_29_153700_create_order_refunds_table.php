<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderRefundsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_refunds', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('order_id')->unsigned()->default('0');
            $table->string('order_no',28)->comment('系统退款单号');
            $table->string('thirdparty_order_no')->nullable()->comment('支付宝或微信退款单号');
            $table->string('refund_reason')->comment('例如：正常退款');
            $table->decimal('refund_amount',10,2)->comment('退款金额，单位为人民币（元）');
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
        Schema::dropIfExists('order_refunds');
    }
}
