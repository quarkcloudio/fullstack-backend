<?php

namespace App\Modules\Mobile\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Goods;
use App\Models\GoodsSku;
use App\Models\Attribute;
use App\Models\Promotion;
use App\Services\Helper;
use EasyWeChat\Factory;
use DB;

class GoodsController extends Controller
{
	/**
     * 商品主题页
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');
        $tag     = $request->input('tag');
        $sort    = $request->input('sort');

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
        }

        // 定义对象
        $query = Goods::query();
        $num = 12;
        $indexTpl = 'goods/index';

        if(!empty($tag)) {
            $query->where('tags', 'like', '%'.mb_convert_encoding($tag,'UTF-8','auto').'%');
        }

        if(!empty($category)) {
            $query = $query->where('category_id', $category->id);
            $num = $category->page_num;
            $indexTpl = $category->index_tpl;
        }

        switch ($sort) {
            case 'sales_num_desc':
                $query->orderBy('sales_num', 'desc');
                break;
            case 'price_desc':
                $query->orderBy('now_price', 'desc');
                break;
            case 'price_asc':
                $query->orderBy('now_price', 'asc');
                break;
            default:
                $query->orderBy('level', 'desc')->orderBy('id', 'desc');
                break;
        }

        $goods = $query->paginate($num);

        if(!empty($goods)) {
            foreach ($goods as $key => $value) {

                // 获取封面图
                if(!empty($value->cover_ids)) {
                    $coverIds = json_decode($value->cover_ids, true);
                    foreach ($coverIds as $coverKey => $coverValue) {
                        $cover_paths[] =  Helper::getPicture($coverValue);
                    }
                    $goods[$key]->cover_paths = $cover_paths;
                }

                if (!empty($value->spu_data)) {
                    // 解析spu
                    $goods[$key]->spu_data  =  json_decode($value->spu_data, true);
                }

                if (!empty($value->sku_ids)) {
                    // 获取所有sku
                    $skuIds = json_decode($value->sku_ids, true);
                    $skuData = GoodsSku::where('status',1)
                    ->whereIn('id',$skuIds)
                    ->orderBy('sort', 'asc')
                    ->get()
                    ->toArray();

                    foreach($skuData as $keySkuData => $valueSkuData) {
                        $skuData[$keySkuData]['promotion_title'] = '';
                        if(!empty($valueSkuData['promotion_ids'])) {
                            $promotion = Promotion::where('id',$valueSkuData['promotion_ids'])
                            ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                            ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                            ->first();
                            if(!empty($promotion)) {
                                $skuData[$keySkuData]['promotion_title'] = $promotion['title'];
                            }
                        }
                    }

                    $goods[$key]->sku_data = $skuData;
                }

            }
        }

        $jsApi = '';

        // 微信中登录认证
        if (Helper::isWechat()) {
            $app = Factory::officialAccount(Helper::wechatConfig());
            $jsApi = $app->jssdk->buildConfig(array('onMenuShareTimeline', 'onMenuShareAppMessage'));
        }

        return view($indexTpl,compact('goods','jsApi'));
    }

	/**
     * 商品列表页
     * @author tangtanglove
	 */
    public function lists(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');
        $tag    = $request->input('tag');
        $sort    = $request->input('sort');

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
        }

        if(empty($category)) {
            return $this->error('无此分类！');
        }

        // 定义对象
        $query = Goods::query();

        if(!empty($tag)) {
            $query->where('tags', 'like', '%'.mb_convert_encoding($tag,'UTF-8','auto').'%');
        }

        switch ($sort) {
            case 'sales_num_desc':
                $query->orderBy('sales_num', 'desc');
                break;
            case 'price_desc':
                $query->orderBy('now_price', 'desc');
                break;
            case 'price_asc':
                $query->orderBy('now_price', 'asc');
                break;
            default:
                $query->orderBy('level', 'desc')->orderBy('id', 'desc');
                break;
        }

        $goods = $query->where('category_id', $category->id)
        ->paginate($category->page_num);

        if(!empty($goods)) {
            foreach ($goods as $key => $value) {

                // 获取封面图
                if(!empty($value->cover_ids)) {
                    $coverIds = json_decode($value->cover_ids, true);
                    foreach ($coverIds as $coverKey => $coverValue) {
                        $cover_paths[] =  Helper::getPicture($coverValue);
                    }
                    $goods[$key]->cover_paths = $cover_paths;
                }

                if (!empty($value->spu_data)) {
                    // 解析spu
                    $goods[$key]->spu_data  =  json_decode($value->spu_data, true);
                }

                if (!empty($value->sku_ids)) {
                    // 获取所有sku
                    $skuIds = json_decode($value->sku_ids, true);
                    $skuData = GoodsSku::where('status',1)
                    ->whereIn('id',$skuIds)
                    ->orderBy('sort', 'asc')
                    ->get()
                    ->toArray();

                    foreach($skuData as $keySkuData => $valueSkuData) {
                        $skuData[$keySkuData]['promotion_title'] = '';
                        if(!empty($valueSkuData['promotion_ids'])) {
                            $promotion = Promotion::where('id',$valueSkuData['promotion_ids'])
                            ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                            ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                            ->first();
                            if(!empty($promotion)) {
                                $skuData[$keySkuData]['promotion_title'] = $promotion['title'];
                            }
                        }
                    }

                    $goods[$key]->sku_data = $skuData;
                }
            }
        }

