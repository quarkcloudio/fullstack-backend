<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsOrderDetail extends Model
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
        'order_id',
        'goods_order_id',
        'goods_id',
        'goods_sku_id',
        'goods_name',
        'num',
        'goods_properties',
        'goods_property_names',
        'goods_price',
        'market_price',
        'description',
        'cover_id',
        'virtual_code',
        'status'
    ];
}
