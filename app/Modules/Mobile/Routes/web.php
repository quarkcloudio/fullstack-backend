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

Route::group(['prefix' => 'mobile'], function ($router) {
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
});
