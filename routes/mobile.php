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

// 手机端已登录路由组
Route::group(['prefix' => 'mobile','namespace' => 'Mobile','middleware' => ['web']],function ($router) {

});