        $jsApi = '';

        // 微信中登录认证
        if (Helper::isWechat()) {
            $app = Factory::officialAccount(Helper::wechatConfig());
            $jsApi = $app->jssdk->buildConfig(array('onMenuShareTimeline', 'onMenuShareAppMessage'));
        }

        return view($category->lists_tpl,compact('goods','category','jsApi'));
    }

	/**
     * 商品详情页
     * @author tangtanglove
	 */
    public function detail(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');
        $skuId   = $request->input('skuId');

        if (!empty($id)) {
            $goods = Goods::where('id', $id)->first();
        } elseif(!empty($name)) {
            $goods = Goods::where('name', $name)->first();
        } else {
            return $this->error('参数错误！');
        }

        $category = Category::where('id', $goods->category_id)->first();

        // 浏览量自增
        Goods::where('id', $id)->increment('view');

        // 获取封面图
        if(!empty($goods->cover_ids)) {
            $coverIds = json_decode($goods->cover_ids, true);
            foreach ($coverIds as $coverKey => $coverValue) {
                $cover_paths[] =  Helper::getPicture($coverValue);
            }
            $goods->cover_paths = $cover_paths;
        }

        if (!empty($goods->spu_data)) {
            // 解析spu
            $goods->spu_data  =  json_decode($goods->spu_data, true);
        }

        // spu属性
        $spuAttributes  =  Attribute::where('category_id',$goods->category_id)->where('attr_type',1)->get();

        // sku属性
        $skuAttributes  =  Attribute::where('category_id',$goods->category_id)->where('attr_type',2)->get();

        if (!empty($goods->sku_ids)) {
            // 获取所有sku
            $skuIds = json_decode($goods->sku_ids, true);
            $skus = GoodsSku::where('status',1)
            ->whereIn('id',$skuIds)
            ->orderBy('sort', 'asc')
            ->get();

            foreach ($skus as $key => $sku) {

                $skus[$key]['promotion_title'] = '';
                if(!empty($sku['promotion_ids'])) {
                    $promotion = Promotion::where('id',$sku['promotion_ids'])
                    ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                    ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                    ->first();
                    if(!empty($promotion)) {
                        $skus[$key]['promotion_title'] = $promotion['title'];
                    }
                }

                $getSkuData[] = $skus[$key]->sku_data =  json_decode($sku->sku_data, true);
            }

            $goods->skus = $skus;
        }

        foreach ($skuAttributes as $key => $value) {
            if ($value->type == 'select') {
                // 获取所有属性值
                $getOptions = explode("\n",$value->option);
                $options = [];
                if(!empty($getOptions)) {
                    foreach ($getSkuData as $key1 => $sku) {
                        foreach ($getOptions as $key2 => $option) {
                            if(isset($sku[$value['name']])) {
                                if($option == $sku[$value['name']]) {
                                    $options[] = $option;
                                }
                            }
                        }
                    }
                }

                $skuAttributes[$key]->option = $options;
            }
        }

        if(!empty($goods->tags)) {
            $goods->tags = explode(',',$goods->tags);
        }

        $jsApi = '';

        // 微信中登录认证
        if (Helper::isWechat()) {
            $app = Factory::officialAccount(Helper::wechatConfig());
            $jsApi = $app->jssdk->buildConfig(array('onMenuShareTimeline', 'onMenuShareAppMessage'));
        }

        return view($category->detail_tpl,compact('goods','spuAttributes','skuAttributes','category','jsApi'));
    }

	/**
     * 商品sku信息
     * @author tangtanglove
	 */
    public function skuInfo(Request $request)
    {
        // 商品id
        $id        = $request->input('id');

        // 所选sku属性
        $skuData   = $request->input('skuData');

        // 将json转换为数组
        $skuArray  = json_decode($skuData, true);

        if($skuArray) {
            // 组合json查询条件
            foreach ($skuArray as $key => $value) {
                $subArray = explode(':',$value);
                $querySkuData[$subArray[0]] = $subArray[1];
            }

            $goods = Goods::where('id', $id)->first();

            // sku信息
            $skuIds = json_decode($goods->sku_ids, true);
            $skus = GoodsSku::where('status',1)
            ->whereIn('id',$skuIds)
            ->where('sku_data', json_encode($querySkuData))
            ->first();
        } else {
            $goods = Goods::where('id', $id)->first();

            // sku信息
            $skuIds = json_decode($goods->sku_ids, true);
            $skus = GoodsSku::where('status',1)
            ->whereIn('id',$skuIds)
            ->orderBy('sort', 'asc')
            ->first();
        }

        return $this->success('获取成功！','',$skus);
    }
}