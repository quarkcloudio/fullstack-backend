<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id',
        'username', 
        'nickname', 
        'email', 
        'sex', 
        'password', 
        'phone',
        'cover_id',
        'money',
        'point',
        'wechat_openid',
        'wechat_unionid',
        'qq_openid',
        'weibo_uid',
        'last_login_ip',
        'last_login_time',
        'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
