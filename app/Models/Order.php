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
        'shop_id',
        'uid',
        'order_no',
        'out_trade_no',
        'title',
        'total_amount',
        'receipt_amount',
        'invoice_amount',
        'buyer_pay_amount',
        'freight_amount',
        'point_amount',
        'refund_fee',
        'fund_bill_list',
        'voucher_detail_list',
        'pay_type',
        'paid_at',
        'refund_status',
        'refunded_at',
        'closed_at',
        'type',
        'status'
    ];
}