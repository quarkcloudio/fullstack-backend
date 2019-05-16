<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GroupbuyGoods extends Model
{
    use SoftDeletes;

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
        'adminid',
        'shop_id',
        'tags',
        'goods_name',
        'keywords',
        'description',
        'goods_price',
        'market_price',
        'stock_num',
        'warn_num',
        'cover_id',
        'pc_content',
        'mobile_content',
        'use_rule',
        'bottom_layout_id',
        'stock_mode',
        'comment',
        'view',
        'sales_num',
        'comment_status',
        'rate',
        'status',
        'goods_reason',
        'expiry_date',
        'use_time',
        'is_refund_anytime',
        'is_auto_refund',
        'opened_at',
        'closed_at',
        'created_at',
        'updated_at'
    ];
     
    protected $dates = ['delete_at'];
}
