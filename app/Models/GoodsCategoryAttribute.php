<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsCategoryAttribute extends Model
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
        'goods_category_id',
        'goods_attribute_id',
        'gorup_name',
        'sort',
        'type',
        'is_required',
        'is_filter',
        'is_alias',
        'is_desc'
    ];
}
