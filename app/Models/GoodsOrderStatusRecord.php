<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsOrderStatusRecord extends Model
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
        'order_id',
        'goods_order_id',
        'status'
    ];
}
