<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\User;
use App\Models\Config;
use Illuminate\Support\Facades\Route;
use Session;


class WechatAuthMiddleware
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
        $user = Auth::user();
        
        if(empty($user)) {
            $targetUrl = url('wxLogin/login?targetUrl='.urlencode(url()->full()));
            return redirect($targetUrl);
        }

        return $next($request);
    }
}
