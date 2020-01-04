<?php

namespace App\Modules\Api\Providers;

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
        $this->loadTranslationsFrom(module_path('api', 'Resources/Lang', 'app'), 'api');
        $this->loadViewsFrom(module_path('api', 'Resources/Views', 'app'), 'api');
        $this->loadMigrationsFrom(module_path('api', 'Database/Migrations', 'app'));
        if(!$this->app->configurationIsCached()) {
            $this->loadConfigsFrom(module_path('api', 'Config', 'app'));
        }
        $this->loadFactoriesFrom(module_path('api', 'Database/Factories', 'app'));
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
