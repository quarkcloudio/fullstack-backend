<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Services\Helper;
use App\Models\Banner;
use App\Models\BannerCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BannerController extends BaseController
{
    public function index(Request $request)
    {
        $name = $request->input('name');

        if (empty($name)) {
            return $this->error('请输入广告名称');
        }

        // 获取分类信息
        $bannerCategory = BannerCategory::where('status',1)->where('name',$name)->first();

        if (empty($bannerCategory)) {
            return $this->error('无此广告');
        }

        // 获取广告列表
        $banners = Banner::where('status',1)->where('category_id',$bannerCategory->id)
        ->orderBy('sort', 'asc')
        ->get()
        ->toArray();

        foreach ($banners as $key => $value) {
            if((strpos($value['url'],'article') !== false) && (strpos($value['url'],'detail') !== false)) {
                $urlLists = explode('?',$value['url']);
                if($urlLists) {
                    $banners[$key]['url'] = '#newsdetail.html?'.$urlLists[1];
                }
            }

            if((strpos($value['url'],'lovestoreGoods') !== false) && (strpos($value['url'],'detail') !== false)) {
                $urlLists = explode('?',$value['url']);
                if($urlLists) {
                    $banners[$key]['url'] = '#widget://lovestore/product.html?'.$urlLists[1];
                }
            }
        }

        return $this->success('获取成功','',Helper::mobileAdaptor($banners));
    }
}