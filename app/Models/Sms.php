<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sms extends Model
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
        'phone',
        'code',
        'content',
        'error_times',
        'status'
    ];
}