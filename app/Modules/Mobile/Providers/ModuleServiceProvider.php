<?php

namespace App\Modules\Mobile\Providers;

use Caffeinated\Modules\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade;
use Illuminate\Http\Request;
use App\Services\Helper;
use Db;

class ModuleServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the module services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadTranslationsFrom(module_path('mobile', 'Resources/Lang', 'app'), 'mobile');
        $this->loadViewsFrom(module_path('mobile', 'Resources/Views', 'app'), 'mobile');
        $this->loadMigrationsFrom(module_path('mobile', 'Database/Migrations', 'app'));
        if(!$this->app->configurationIsCached()) {
            $this->loadConfigsFrom(module_path('mobile', 'Config', 'app'));
        }
        $this->loadFactoriesFrom(module_path('mobile', 'Database/Factories', 'app'));
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
