<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsOrderAftersaleRecord extends Model
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
        'goods_order_aftersale_id',
        'aftersale_type',
        'content',
        'status'
    ];
}
