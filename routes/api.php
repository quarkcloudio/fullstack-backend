<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'v1','namespace' => 'Api\\V1','middleware' => ['auth:api','throttle:60,1']],function ($router) {
    $router->get('index/index', 'IndexController@index')->name('api/v1/index/index');
});