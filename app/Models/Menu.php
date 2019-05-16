<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{

    /**
     * 该模型是否被自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;
    
    protected $fillable=['name','guard_name','icon','pid','sort','path','show','status'];   //允许批量赋值的字段
}