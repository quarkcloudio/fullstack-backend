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
        'order_id',
        'cart_ids',
        'consignee',
        'address',
        'phone',
        'express_name',
        'express_no',
        'express_created_at',
        'express_finished_at',
        'send_uid',
        'send_status',
        'send_created_at',
        'send_finished_at',
        'status',
        'remark',
        'is_virtual',
        'status'
    ];
}
