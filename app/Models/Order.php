<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
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
        'order_no',
        'thirdparty_order_no',
        'title',
        'total_amount',
        'pay_amount',
        'point_amount',
        'discount_amount',
        'refund_amount',
        'pay_type',
        'paid_at',
        'type',
        'status'
    ];
}