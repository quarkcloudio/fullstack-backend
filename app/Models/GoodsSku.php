<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsSku extends Model
{
     /**
     * 该模型是否被自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = false;
     
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'goods_id',
        'shop_id',
        'properties',
        'property_name',
        'stock_num',
        'warn_num',
        'goods_price',
        'market_price',
        'goods_sn',
        'goods_barcode'
    ];
}
