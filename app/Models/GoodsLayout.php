<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsLayout extends Model
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
        'id',
        'layout_name',
        'position',
        'content',
        'status'
    ];
}
