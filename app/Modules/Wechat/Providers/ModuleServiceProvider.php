<?php

namespace App\Modules\Wechat\Providers;

use Caffeinated\Modules\Support\ServiceProvider;

class ModuleServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the module services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadTranslationsFrom(module_path('wechat', 'Resources/Lang', 'app'), 'wechat');
        $this->loadViewsFrom(module_path('wechat', 'Resources/Views', 'app'), 'wechat');
        $this->loadMigrationsFrom(module_path('wechat', 'Database/Migrations', 'app'));
        if(!$this->app->configurationIsCached()) {
            $this->loadConfigsFrom(module_path('wechat', 'Config', 'app'));
        }
        $this->loadFactoriesFrom(module_path('wechat', 'Database/Factories', 'app'));
    }

    /**
     * Register the module services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->register(RouteServiceProvider::class);
    }
}
