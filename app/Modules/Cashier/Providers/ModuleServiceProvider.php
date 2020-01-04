<?php

namespace App\Modules\Cashier\Providers;

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
        $this->loadTranslationsFrom(module_path('cashier', 'Resources/Lang', 'app'), 'cashier');
        $this->loadViewsFrom(module_path('cashier', 'Resources/Views', 'app'), 'cashier');
        $this->loadMigrationsFrom(module_path('cashier', 'Database/Migrations', 'app'));
        if(!$this->app->configurationIsCached()) {
            $this->loadConfigsFrom(module_path('cashier', 'Config', 'app'));
        }
        $this->loadFactoriesFrom(module_path('cashier', 'Database/Factories', 'app'));
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
