<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
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
        'uid',
        'consignee',
        'province',
        'city',
        'county',
        'street',
        'phone',
        'status',
        'created_at',
        'updated_at'
    ];
}
