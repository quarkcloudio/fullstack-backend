<?php

namespace App\Modules\Tools\Providers;

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
        $this->loadTranslationsFrom(module_path('tools', 'Resources/Lang', 'app'), 'tools');
        $this->loadViewsFrom(module_path('tools', 'Resources/Views', 'app'), 'tools');
        $this->loadMigrationsFrom(module_path('tools', 'Database/Migrations', 'app'));
        if(!$this->app->configurationIsCached()) {
            $this->loadConfigsFrom(module_path('tools', 'Config', 'app'));
        }
        $this->loadFactoriesFrom(module_path('tools', 'Database/Factories', 'app'));
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
