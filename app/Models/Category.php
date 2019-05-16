<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
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
        'uuid', 
        'shop_id',
        'pid',
        'title',
        'sort',
        'cover_id',
        'name',
        'description',
        'count',
        'index_tpl',
        'lists_tpl',
        'detail_tpl',
        'page_num',
        'status',
        'type',
    ];
     
    protected $dates = ['delete_at'];
}