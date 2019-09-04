<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Shop extends Model
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
        'mch_id',
        'printer_id',
        'title',
        'logo',
        'category_id',
        'tags',
        'description',
        'content',
        'cover_ids',
        'level',
        'position',
        'username',
        'phone',
        'province',
        'city',
        'county',
        'town',
        'address',
        'longitude',
        'latitude',
        'business_license_cover_id',
        'corporate_name',
        'corporate_idcard',
        'corporate_idcard_cover_id',
        'comment',
        'view',
        'comment_status',
        'rate',
        'open_days',
        'open_times',
        'open_status',
        'is_self',
        'status'
    ];
}
