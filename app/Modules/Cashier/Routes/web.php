<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your module. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::group(['prefix' => 'cashier'], function ($router) {
    // 微信支付
    $router->get('wechat/jsapiPay', 'WechatController@jsapiPay')->name('cashier/wechat/jsapiPay');
    $router->get('wechat/appPay', 'WechatController@appPay')->name('cashier/wechat/appPay');
    $router->get('wechat/nativePay', 'WechatController@nativePay')->name('cashier/wechat/nativePay');
    $router->get('wechat/miniprogramPay', 'WechatController@miniprogramPay')->name('cashier/wechat/miniprogramPay');
    $router->any('wechat/notifyUrl', 'WechatController@notifyUrl')->name('cashier/wechat/notifyUrl');
    $router->get('wechat/successPage', 'WechatController@successPage')->name('cashier/wechat/successPage');
    $router->get('wechat/getPayStatus', 'WechatController@getPayStatus')->name('cashier/wechat/getPayStatus');
    $router->get('wechat/errorPage', 'WechatController@errorPage')->name('cashier/wechat/errorPage');

    // 支付宝支付
    $router->get('alipay/wapPay', 'AlipayController@wapPay')->name('cashier/alipay/wapPay');
    $router->get('alipay/appPay', 'AlipayController@appPay')->name('cashier/alipay/appPay');
    $router->get('alipay/pagePay', 'AlipayController@pagePay')->name('cashier/alipay/pagePay');
    $router->any('alipay/wapNotifyUrl', 'AlipayController@wapNotifyUrl')->name('cashier/alipay/wapNotifyUrl');
    $router->any('alipay/pageNotifyUrl', 'AlipayController@pageNotifyUrl')->name('cashier/alipay/pageNotifyUrl');
    $router->any('alipay/wapReturnUrl', 'AlipayController@wapReturnUrl')->name('cashier/alipay/wapReturnUrl');
    $router->any('alipay/pageReturnUrl', 'AlipayController@pageReturnUrl')->name('cashier/alipay/pageReturnUrl');
    $router->get('alipay/successPage', 'AlipayController@successPage')->name('cashier/alipay/successPage');

    // 账户余额支付
    $router->get('virtuaCurrency/pay', 'VirtuaCurrencyController@pay')->name('cashier/virtuaCurrency/pay');
    $router->get('virtuaCurrency/appPay', 'VirtuaCurrencyController@appPay')->name('cashier/virtuaCurrency/appPay');
    $router->get('virtuaCurrency/successPage', 'VirtuaCurrencyController@successPage')->name('cashier/virtuaCurrency/successPage');
    $router->get('virtuaCurrency/errorPage', 'VirtuaCurrencyController@errorPage')->name('cashier/virtuaCurrency/errorPage');
});
