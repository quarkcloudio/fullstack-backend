<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bug extends Model
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
        'content',
        'cover_ids',
        'status'
    ];
}