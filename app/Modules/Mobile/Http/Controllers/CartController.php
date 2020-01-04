<?php

namespace App\Modules\Mobile\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Goods;
use App\Models\ShoppingCart;
use App\Models\GoodsSku;
use App\Models\Promotion;
use App\Services\Helper;
use DB;
use Session;

class CartController extends Controller
{
	/**
     * 购物车列表
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $user = auth('web')->user();

        if(!empty($user)) {
            // 用户登录读取线上购物车
            $uid = $user->id;

            $getShoppingCarts = Session::get('shopping_carts');

            if(!empty($getShoppingCarts)) {
                foreach ($getShoppingCarts as $key => $shoppingCart) {
                    if($shoppingCart['sku_id']) {
                        // 用户登录后，购物车添加到数据库
                        $shoppingCart['uid'] = $uid;

                        $hasShoppingCart = ShoppingCart::where('uid',$user->id)
                        ->where('goods_id',$shoppingCart['goods_id'])
                        ->where('sku_id',$shoppingCart['sku_id'])
                        ->first();
                
                        if($hasShoppingCart) {
                            $shoppingCart['num'] = $shoppingCart['num']+$hasShoppingCart->num;
                            ShoppingCart::where('uid',$user->id)
                            ->where('goods_id',$shoppingCart['goods_id'])
                            ->where('sku_id',$shoppingCart['sku_id'])
                            ->update($shoppingCart);
                        } else {
                            ShoppingCart::create($shoppingCart);
                        }
                    }
                }
            }

            $shoppingCarts = ShoppingCart::where('uid',$uid)->orderBy('id','desc')->get()->toArray();

            Session::put('shopping_carts', '');
        } else {
            // 用户未登录读取session购物车
            $shoppingCarts = Session::get('shopping_carts');
        }

        if(!empty($shoppingCarts)) {
            foreach ($shoppingCarts as $key => $shoppingCart) {
                $info = Goods::where('id',$shoppingCart['goods_id'])->first();
                $sku = GoodsSku::where('id',$shoppingCart['sku_id'])->first();
                $sku['sku_data'] = json_decode($sku['sku_data']);
    
                $sku['promotion_title'] = '';
                if(!empty($sku['promotion_ids'])) {
                    $promotion = Promotion::where('id',$sku['promotion_ids'])
                    ->where('opened_at', '<=', date('Y-m-d H:i:s'))
                    ->where('closed_at', '>=', date('Y-m-d H:i:s'))
                    ->first();
                    if(!empty($promotion)) {
                        $sku['promotion_title'] = $promotion['title'];
                    }
                }
                $shoppingCarts[$key]['info'] = $info;
                $shoppingCarts[$key]['sku'] = $sku;
            }
        }

        return view('cart/index',compact('shoppingCarts'));
    }

	/**
     * 购物车提交
     * @author tangtanglove
	 */
    public function submit(Request $request)
    {
        $cartData = $request->input('cartData');// 所选购物车

        $user = auth('web')->user();

        if(!empty($user)) {
            if(!empty($cartData)) {
                foreach ($cartData as $key => $value) {
                    $arrData = explode(',',$value);
                    $cartId = $arrData[0];
                    $num = $arrData[1];
        
                    $cartIds[] = (int)$cartId;
                    $shoppingCart = ShoppingCart::where('id',$cartId)->first();
                    $jsonData[$key][0] = (int)$shoppingCart->goods_id;
                    $jsonData[$key][1] = (int)$shoppingCart->sku_id;
                    $jsonData[$key][2] = (int)$num;
                }
                $url = url('mobile/order/info?data='.json_encode($jsonData).'&cartIds='.json_encode($cartIds));
            } else {
                $url = 'http://'.$_SERVER['SERVER_NAME'].'/mobile/cart/index';
            }

        } else {
            // 未登录，跳转到登录界面
            $url = url('login?returnUrl=http://'.$_SERVER['SERVER_NAME'].'/mobile/cart/index');
        }

        header('location:'. $url); // 跳转
    }

	/**
     * 保存到购物车
     * @author tangtanglove
	 */
    public function store(Request $request)
    {
        $id        = $request->input('id');// 商品id
        $skuId     = $request->input('skuId');// 所选skuId
        $num       = $request->input('num');// 购买数量

        $user = auth('web')->user();

        if(!empty($user)) {
            // 用户登录，购物车添加到数据库
            $data['uid']        = $user->id;
            $data['goods_id']   = $id;
            $data['sku_id']     = $skuId;

    
            if(empty($data['goods_id']) || empty($data['sku_id'])) {
                return $this->error('请先选择商品');
            }

            $hasShoppingCart = ShoppingCart::where('uid',$user->id)
            ->where('goods_id',$id)
            ->where('sku_id',$skuId)
            ->first();
    
            if($hasShoppingCart) {
                $data['num']        = $num+$hasShoppingCart->num;
                $result = ShoppingCart::where('uid',$user->id)
                ->where('goods_id',$id)
                ->where('sku_id',$skuId)
                ->update($data);
            } else {
                $data['num']        = $num;
                $result = ShoppingCart::create($data);
            }

        } else {
            $data['goods_id']   = $id;
            $data['sku_id']     = $skuId;
            $data['num']        = $num;

            // 用户未登录，购物车添加到Session
            $shoppingCarts = Session::get('shopping_carts');

            $hasResult = false;

            if(!empty($shoppingCarts)) {
                foreach ($shoppingCarts as $key => $shoppingCart) {
                    if(($shoppingCart['goods_id'] == $data['goods_id']) && ($shoppingCart['sku_id'] == $data['sku_id'])){
                        $hasResult = true;
                        $shoppingCarts[$key]['num'] = $num + $shoppingCart['num'];
                    } 
                }
            }

            if($hasResult === false) {
                $shoppingCarts[] = $data;
            }

            Session::put('shopping_carts', $shoppingCarts);
            $result = true;
        }

        if ($result) {
            return $this->success('已经加入购物车！');
        } else {
            return $this->error('添加失败，请重试！');
        }
    }


	/**
     * 获取购物车数量
     * @author tangtanglove
	 */
    public function getNum(Request $request)
    {

        $user = auth('web')->user();

        if(!empty($user)) {
            // 用户登录，购物车添加到数据库
            $uid = $user->id;
            $shoppingCarts = ShoppingCart::where('uid',$uid)->orderBy('id','desc')->get()->toArray();

        } else {
            // 用户未登录，购物车添加到Session
            $shoppingCarts = Session::get('shopping_carts');

        }

        $num = 0;

        if($shoppingCarts) {
            foreach ($shoppingCarts as $key => $shoppingCart) {
                $num = $num + $shoppingCart['num'];
            }
        } else {
            $num = 0;
        }

        return $this->success('获取成功！','',$num);
    }
}