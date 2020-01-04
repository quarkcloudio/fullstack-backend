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

// PC未登录路由组
$router->get('/', 'IndexController@index')->name('/');
$router->get('index', 'IndexController@index')->name('index');
$router->get('index/index', 'IndexController@index')->name('index/index');
$router->get('page/index', 'PageController@index')->name('page/index');
$router->get('article/index', 'ArticleController@index')->name('article/index');
$router->get('article/list', 'ArticleController@list')->name('article/list');
$router->get('article/detail', 'ArticleController@detail')->name('article/detail');
$router->get('video/index', 'VideoController@index')->name('video/index');
$router->get('video/list', 'VideoController@list')->name('video/list');
$router->get('video/detail', 'VideoController@detail')->name('video/detail');
$router->any('search/index', 'SearchController@index')->name('search/index');

// PC已登录路由组
Route::group(['middleware' => ['auth']],function ($router) {
    $router->get('user/index', 'UserController@index')->name('user/index');
});