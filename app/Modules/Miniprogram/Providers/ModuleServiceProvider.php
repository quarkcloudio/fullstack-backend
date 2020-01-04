<?php

namespace App\Modules\Miniprogram\Providers;

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
        $this->loadTranslationsFrom(module_path('miniprogram', 'Resources/Lang', 'app'), 'miniprogram');
        $this->loadViewsFrom(module_path('miniprogram', 'Resources/Views', 'app'), 'miniprogram');
        $this->loadMigrationsFrom(module_path('miniprogram', 'Database/Migrations', 'app'));
        if(!$this->app->configurationIsCached()) {
            $this->loadConfigsFrom(module_path('miniprogram', 'Config', 'app'));
        }
        $this->loadFactoriesFrom(module_path('miniprogram', 'Database/Factories', 'app'));
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
