<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Admin;
use Illuminate\Support\Facades\Route;

class AdminMiddleware
{
    public function handle($request, Closure $next, $guard = '')
    {
        // get方式获取token
        $token = $request->get('token');

        // 得到认证凭据
        $authorization = $request->header('Authorization');

        if(empty($token)) {
            if(empty($authorization)) {
                return response('Unauthorized.', 401);
            }
            $authorizations = explode(' ',$authorization);
            $token = $authorizations[1];
        }

        if (empty($token)) {
            return response('Unauthorized.', 401);
        }

        // 根据token获取登录用户信息
        $admin = cache($token);

        // 获取不到则重新登录
        if (empty($admin)) {
            return response('Unauthorized.', 401);
        }

        define('ADMINID',$admin['id']);

        if($admin['id'] !== 1) {

            $getPermissions = Admin::where('id',$admin['id'])->first()->getPermissionsViaRoles();
            $hasPermission = false;
            foreach ($getPermissions as $key => $value) {
                if ($value->name == Route::currentRouteName()) {
                    $hasPermission = true;
                }
            }

            if(!$hasPermission) {
                return response('无权限！', 401);
            }
        }

        return $next($request);
    }
}