<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShopsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shops', function (Blueprint $table) {
            $table->engine='innodb';
            $table->increments('id')->unsigned();
            $table->integer('mch_id')->default(0);
            $table->integer('printer_id')->default(0);
            $table->string('title')->comment('店铺名称');
            $table->string('logo')->comment('店铺logo');
            $table->integer('category_id')->comment('店铺分类');
            $table->string('tags')->nullable()->comment('店铺标签');
            $table->string('description')->nullable()->comment('店铺描述');
            $table->longText('content')->comment('店铺介绍');
            $table->string('cover_ids')->comment('店铺封面');
            $table->string('level')->comment('店铺排序，越大越靠前');
            $table->tinyInteger('position')->nullable()->comment('推荐位');
            $table->string('username')->comment('店铺联系人');
            $table->string('phone')->comment('店铺电话');
            $table->string('province')->comment('省')->nullable();
            $table->string('city')->comment('市')->nullable();
            $table->string('county')->comment('县')->nullable();
            $table->string('town')->comment('镇')->nullable();
            $table->string('address')->comment('详细地址')->nullable();
            $table->string('longitude')->nullable()->comment('经度');
            $table->string('latitude')->nullable()->comment('纬度');
            $table->integer('business_license_cover_id')->nullable()->comment('营业执照照片');
            $table->string('corporate_name')->nullable()->comment('法人姓名');
            $table->string('corporate_idcard')->nullable()->comment('法人身份证号');
            $table->integer('corporate_idcard_cover_id')->nullable()->comment('法人身份证照片');
            $table->tinyInteger('comment')->default('0')->comment('评论数');
            $table->tinyInteger('view')->default('0')->comment('浏览数量');
            $table->string('comment_status')->default('open')->comment('是否允许评论');
            $table->tinyInteger('rate')->default(0)->comment('评分');
            $table->string('open_days')->nullable()->comment('营业日期：1~2,4~7，数字代表周几');
            $table->string('open_times')->nullable()->comment('营业时间段：09:00~12:00,13:00~14:00');            
            $table->tinyInteger('open_status')->default(1)->comment('1:营业,2:打烊');
            $table->tinyInteger('is_self')->nullable()->comment('是否为自营店');
            $table->tinyInteger('status')->default(2);
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
        Schema::dropIfExists('shops');
    }
}
