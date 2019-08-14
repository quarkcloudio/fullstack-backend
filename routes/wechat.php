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

// 微信未登录路由组
Route::group(['prefix' => 'wechat','namespace' => 'Wechat'],function ($router) {
    $router->any('server/token', 'ServerController@token')->name('wechat/server/token');
});

// 微信已登录路由组
Route::group(['prefix' => 'wechat','namespace' => 'Wechat','middleware' => ['wechat']],function ($router) {
    $router->any('user/index', 'UserController@index')->name('wechat/user/index');
});