<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupbuyOrderTicket extends Model
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
        'goods_id',
        'groupbuy_order_id',
        'status',
        'code',
        'expire_at'        
        
    ];
}
