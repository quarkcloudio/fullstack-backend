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

// tools路由组
Route::group(['prefix' => 'tools','namespace' => 'Tools'],function ($router)
{
    $router->get('captcha/getImage', 'Tools\\CaptchaController@getImage')->name('tools/captcha/getImage');
    $router->get('qrcode/getQrcode', 'Tools\\QrcodeController@getQrcode')->name('tools/qrcode/getQrcode');
    $router->any('sms/send', 'Tools\\SmsController@send')->name('tools/sms/send');
    $router->get('picture/getPicture', 'Tools\\PictureController@getPicture')->name('tools/picture/getPicture');
    $router->post('picture/upload', 'Tools\\PictureController@upload')->name('tools/picture/upload');
    $router->post('picture/base64Upload', 'Tools\\PictureController@base64Upload')->name('tools/picture/base64Upload');
    $router->post('file/upload', 'Tools\\FileController@upload')->name('tools/file/upload');
    $router->any('git/webhook', 'Tools\\GitController@webhook')->name('tools/git/webhook');
});

// 支付系统路由组
Route::group(['prefix' => 'cashier','namespace' => 'Cashier'],function ($router)
{
    // 微信支付
    $router->get('wechat/jsapiPay', 'Cashier\\WechatController@jsapiPay')->name('cashier/wechat/jsapiPay');
    $router->get('wechat/appPay', 'Cashier\\WechatController@appPay')->name('cashier/wechat/appPay');
    $router->get('wechat/nativePay', 'Cashier\\WechatController@nativePay')->name('cashier/wechat/nativePay');
    $router->get('wechat/miniprogramPay', 'Cashier\\WechatController@miniprogramPay')->name('cashier/wechat/miniprogramPay');
    $router->any('wechat/notifyUrl', 'Cashier\\WechatController@notifyUrl')->name('cashier/wechat/notifyUrl');
    $router->get('wechat/successPage', 'Cashier\\WechatController@successPage')->name('cashier/wechat/successPage');
    $router->get('wechat/getPayStatus', 'Cashier\\WechatController@getPayStatus')->name('cashier/wechat/getPayStatus');
    $router->get('wechat/errorPage', 'Cashier\\WechatController@errorPage')->name('cashier/wechat/errorPage');

    // 支付宝支付
    $router->get('alipay/wapPay', 'Cashier\\AlipayController@wapPay')->name('cashier/alipay/wapPay');
    $router->get('alipay/appPay', 'Cashier\\AlipayController@appPay')->name('cashier/alipay/appPay');
    $router->get('alipay/pagePay', 'Cashier\\AlipayController@pagePay')->name('cashier/alipay/pagePay');
    $router->any('alipay/wapNotifyUrl', 'Cashier\\AlipayController@wapNotifyUrl')->name('cashier/alipay/wapNotifyUrl');
    $router->any('alipay/pageNotifyUrl', 'Cashier\\AlipayController@pageNotifyUrl')->name('cashier/alipay/pageNotifyUrl');
    $router->any('alipay/wapReturnUrl', 'Cashier\\AlipayController@wapReturnUrl')->name('cashier/alipay/wapReturnUrl');
    $router->any('alipay/pageReturnUrl', 'Cashier\\AlipayController@pageReturnUrl')->name('cashier/alipay/pageReturnUrl');
    $router->get('alipay/successPage', 'Cashier\\AlipayController@successPage')->name('cashier/alipay/successPage');

    // 账户余额支付
    $router->get('virtuaCurrency/pay', 'Cashier\\VirtuaCurrencyController@pay')->name('cashier/virtuaCurrency/pay');
    $router->get('virtuaCurrency/appPay', 'Cashier\\VirtuaCurrencyController@appPay')->name('cashier/virtuaCurrency/appPay');
    $router->get('virtuaCurrency/successPage', 'Cashier\\VirtuaCurrencyController@successPage')->name('cashier/virtuaCurrency/successPage');
    $router->get('virtuaCurrency/errorPage', 'Cashier\\VirtuaCurrencyController@errorPage')->name('cashier/virtuaCurrency/errorPage');
});

// PC已登录路由组
Route::group(['namespace' => 'Home','middleware' => ['web']],function ($router) {

});