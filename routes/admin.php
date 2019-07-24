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

// 后台管理api
Route::post('admin/login', 'Auth\\AdminLoginController@login')->name('api/admin/login');
Route::any('admin/logout', 'Auth\\AdminLoginController@logout')->name('api/admin/logout');
Route::get('admin/loginErrorTimes', 'Auth\\AdminLoginController@loginErrorTimes')->name('api/admin/loginErrorTimes');

// 助手工具
Route::get('admin/tool/captcha', 'Admin\\ToolController@captcha')->name('api/admin/tool/captcha');
Route::get('admin/tool/qrcode', 'Admin\\ToolController@qrcode')->name('api/admin/tool/qrcode');
Route::any('admin/tool/sms', 'Admin\\ToolController@sms')->name('api/admin/tool/sms');
Route::any('admin/tool/email', 'Admin\\ToolController@email')->name('api/admin/tool/email');
Route::get('admin/tool/getPicture', 'Admin\\ToolController@getPicture')->name('api/admin/tool/getPicture');
Route::post('admin/tool/uploadPicture', 'Admin\\ToolController@uploadPicture')->name('api/admin/tool/uploadPicture');
Route::post('admin/tool/uploadFile', 'Admin\\ToolController@uploadFile')->name('api/admin/tool/uploadFile');
Route::post('admin/tool/uploadPictureFromBase64', 'Admin\\ToolController@uploadPictureFromBase64')->name('api/admin/tool/uploadPictureFromBase64');
Route::any('admin/tool/area', 'Admin\\ToolController@area')->name('api/admin/tool/area');
Route::get('admin/tool/clearCache', 'Admin\\ToolController@clearCache')->name('api/admin/tool/clearCache');

