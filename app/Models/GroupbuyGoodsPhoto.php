<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupbuyGoodsPhoto extends Model
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
        'goods_id',
        'cover_id',
        'sort'
    ];
}
