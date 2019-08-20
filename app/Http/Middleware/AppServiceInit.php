<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Admin;
use App\Models\Config;
use Illuminate\Support\Facades\Route;
use App\Services\Helper;

class AppServiceInit
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next,$guard = null)
    {
        if(!cache('WEB_SITE_NAME')) {
            $configs = Config::all();
            foreach ($configs as $key => $value) {
                cache([$value['name'] => $value['value']],3600);
            }
        }

        // 定义全局常量
        $user = Auth::user();

        if(!empty($user)) {
            define('UID',$user->id);
            define('USERNAME',$user->username);
            define('NICKNAME',$user->nickname);
        } else {
            define('UID','');
            define('USERNAME','');
            define('NICKNAME','');
        }

        if(!(strpos(Route::currentRouteName(),'api/admin') !== false)) {
            if(Helper::config('WEB_SITE_OPEN') != 1) {
                echo '网站关闭！';
                die();
            }
        }

        return $next($request);
    }
}
