<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGoodsOrderAftersaleRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_order_aftersale_records', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('goods_order_aftersale_id')->unsigned()->default('0')->comment('售后表的id');
            $table->tinyInteger('aftersale_type')->comment('售后类型：1,退货退款；2,仅退款；3,换货；4,维修；');
            $table->string('content')->comment('内容，例如：想退货、不符合退款条件、已安排维修师傅处理');
            $table->tinyInteger('status')->default(0)->comment('1,买家发起申请;2,卖家同意了申请;3,卖家拒绝了申请；4,买家修改了申请；5,买家已将退货商品寄回；6，卖家收到退款商品；7，平台方已将款项退至买家账户，本次退款申请已成功处理。');
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
        Schema::dropIfExists('goods_order_aftersale_records');
    }
}
