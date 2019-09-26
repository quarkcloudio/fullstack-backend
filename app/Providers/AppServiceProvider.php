<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Auth;
use EasyWeChat\Factory;
use App\Services\Helper;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // layout布局使用基于闭包的composers
        view()->composer('*', function ($view) {
            $user = Auth::user();

            $uid = '';
            $username = '';
            $nickname = '';

            if(!empty($user)) {
                $uid = $user->id;
                $username = $user->username;
                $nickname = $user->nickname;
            }

            $jsApi = '';

            if(Helper::isWechat()) {
                if(Helper::wechatConfig() != false) {
                    $app = Factory::officialAccount(Helper::wechatConfig());
                    $jsApi = $app->jssdk->buildConfig(array('onMenuShareTimeline','onMenuShareAppMessage'), $debug = false, $beta = false, $json = true);
                } 
            }

            $view->with('uid', $uid)
            ->with('username', $username)
            ->with('nickname', $nickname)
            ->with('jsApi', $jsApi);
        });

        // 将来升级到mysql5.7时，将下面注释掉
        Schema::defaultStringLength(191);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