// 后台登录后认证路由
Route::group(['middleware' => ['admin']], function() {

    Route::get('admin/console/index', 'Admin\\ConsoleController@index')->name('api/admin/console/index');

    Route::any('admin/account/info', 'Admin\\AccountController@info')->name('api/admin/account/info');
    Route::post('admin/account/profile', 'Admin\\AccountController@profile')->name('api/admin/account/profile');
    Route::post('admin/account/password', 'Admin\\AccountController@password')->name('api/admin/account/password');
    Route::any('admin/account/menus', 'Admin\\AccountController@menus')->name('api/admin/account/menus');

    Route::get('admin/article/index', 'Admin\\ArticleController@index')->name('api/admin/article/index');
    Route::get('admin/article/create', 'Admin\\ArticleController@create')->name('api/admin/article/create');
    Route::post('admin/article/store', 'Admin\\ArticleController@store')->name('api/admin/article/store');
    Route::get('admin/article/edit', 'Admin\\ArticleController@edit')->name('api/admin/article/edit');
    Route::post('admin/article/save', 'Admin\\ArticleController@save')->name('api/admin/article/save');
    Route::post('admin/article/changeStatus', 'Admin\\ArticleController@changeStatus')->name('api/admin/article/changeStatus');
    Route::get('admin/article/myPublished', 'Admin\\ArticleController@myPublished')->name('api/admin/article/myPublished');
    
    Route::get('admin/page/index', 'Admin\\PageController@index')->name('api/admin/page/index');
    Route::get('admin/page/create', 'Admin\\PageController@create')->name('api/admin/page/create');
    Route::post('admin/page/store', 'Admin\\PageController@store')->name('api/admin/page/store');
    Route::get('admin/page/edit', 'Admin\\PageController@edit')->name('api/admin/page/edit');
    Route::post('admin/page/save', 'Admin\\PageController@save')->name('api/admin/page/save');
    Route::post('admin/page/changeStatus', 'Admin\\PageController@changeStatus')->name('api/admin/page/changeStatus');
    
    Route::get('admin/user/index', 'Admin\\UserController@index')->name('api/admin/user/index');
    Route::get('admin/user/create', 'Admin\\UserController@create')->name('api/admin/user/create');
    Route::post('admin/user/store', 'Admin\\UserController@store')->name('api/admin/user/store');
    Route::get('admin/user/edit', 'Admin\\UserController@edit')->name('api/admin/user/edit');
    Route::post('admin/user/save', 'Admin\\UserController@save')->name('api/admin/user/save');
    Route::post('admin/user/changeStatus', 'Admin\\UserController@changeStatus')->name('api/admin/user/changeStatus');
    Route::any('admin/user/recharge', 'Admin\\UserController@recharge')->name('api/admin/user/recharge');

    Route::get('admin/admin/index', 'Admin\\AdminController@index')->name('api/admin/admin/index');
    Route::get('admin/admin/create', 'Admin\\AdminController@create')->name('api/admin/admin/create');
    Route::post('admin/admin/store', 'Admin\\AdminController@store')->name('api/admin/admin/store');
    Route::get('admin/admin/edit', 'Admin\\AdminController@edit')->name('api/admin/admin/edit');
    Route::post('admin/admin/save', 'Admin\\AdminController@save')->name('api/admin/admin/save');
    Route::post('admin/admin/changeStatus', 'Admin\\AdminController@changeStatus')->name('api/admin/admin/changeStatus');

    Route::get('admin/permission/index', 'Admin\\PermissionController@index')->name('api/admin/permission/index');
    Route::get('admin/permission/create', 'Admin\\PermissionController@create')->name('api/admin/permission/create');
    Route::post('admin/permission/store', 'Admin\\PermissionController@store')->name('api/admin/permission/store');
    Route::get('admin/permission/edit', 'Admin\\PermissionController@edit')->name('api/admin/permission/edit');
    Route::post('admin/permission/save', 'Admin\\PermissionController@save')->name('api/admin/permission/save');
    Route::post('admin/permission/changeStatus', 'Admin\\PermissionController@changeStatus')->name('api/admin/permission/changeStatus');

    Route::get('admin/role/index', 'Admin\\RoleController@index')->name('api/admin/role/index');
    Route::get('admin/role/create', 'Admin\\RoleController@create')->name('api/admin/role/create');
    Route::post('admin/role/store', 'Admin\\RoleController@store')->name('api/admin/role/store');
    Route::get('admin/role/edit', 'Admin\\RoleController@edit')->name('api/admin/role/edit');
    Route::post('admin/role/save', 'Admin\\RoleController@save')->name('api/admin/role/save');
    Route::post('admin/role/changeStatus', 'Admin\\RoleController@changeStatus')->name('api/admin/role/changeStatus');

    Route::get('admin/actionLog/index', 'Admin\\ActionLogController@index')->name('api/admin/actionLog/index');
    Route::post('admin/actionLog/destroy', 'Admin\\ActionLogController@destroy')->name('api/admin/actionLog/destroy');

    Route::get('admin/sms/index', 'Admin\\SmsController@index')->name('api/admin/sms/index');
    Route::post('admin/sms/destroy', 'Admin\\SmsController@destroy')->name('api/admin/sms/destroy');

    Route::get('admin/category/index', 'Admin\\CategoryController@index')->name('api/admin/category/index');
    Route::get('admin/category/create', 'Admin\\CategoryController@create')->name('api/admin/category/create');
    Route::post('admin/category/store', 'Admin\\CategoryController@store')->name('api/admin/category/store');
    Route::get('admin/category/edit', 'Admin\\CategoryController@edit')->name('api/admin/category/edit');
    Route::post('admin/category/save', 'Admin\\CategoryController@save')->name('api/admin/category/save');
    Route::post('admin/category/destroy', 'Admin\\CategoryController@destroy')->name('api/admin/category/destroy');
    Route::post('admin/category/changeStatus', 'Admin\\CategoryController@changeStatus')->name('api/admin/category/changeStatus');
    
    Route::any('admin/config/website', 'Admin\\ConfigController@website')->name('api/admin/config/website');
    Route::any('admin/config/saveWebsite', 'Admin\\ConfigController@saveWebsite')->name('api/admin/config/saveWebsite');
    Route::any('admin/config/index', 'Admin\\ConfigController@index')->name('api/admin/config/index');
    Route::get('admin/config/create', 'Admin\\ConfigController@create')->name('api/admin/config/create');
    Route::post('admin/config/store', 'Admin\\ConfigController@store')->name('api/admin/config/store');
    Route::get('admin/config/edit', 'Admin\\ConfigController@edit')->name('api/admin/config/edit');
    Route::post('admin/config/save', 'Admin\\ConfigController@save')->name('api/admin/config/save');
    Route::post('admin/config/changeStatus', 'Admin\\ConfigController@changeStatus')->name('api/admin/config/changeStatus');

    Route::get('admin/navigation/index', 'Admin\\NavigationController@index')->name('api/admin/navigation/index');
    Route::get('admin/navigation/create', 'Admin\\NavigationController@create')->name('api/admin/navigation/create');
    Route::post('admin/navigation/store', 'Admin\\NavigationController@store')->name('api/admin/navigation/store');
    Route::get('admin/navigation/edit', 'Admin\\NavigationController@edit')->name('api/admin/navigation/edit');
    Route::post('admin/navigation/save', 'Admin\\NavigationController@save')->name('api/admin/navigation/save');
    Route::post('admin/navigation/destroy', 'Admin\\NavigationController@destroy')->name('api/admin/navigation/destroy');
    Route::post('admin/navigation/changeStatus', 'Admin\\NavigationController@changeStatus')->name('api/admin/navigation/changeStatus');

    Route::get('admin/banner/index', 'Admin\\BannerController@index')->name('api/admin/banner/index');
    Route::get('admin/banner/create', 'Admin\\BannerController@create')->name('api/admin/banner/create');
    Route::post('admin/banner/store', 'Admin\\BannerController@store')->name('api/admin/banner/store');
    Route::get('admin/banner/edit', 'Admin\\BannerController@edit')->name('api/admin/banner/edit');
    Route::post('admin/banner/save', 'Admin\\BannerController@save')->name('api/admin/banner/save');
    Route::post('admin/banner/changeStatus', 'Admin\\BannerController@changeStatus')->name('api/admin/banner/changeStatus');

    Route::get('admin/bannerCategory/index', 'Admin\\BannerCategoryController@index')->name('api/admin/bannerCategory/index');
    Route::get('admin/bannerCategory/create', 'Admin\\BannerCategoryController@create')->name('api/admin/bannerCategory/create');
    Route::post('admin/bannerCategory/store', 'Admin\\BannerCategoryController@store')->name('api/admin/bannerCategory/store');
    Route::get('admin/bannerCategory/edit', 'Admin\\BannerCategoryController@edit')->name('api/admin/bannerCategory/edit');
    Route::post('admin/bannerCategory/save', 'Admin\\BannerCategoryController@save')->name('api/admin/bannerCategory/save');
    Route::post('admin/bannerCategory/changeStatus', 'Admin\\BannerCategoryController@changeStatus')->name('api/admin/bannerCategory/changeStatus');
    
    Route::any('admin/file/index', 'Admin\\FileController@index')->name('api/admin/file/index');
    Route::post('admin/file/upload', 'Admin\\FileController@upload')->name('api/admin/file/upload');
    Route::post('admin/file/update', 'Admin\\FileController@update')->name('api/admin/file/update');
    Route::post('admin/file/destroy', 'Admin\\FileController@destroy')->name('api/admin/file/destroy');
    Route::post('admin/file/changeStatus', 'Admin\\FileController@changeStatus')->name('api/admin/file/changeStatus');

    Route::any('admin/picture/index', 'Admin\\PictureController@index')->name('api/admin/picture/index');
    Route::post('admin/picture/upload', 'Admin\\PictureController@upload')->name('api/admin/picture/upload');
    Route::post('admin/picture/update', 'Admin\\PictureController@update')->name('api/admin/picture/update');
    Route::get('admin/picture/edit', 'Admin\\PictureController@edit')->name('api/admin/picture/edit');
    Route::post('admin/picture/save', 'Admin\\PictureController@save')->name('api/admin/picture/save');
    Route::post('admin/picture/destroy', 'Admin\\PictureController@destroy')->name('api/admin/picture/destroy');
    Route::post('admin/picture/changeStatus', 'Admin\\PictureController@changeStatus')->name('api/admin/picture/changeStatus');

    Route::get('admin/comment/index', 'Admin\\CommentController@index')->name('api/admin/comment/index');
    Route::get('admin/comment/edit', 'Admin\\CommentController@edit')->name('api/admin/comment/edit');
    Route::post('admin/comment/save', 'Admin\\CommentController@save')->name('api/admin/comment/save');
    Route::post('admin/comment/changeStatus', 'Admin\\CommentController@changeStatus')->name('api/admin/comment/changeStatus');
    
    Route::get('admin/link/index', 'Admin\\LinkController@index')->name('api/admin/link/index');
    Route::get('admin/link/create', 'Admin\\LinkController@create')->name('api/admin/link/create');
    Route::post('admin/link/store', 'Admin\\LinkController@store')->name('api/admin/link/store');
    Route::get('admin/link/edit', 'Admin\\LinkController@edit')->name('api/admin/link/edit');
    Route::post('admin/link/save', 'Admin\\LinkController@save')->name('api/admin/link/save');
    Route::post('admin/link/changeStatus', 'Admin\\LinkController@changeStatus')->name('api/admin/link/changeStatus');

    Route::get('admin/printer/index', 'Admin\\PrinterController@index')->name('api/admin/printer/index');
    Route::get('admin/printer/create', 'Admin\\PrinterController@create')->name('api/admin/printer/create');
    Route::post('admin/printer/store', 'Admin\\PrinterController@store')->name('api/admin/printer/store');
    Route::get('admin/printer/edit', 'Admin\\PrinterController@edit')->name('api/admin/printer/edit');
    Route::post('admin/printer/save', 'Admin\\PrinterController@save')->name('api/admin/printer/save');
    Route::post('admin/printer/changeStatus', 'Admin\\PrinterController@changeStatus')->name('api/admin/printer/changeStatus');

    Route::get('admin/menu/index', 'Admin\\MenuController@index')->name('api/admin/menu/index');
    Route::get('admin/menu/create', 'Admin\\MenuController@create')->name('api/admin/menu/create');
    Route::post('admin/menu/store', 'Admin\\MenuController@store')->name('api/admin/menu/store');
    Route::get('admin/menu/edit', 'Admin\\MenuController@edit')->name('api/admin/menu/edit');
    Route::post('admin/menu/save', 'Admin\\MenuController@save')->name('api/admin/menu/save');
    Route::post('admin/menu/destroy', 'Admin\\MenuController@destroy')->name('api/admin/menu/destroy');
    Route::post('admin/menu/changeStatus', 'Admin\\MenuController@changeStatus')->name('api/admin/menu/changeStatus');

    Route::get('admin/demo/getFormInfo', 'Admin\\DemoController@getFormInfo')->name('api/admin/demo/getFormInfo');
    Route::get('admin/demo/getModalFormInfo', 'Admin\\DemoController@getModalFormInfo')->name('api/admin/demo/getModalFormInfo');
    Route::post('admin/demo/submit', 'Admin\\DemoController@submit')->name('api/admin/demo/submit');
    Route::get('admin/demo/getListInfo', 'Admin\\DemoController@getListInfo')->name('api/admin/demo/getListInfo');
});

// 文章文件导出
Route::get('admin/article/export', 'Admin\\ArticleController@export')->name('api/admin/article/export');
Route::get('admin/page/export', 'Admin\\PageController@export')->name('api/admin/page/export');

//日志导出
Route::get('admin/logs/export', 'Admin\\LogController@export')->name('api/admin/logs/export');