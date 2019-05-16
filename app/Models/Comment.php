<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
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
        'pid', 
        'uid',
        'object_id',
        'title',
        'cover_ids',
        'type',
        'content',
        'ding',
        'cai',
        'report',
        'status',
        'rate'
    ];
}