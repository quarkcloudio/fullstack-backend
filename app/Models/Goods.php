<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Goods extends Model
{
    use SoftDeletes;
    /**
        * 该模型是否被自动维护时间戳
        *
        * @var bool
        */
       public $timestamps = true;
        
       /**
        * The attributes that are mass assignable.
        *
        * @var array
        */
       protected $fillable = [
           'shop_id',
           'goods_category_id',
           'shop_self_category_ids',
           'tags',
           'goods_mode',
           'goods_name',
           'keywords',
           'description',
           'brand_id',
           'goods_system_spus',
           'goods_shop_spus',
           'goods_moq',
           'goods_price',
           'market_price',
           'cost_price',
           'stock_num',
           'warn_num',
           'goods_sn',
           'goods_barcode',
           'goods_stockcode',        
           'cover_id',
           'video_id',
           'pc_content',
           'mobile_content',
           'top_layout_id',
           'bottom_layout_id',
           'packing_layout_id',
           'service_layout_id',
           'goods_weight',
           'goods_volume',
           'goods_freight_type',
           'freight_id',           
           'invoice_type',
           'user_discount',
           'stock_mode',
           'comment',
           'view',
           'sales_num',
           'comment_status',
           'effective_type',
           'effective_hour',
           'valid_period_type',
           'add_time_begin',
           'add_time_end',
           'valid_period_hour',
           'valid_period_day',
           'is_expired_refund',
           'rate',
           'status',
           'goods_reason',    
           'is_sku'
       ];
        
       protected $dates = ['delete_at'];
}
