<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsAttribute extends Model
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
        'shop_id',
        'goods_type_id',
        'name',
        'description',
        'style',
        'sort',
        'status',
        'type'
    ];
}
