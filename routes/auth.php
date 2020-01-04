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

// Web登录
Route::any('login', 'Auth\\LoginController@login')->name('login');
Route::any('register', 'Auth\\RegisterController@register')->name('register');
Route::any('quickLogin', 'Auth\\LoginController@quickLogin')->name('quickLogin');
Route::get('loginErrorTimes', 'Auth\\LoginController@loginErrorTimes')->name('loginErrorTimes');
Route::get('logout', 'Auth\\LoginController@logout')->name('logout');

// 微信登录
Route::any('wxLogin/login', 'Auth\\WxLoginController@login')->name('wxLogin/login');
Route::any('wxLogin/callback', 'Auth\\WxLoginController@callback')->name('wxLogin/callback');

// 微信小程序登录
Route::any('wxMpLogin/login', 'Auth\\WxMpLoginController@login')->name('api/wxMpLogin/login');