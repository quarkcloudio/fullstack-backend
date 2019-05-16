<?php

namespace App\Http\Controllers\Wechat;

use App\Http\Controllers\Controller;
use App\Services\Helper;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use DB;

class CommonController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth.wechat:wechat');
    }
}