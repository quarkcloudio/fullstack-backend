<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// 支付系统路由组
Route::group(['prefix' => 'payment','namespace' => 'Payment'],function ($router)
{
    // 微信支付
    $router->get('wechat/jsapiPay', 'WechatController@jsapiPay')->name('payment/wechat/jsapiPay');
    $router->get('wechat/appPay', 'WechatController@appPay')->name('payment/wechat/appPay');
    $router->get('wechat/nativePay', 'WechatController@nativePay')->name('payment/wechat/nativePay');
    $router->get('wechat/miniprogramPay', 'WechatController@miniprogramPay')->name('payment/wechat/miniprogramPay');
    $router->any('wechat/notifyUrl', 'WechatController@notifyUrl')->name('payment/wechat/notifyUrl');
    $router->get('wechat/successPage', 'WechatController@successPage')->name('payment/wechat/successPage');
    $router->get('wechat/getPayStatus', 'WechatController@getPayStatus')->name('payment/wechat/getPayStatus');
    $router->get('wechat/errorPage', 'WechatController@errorPage')->name('payment/wechat/errorPage');

    // 支付宝支付
    $router->get('alipay/wapPay', 'AlipayController@wapPay')->name('payment/alipay/wapPay');
    $router->get('alipay/appPay', 'AlipayController@appPay')->name('payment/alipay/appPay');
    $router->get('alipay/pagePay', 'AlipayController@pagePay')->name('payment/alipay/pagePay');
    $router->any('alipay/wapNotifyUrl', 'AlipayController@wapNotifyUrl')->name('payment/alipay/wapNotifyUrl');
    $router->any('alipay/pageNotifyUrl', 'AlipayController@pageNotifyUrl')->name('payment/alipay/pageNotifyUrl');
    $router->any('alipay/wapReturnUrl', 'AlipayController@wapReturnUrl')->name('payment/alipay/wapReturnUrl');
    $router->any('alipay/pageReturnUrl', 'AlipayController@pageReturnUrl')->name('payment/alipay/pageReturnUrl');
    $router->get('alipay/successPage', 'AlipayController@successPage')->name('payment/alipay/successPage');

    // 账户余额支付
    $router->get('virtuaCurrency/pay', 'VirtuaCurrencyController@pay')->name('payment/virtuaCurrency/pay');
    $router->get('virtuaCurrency/appPay', 'VirtuaCurrencyController@appPay')->name('payment/virtuaCurrency/appPay');
    $router->get('virtuaCurrency/successPage', 'VirtuaCurrencyController@successPage')->name('payment/virtuaCurrency/successPage');
    $router->get('virtuaCurrency/errorPage', 'VirtuaCurrencyController@errorPage')->name('payment/virtuaCurrency/errorPage');
});