<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Printer extends Model
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
        'shop_id',
        'name',
        'machine_code',
        'phone',
        'client_id',
        'client_secret',
        'status'
    ];
    
}