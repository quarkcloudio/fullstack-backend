<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods', function (Blueprint $table) {
            $table->increments('id')->unsigned();            
            $table->integer('shop_id')->unsigned()->nullable()->comment('商家ID');
            $table->integer('goods_category_id')->unsigned()->nullable()->comment('商品分类');
            $table->integer('shop_self_category_ids')->nullable()->comment('商家商品分类');
            $table->string('tags')->nullable()->comment('标签');            
            $table->string('goods_name')->nullable()->comment('商品名称');
            $table->string('keywords')->nullable()->comment('关键字');
            $table->string('description')->nullable()->comment('描述');
            $table->integer('brand_id')->nullable()->comment('品牌ID');
            $table->string('goods_attrs')->nullable()->comment('平台系统属性');
            $table->string('other_attrs')->nullable()->comment('商家自定义属性');
            $table->integer('goods_moq')->nullable()->comment('最小起订量');
            $table->decimal('goods_price',10,2)->nullable()->comment('店铺价:价格必须是0.01~9999999之间的数字，且不能高于市场价');
            $table->decimal('market_price',10,2)->nullable()->comment('市场价:为0则商品详情页不显示，价格必须是0.00~9999999之间的数字，此价格仅为市场参考售价，请根据该实际情况认真填写');
            $table->decimal('cost_price',10,2)->nullable()->comment('成本价:价格必须是0.00~9999999之间的数字，此价格为商户对所销售的商品实际成本价格进行备注记录');
            $table->integer('stock_num')->nullable()->comment('商品库存,店铺库存数量必须为0~999999999之间的整数，若商品存在规格，则系统自动计算商品的总数，此处无需卖家填写');
            $table->integer('warn_num')->nullable()->comment('设置最低库存预警值。当库存低于预警值时商家中心商品列表页库存列红字提醒，0为不预警');
            $table->string('goods_sn')->nullable()->comment('商品货号是指商家管理商品的编号，买家不可见');
            $table->string('goods_barcode')->nullable()->comment('支持一品多码，多个条形码之间用逗号分隔');
            $table->string('goods_stockcode')->nullable()->comment('实体仓库存储商品位置编码');
            $table->integer('cover_id')->nullable()->comment('上传商品默认主图，无规格主图时展示该图');
            $table->integer('video_id')->nullable()->comment('主图视频');
            $table->longText('pc_content')->nullable()->comment('电脑端商品详情');
            $table->longText('mobile_content')->nullable()->comment('手机端商品详情');
            $table->integer('top_layout_id')->nullable()->comment('详情页顶部模板');
            $table->integer('bottom_layout_id')->nullable()->comment('详情页底部模板');
            $table->integer('packing_layout_id')->nullable()->comment('详情页包装清单版式');
            $table->integer('service_layout_id')->nullable()->comment('详情页售后保证版式');
            $table->double('goods_weight')->nullable()->COMMENT('物流重量，商品的重量单位为千克，如果商品的运费模板按照重量计算请填写此项，为空则默认商品重量为0Kg；');
            $table->string('goods_volume')->nullable()->COMMENT('商品的体积单位为立方米，如果商品的运费模板按照体积计算请填写此项，为空则默认商品体积为0立方米；');
            $table->string('goods_freight_type')->nullable()->COMMENT('运费类型 0：店铺承担运费 ，1：运费模板');
            $table->integer('freight_id')->nullable()->COMMENT('运费模板id');
            $table->tinyInteger('invoice_type')->nullable()->COMMENT('发票：0无，1增值税普通发票，2增值税专用发票，3 增值税普通发票 和 增值税专用发票，选择“无”则将不提供发票');
            $table->tinyInteger('user_discount')->nullable()->COMMENT('会员打折：0 不参与会员打折，1参与会员打折，指的是统一的会员折扣是否参与，参与和不参与会员折扣不影响自定义会员价');
            $table->tinyInteger('stock_mode')->nullable()->COMMENT('库存计数：1拍下减库存，2付款减库存，3出库减库存 拍下减库存：买家拍下商品即减少库存，存在恶拍风险。热销商品如需避免超卖可选此方式');
            $table->integer('comment')->nullable()->COMMENT('评论数量');
            $table->integer('view')->nullable()->COMMENT('浏览数量');
            $table->integer('sales_num')->nullable()->COMMENT('浏览数量');
            $table->string('comment_status')->nullable();
            $table->tinyInteger('rate')->nullable();
            $table->tinyInteger('status')->default('1')->nullable()->COMMENT('1出售中，2审核中，3已下架，4商品违规下架');
            $table->string('goods_reason')->nullable()->COMMENT('违规下架原因');
            $table->timestamp('opened_at')->nullable()->comment('开放销售时间');
            $table->timestamp('closed_at')->nullable()->comment('开放销售时间');
            $table->tinyInteger('is_sku')->nullable();
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
        Schema::dropIfExists('goods');
    }
}
