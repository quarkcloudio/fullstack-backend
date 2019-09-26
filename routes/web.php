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
    $router->get('captcha/getImage', 'CaptchaController@getImage')->name('tools/captcha/getImage');
    $router->get('qrcode/getQrcode', 'QrcodeController@getQrcode')->name('tools/qrcode/getQrcode');
    $router->any('sms/send', 'SmsController@send')->name('tools/sms/send');
    $router->get('picture/getPicture', 'PictureController@getPicture')->name('tools/picture/getPicture');
    $router->post('picture/upload', 'PictureController@upload')->name('tools/picture/upload');
    $router->post('picture/base64Upload', 'PictureController@base64Upload')->name('tools/picture/base64Upload');
    $router->get('picture/insert', 'PictureController@insert')->name('tools/picture/insert');
    $router->post('file/upload', 'FileController@upload')->name('tools/file/upload');
    $router->any('git/webhook', 'GitController@webhook')->name('tools/git/webhook');
});

// 支付系统路由组
Route::group(['prefix' => 'cashier','namespace' => 'Cashier'],function ($router)
{
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

// Home未登录路由组
Route::group(['namespace' => 'Home'],function ($router) {
    $router->get('/', 'IndexController@index')->name('/');
    $router->get('home/index/index', 'IndexController@index')->name('home/index/index');
    $router->get('home/page/index', 'PageController@index')->name('home/page/index');
    $router->get('home/article/index', 'ArticleController@index')->name('home/article/index');
    $router->get('home/article/list', 'ArticleController@list')->name('home/article/list');
    $router->get('home/article/detail', 'ArticleController@detail')->name('home/article/detail');
    $router->get('home/video/index', 'VideoController@index')->name('home/video/index');
    $router->get('home/video/list', 'VideoController@list')->name('home/video/list');
    $router->get('home/video/detail', 'VideoController@detail')->name('home/video/detail');
    $router->any('home/search/index', 'SearchController@index')->name('home/search/index');
});

// PC已登录路由组
Route::group(['namespace' => 'Home','middleware' => ['auth']],function ($router) {
    $router->get('index/index', 'IndexController@index')->name('home/index/index');
});