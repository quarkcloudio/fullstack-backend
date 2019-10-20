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
Route::get('admin/captcha', 'Auth\\AdminLoginController@captcha')->name('api/admin/captcha');
Route::post('admin/login', 'Auth\\AdminLoginController@login')->name('api/admin/login');
Route::any('admin/logout', 'Auth\\AdminLoginController@logout')->name('api/admin/logout');
Route::get('admin/loginErrorTimes', 'Auth\\AdminLoginController@loginErrorTimes')->name('api/admin/loginErrorTimes');
Route::get('admin/test/index', 'Admin\\TestController@index')->name('api/admin/test/index');

// 后台登录后认证路由
Route::group(['middleware' => ['admin']], function() {

    Route::get('admin/console/index', 'Admin\\ConsoleController@index')->name('api/admin/console/index');
    Route::get('admin/console/clearCache', 'Admin\\ConsoleController@clearCache')->name('api/admin/console/clearCache');
    
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
    
    Route::get('admin/video/index', 'Admin\\VideoController@index')->name('api/admin/video/index');
    Route::get('admin/video/create', 'Admin\\VideoController@create')->name('api/admin/video/create');
    Route::post('admin/video/store', 'Admin\\VideoController@store')->name('api/admin/video/store');
    Route::get('admin/video/edit', 'Admin\\VideoController@edit')->name('api/admin/video/edit');
    Route::post('admin/video/save', 'Admin\\VideoController@save')->name('api/admin/video/save');
    Route::post('admin/video/changeStatus', 'Admin\\VideoController@changeStatus')->name('api/admin/video/changeStatus');
    Route::get('admin/video/myPublished', 'Admin\\VideoController@myPublished')->name('api/admin/video/myPublished');

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
    Route::any('admin/user/suggest', 'Admin\\UserController@suggest')->name('api/admin/user/suggest');

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

    Route::any('admin/config/website', 'Admin\\ConfigController@website')->name('api/admin/config/website');
    Route::any('admin/config/saveWebsite', 'Admin\\ConfigController@saveWebsite')->name('api/admin/config/saveWebsite');
    Route::any('admin/config/index', 'Admin\\ConfigController@index')->name('api/admin/config/index');
    Route::get('admin/config/create', 'Admin\\ConfigController@create')->name('api/admin/config/create');
    Route::post('admin/config/store', 'Admin\\ConfigController@store')->name('api/admin/config/store');
    Route::get('admin/config/edit', 'Admin\\ConfigController@edit')->name('api/admin/config/edit');
    Route::post('admin/config/save', 'Admin\\ConfigController@save')->name('api/admin/config/save');
    Route::post('admin/config/changeStatus', 'Admin\\ConfigController@changeStatus')->name('api/admin/config/changeStatus');

    Route::get('admin/menu/index', 'Admin\\MenuController@index')->name('api/admin/menu/index');
    Route::get('admin/menu/create', 'Admin\\MenuController@create')->name('api/admin/menu/create');
    Route::post('admin/menu/store', 'Admin\\MenuController@store')->name('api/admin/menu/store');
    Route::get('admin/menu/edit', 'Admin\\MenuController@edit')->name('api/admin/menu/edit');
    Route::post('admin/menu/save', 'Admin\\MenuController@save')->name('api/admin/menu/save');
    Route::post('admin/menu/changeStatus', 'Admin\\MenuController@changeStatus')->name('api/admin/menu/changeStatus');

    Route::get('admin/navigation/index', 'Admin\\NavigationController@index')->name('api/admin/navigation/index');
    Route::get('admin/navigation/create', 'Admin\\NavigationController@create')->name('api/admin/navigation/create');
    Route::post('admin/navigation/store', 'Admin\\NavigationController@store')->name('api/admin/navigation/store');
    Route::get('admin/navigation/edit', 'Admin\\NavigationController@edit')->name('api/admin/navigation/edit');
    Route::post('admin/navigation/save', 'Admin\\NavigationController@save')->name('api/admin/navigation/save');
    Route::post('admin/navigation/changeStatus', 'Admin\\NavigationController@changeStatus')->name('api/admin/navigation/changeStatus');

    Route::get('admin/category/index', 'Admin\\CategoryController@index')->name('api/admin/category/index');
    Route::get('admin/category/create', 'Admin\\CategoryController@create')->name('api/admin/category/create');
    Route::post('admin/category/store', 'Admin\\CategoryController@store')->name('api/admin/category/store');
    Route::get('admin/category/edit', 'Admin\\CategoryController@edit')->name('api/admin/category/edit');
    Route::post('admin/category/save', 'Admin\\CategoryController@save')->name('api/admin/category/save');
    Route::post('admin/category/changeStatus', 'Admin\\CategoryController@changeStatus')->name('api/admin/category/changeStatus');

    Route::get('admin/sms/index', 'Admin\\SmsController@index')->name('api/admin/sms/index');
    Route::post('admin/sms/changeStatus', 'Admin\\SmsController@destroy')->name('api/admin/sms/changeStatus');
    Route::post('admin/sms/send', 'Admin\\SmsController@send')->name('api/admin/sms/send');

    Route::get('admin/actionLog/index', 'Admin\\ActionLogController@index')->name('api/admin/actionLog/index');
    Route::post('admin/actionLog/changeStatus', 'Admin\\ActionLogController@changeStatus')->name('api/admin/actionLog/changeStatus');
    Route::get('admin/actionLog/export', 'Admin\\ActionLogController@export')->name('api/admin/actionLog/export');

    Route::any('admin/picture/index', 'Admin\\PictureController@index')->name('api/admin/picture/index');
    Route::post('admin/picture/upload', 'Admin\\PictureController@upload')->name('api/admin/picture/upload');
    Route::get('admin/picture/download', 'Admin\\PictureController@download')->name('api/admin/picture/download');
    Route::post('admin/picture/update', 'Admin\\PictureController@update')->name('api/admin/picture/update');
    Route::get('admin/picture/edit', 'Admin\\PictureController@edit')->name('api/admin/picture/edit');
    Route::post('admin/picture/save', 'Admin\\PictureController@save')->name('api/admin/picture/save');
    Route::post('admin/picture/changeStatus', 'Admin\\PictureController@changeStatus')->name('api/admin/picture/changeStatus');

    Route::any('admin/file/index', 'Admin\\FileController@index')->name('api/admin/file/index');
    Route::post('admin/file/upload', 'Admin\\FileController@upload')->name('api/admin/file/upload');
    Route::get('admin/file/download', 'Admin\\FileController@download')->name('api/admin/file/download');
    Route::post('admin/file/update', 'Admin\\FileController@update')->name('api/admin/file/update');
    Route::post('admin/file/changeStatus', 'Admin\\FileController@changeStatus')->name('api/admin/file/changeStatus');

    // 商城
    Route::get('admin/shop/index', 'Admin\\ShopController@index')->name('api/admin/shop/index');
    Route::get('admin/shop/create', 'Admin\\ShopController@create')->name('api/admin/shop/create');
    Route::post('admin/shop/store', 'Admin\\ShopController@store')->name('api/admin/shop/store');
    Route::get('admin/shop/edit', 'Admin\\ShopController@edit')->name('api/admin/shop/edit');
    Route::post('admin/shop/save', 'Admin\\ShopController@save')->name('api/admin/shop/save');
    Route::post('admin/shop/changeStatus', 'Admin\\ShopController@changeStatus')->name('api/admin/shop/changeStatus');

    Route::get('admin/shop/categoryIndex', 'Admin\\ShopController@categoryIndex')->name('api/admin/shop/categoryIndex');
    Route::get('admin/shop/categoryCreate', 'Admin\\ShopController@categoryCreate')->name('api/admin/shop/categoryCreate');
    Route::post('admin/shop/categoryStore', 'Admin\\ShopController@categoryStore')->name('api/admin/shop/categoryStore');
    Route::get('admin/shop/categoryEdit', 'Admin\\ShopController@categoryEdit')->name('api/admin/shop/categoryEdit');
    Route::post('admin/shop/categorySave', 'Admin\\ShopController@categorySave')->name('api/admin/shop/categorySave');
    Route::post('admin/shop/categoryChangeStatus', 'Admin\\ShopController@categoryChangeStatus')->name('api/admin/shop/categoryChangeStatus');

    Route::get('admin/goods/index', 'Admin\\GoodsController@index')->name('api/admin/goods/index');
    Route::get('admin/goods/create', 'Admin\\GoodsController@create')->name('api/admin/goods/create');
    Route::post('admin/goods/store', 'Admin\\GoodsController@store')->name('api/admin/goods/store');
    Route::get('admin/goods/edit', 'Admin\\GoodsController@edit')->name('api/admin/goods/edit');
    Route::post('admin/goods/save', 'Admin\\GoodsController@save')->name('api/admin/goods/save');
    
    Route::post('admin/goods/imageStore', 'Admin\\GoodsController@imageStore')->name('api/admin/goods/imageStore');
    Route::post('admin/goods/imageSave', 'Admin\\GoodsController@imageSave')->name('api/admin/goods/imageSave');
    Route::get('admin/goods/complete', 'Admin\\GoodsController@complete')->name('api/admin/goods/complete');

    Route::post('admin/goods/changeStatus', 'Admin\\GoodsController@changeStatus')->name('api/admin/goods/changeStatus');
    Route::get('admin/goods/attribute', 'Admin\\GoodsController@attribute')->name('api/admin/goods/attribute');

    Route::get('admin/goods/categoryIndex', 'Admin\\GoodsController@categoryIndex')->name('api/admin/goods/categoryIndex');
    Route::get('admin/goods/categoryCreate', 'Admin\\GoodsController@categoryCreate')->name('api/admin/goods/categoryCreate');
    Route::post('admin/goods/categoryStore', 'Admin\\GoodsController@categoryStore')->name('api/admin/goods/categoryStore');
    Route::get('admin/goods/categoryEdit', 'Admin\\GoodsController@categoryEdit')->name('api/admin/goods/categoryEdit');
    Route::post('admin/goods/categorySave', 'Admin\\GoodsController@categorySave')->name('api/admin/goods/categorySave');
    Route::post('admin/goods/categoryChangeStatus', 'Admin\\GoodsController@categoryChangeStatus')->name('api/admin/goods/categoryChangeStatus');

    Route::get('admin/goods/typeIndex', 'Admin\\GoodsController@typeIndex')->name('api/admin/goods/typeIndex');
    Route::get('admin/goods/typeCreate', 'Admin\\GoodsController@typeCreate')->name('api/admin/goods/typeCreate');
    Route::post('admin/goods/typeStore', 'Admin\\GoodsController@typeStore')->name('api/admin/goods/typeStore');
    Route::get('admin/goods/typeEdit', 'Admin\\GoodsController@typeEdit')->name('api/admin/goods/typeEdit');
    Route::post('admin/goods/typeSave', 'Admin\\GoodsController@typeSave')->name('api/admin/goods/typeSave');
    Route::post('admin/goods/typeChangeStatus', 'Admin\\GoodsController@typeChangeStatus')->name('api/admin/goods/typeChangeStatus');

    // 商品属性
    Route::get('admin/goods/attributeIndex', 'Admin\\GoodsController@attributeIndex')->name('api/admin/goods/attributeIndex');
    Route::get('admin/goods/attributeCreate', 'Admin\\GoodsController@attributeCreate')->name('api/admin/goods/attributeCreate');
    Route::post('admin/goods/attributeStore', 'Admin\\GoodsController@attributeStore')->name('api/admin/goods/attributeStore');
    Route::get('admin/goods/attributeEdit', 'Admin\\GoodsController@attributeEdit')->name('api/admin/goods/attributeEdit');
    Route::post('admin/goods/attributeSave', 'Admin\\GoodsController@attributeSave')->name('api/admin/goods/attributeSave');
    Route::post('admin/goods/attributeChangeStatus', 'Admin\\GoodsController@attributeChangeStatus')->name('api/admin/goods/attributeChangeStatus');

    // 商品规格
    Route::get('admin/goods/specificationIndex', 'Admin\\GoodsController@specificationIndex')->name('api/admin/goods/specificationIndex');
    Route::get('admin/goods/specificationCreate', 'Admin\\GoodsController@specificationCreate')->name('api/admin/goods/specificationCreate');
    Route::post('admin/goods/specificationStore', 'Admin\\GoodsController@specificationStore')->name('api/admin/goods/specificationStore');
    Route::get('admin/goods/specificationEdit', 'Admin\\GoodsController@specificationEdit')->name('api/admin/goods/specificationEdit');
    Route::post('admin/goods/specificationSave', 'Admin\\GoodsController@specificationSave')->name('api/admin/goods/specificationSave');
    Route::post('admin/goods/specificationChangeStatus', 'Admin\\GoodsController@specificationChangeStatus')->name('api/admin/goods/specificationChangeStatus');

    Route::get('admin/goods/unitIndex', 'Admin\\GoodsController@unitIndex')->name('api/admin/goods/unitIndex');
    Route::get('admin/goods/unitCreate', 'Admin\\GoodsController@unitCreate')->name('api/admin/goods/unitCreate');
    Route::post('admin/goods/unitStore', 'Admin\\GoodsController@unitStore')->name('api/admin/goods/unitStore');
    Route::get('admin/goods/unitEdit', 'Admin\\GoodsController@unitEdit')->name('api/admin/goods/unitEdit');
    Route::post('admin/goods/unitSave', 'Admin\\GoodsController@unitSave')->name('api/admin/goods/unitSave');
    Route::post('admin/goods/unitChangeStatus', 'Admin\\GoodsController@unitChangeStatus')->name('api/admin/goods/unitChangeStatus');

    Route::get('admin/goods/layoutIndex', 'Admin\\GoodsController@layoutIndex')->name('api/admin/goods/layoutIndex');
    Route::get('admin/goods/layoutCreate', 'Admin\\GoodsController@layoutCreate')->name('api/admin/goods/layoutCreate');
    Route::post('admin/goods/layoutStore', 'Admin\\GoodsController@layoutStore')->name('api/admin/goods/layoutStore');
    Route::get('admin/goods/layoutEdit', 'Admin\\GoodsController@layoutEdit')->name('api/admin/goods/layoutEdit');
    Route::post('admin/goods/layoutSave', 'Admin\\GoodsController@layoutSave')->name('api/admin/goods/layoutSave');
    Route::post('admin/goods/layoutChangeStatus', 'Admin\\GoodsController@layoutChangeStatus')->name('api/admin/goods/layoutChangeStatus');

    Route::get('admin/goodsBrand/index', 'Admin\\GoodsBrandController@index')->name('api/admin/goodsBrand/index');
    Route::get('admin/goodsBrand/create', 'Admin\\GoodsBrandController@create')->name('api/admin/goodsBrand/create');
    Route::post('admin/goodsBrand/store', 'Admin\\GoodsBrandController@store')->name('api/admin/goodsBrand/store');
    Route::get('admin/goodsBrand/edit', 'Admin\\GoodsBrandController@edit')->name('api/admin/goodsBrand/edit');
    Route::post('admin/goodsBrand/save', 'Admin\\GoodsBrandController@save')->name('api/admin/goodsBrand/save');
    Route::post('admin/goodsBrand/changeStatus', 'Admin\\GoodsBrandController@changeStatus')->name('api/admin/goodsBrand/changeStatus');

    Route::get('admin/goodsOrder/index', 'Admin\\GoodsOrderController@index')->name('api/admin/goodsOrder/index');
    Route::get('admin/goodsOrder/edit', 'Admin\\GoodsOrderController@edit')->name('api/admin/goodsOrder/edit');
    Route::post('admin/goodsOrder/save', 'Admin\\GoodsOrderController@save')->name('api/admin/goodsOrder/save');
    Route::post('admin/goodsOrder/changeStatus', 'Admin\\GoodsOrderController@changeStatus')->name('api/admin/goodsOrder/changeStatus');
    
    Route::get('admin/goodsOrder/commentIndex', 'Admin\\GoodsOrderController@commentIndex')->name('api/admin/goodsOrder/commentIndex');
    Route::get('admin/goodsOrder/commentEdit', 'Admin\\GoodsOrderController@commentEdit')->name('api/admin/goodsOrder/commentEdit');
    Route::post('admin/goodsOrder/commentSave', 'Admin\\GoodsOrderController@commentSave')->name('api/admin/goodsOrder/commentSave');
    Route::post('admin/goodsOrder/commentChangeStatus', 'Admin\\GoodsOrderController@commentChangeStatus')->name('api/admin/goodsOrder/commentChangeStatus');
    
    Route::get('admin/goodsOrder/afterSaleIndex', 'Admin\\GoodsOrderController@afterSaleIndex')->name('api/admin/goodsOrder/afterSaleIndex');
    Route::get('admin/goodsOrder/afterSaleEdit', 'Admin\\GoodsOrderController@afterSaleEdit')->name('api/admin/goodsOrder/afterSaleEdit');
    Route::post('admin/goodsOrder/afterSaleSave', 'Admin\\GoodsOrderController@afterSaleSave')->name('api/admin/goodsOrder/afterSaleSave');
    Route::post('admin/goodsOrder/afterSaleChangeStatus', 'Admin\\GoodsOrderController@afterSaleChangeStatus')->name('api/admin/goodsOrder/afterSaleChangeStatus');
    
});