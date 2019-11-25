<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsOrderDelivery extends Model
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
        'delivery_no',
        'express_type',
        'express_name',
        'express_no',
        'express_send_at',
        'status'
    ];
}
