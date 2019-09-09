<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Merchant extends Model
{

    /**
     * 该模型是否被自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;
    
    protected $fillable=[
        'uid',
        'score',
        'money',
        'bank_name',
        'bank_payee',
        'bank_number',
        'last_login_ip',
        'last_login_time',
        'status'
    ];
    
    protected $dates = ['delete_at'];
}