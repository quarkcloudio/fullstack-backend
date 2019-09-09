<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Navigation extends Model
{
    use SoftDeletes;

    /**
     * 该模型是否被自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;
    
    protected $fillable=['title','pid','uid','sort','cover_id','url_type','url','status'];   //允许批量赋值的字段

    protected $dates = ['delete_at'];
}