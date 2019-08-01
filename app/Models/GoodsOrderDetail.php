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
        'goods_id',
        'goods_sku_id',
        'mall_order_id',
        'title',
        'num',
        'goods_price',
        'market_price',
        'description',
        'cover_ids',
        'status'
    ];
}
