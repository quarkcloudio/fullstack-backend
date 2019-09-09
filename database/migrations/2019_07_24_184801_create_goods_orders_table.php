<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_orders', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id')->unsigned();                       
            $table->integer('order_id')->unsigned()->default('0');
            $table->string('cart_ids')->nullable()->comment('购物车json数据，用于购买完商品之后，清除购物车信息');
            $table->string('consignee')->nullable()->comment('收货人');
            $table->string('address')->nullable()->comment('收货地址');
            $table->string('phone')->nullable()->comment('收货人电话');
            $table->string('express_name')->nullable()->comment('快递名称');
            $table->string('express_no')->nullable()->comment('快递单号');                        
            $table->dateTime('express_created_at')->nullable()->comment('快递发送时间');
            $table->dateTime('express_finished_at')->nullable()->comment('快递完成时间');
            $table->tinyInteger('send_uid')->nullable()->comment('配送员');
            $table->tinyInteger('send_status')->nullable()->default('0')->comment('配送状态');
            $table->timestamp('send_created_at')->nullable()->comment('配送分配时间');
            $table->timestamp('send_finished_at')->nullable()->comment('配送完成时间');            
            $table->string('trade_status')->default('WAIT_BUYER_PAY')->comment('WAIT_BUYER_PAY:交易创建，等待买家付款;TRADE_CLOSED:未付款交易超时关闭，或支付完成后全额退款;TRADE_SUCCESS:交易支付成功;TRADE_FINISHED:交易结束，不可退款');
            $table->longText('remark')->nullable()->comment('备注');    
            $table->tinyInteger('status')->default('1');      
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
        Schema::dropIfExists('goods_orders');
    }
}
