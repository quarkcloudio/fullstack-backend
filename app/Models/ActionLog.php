<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActionLog extends Model
{
    /**
     * 该模型是否被自动维护时间戳
     *
     * @var bool
     */
     public $timestamps = true;

     protected $fillable=['object_id','action','url','remark','ip','type','status'];   //允许批量赋值的字段
}