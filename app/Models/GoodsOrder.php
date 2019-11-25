<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsOrder extends Model
{
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
        'uid',
        'shop_id',
        'order_id',
        'total_amount',
        'buyer_pay_amount',
        'point_amount',
        'mdiscount_amount',
        'discount_amount',
        'freight_amount',
        'cart_ids',
        'consignee_name',
        'consignee_phone',
        'consignee_province',
        'consignee_city',
        'consignee_county',
        'consignee_town',
        'consignee_address',
        'status',
        'close_type',
        'close_reason',
        'timeout_express',
        'timeout_receipt',
        'virtual_code',
        'remark',
        'goods_mode'
    ];
}
