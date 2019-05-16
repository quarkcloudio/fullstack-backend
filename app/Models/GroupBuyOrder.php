<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupbuyOrder extends Model
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
        'mch_id',
        'order_id',
        'goods_id',
        'title',
        'num',
        'goods_price',
        'market_price',
        'description',
        'cover_id',
        'trade_status'
    ];
}