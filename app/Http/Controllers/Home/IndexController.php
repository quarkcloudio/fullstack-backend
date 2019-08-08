<?php

namespace App\Http\Controllers\PC;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use DB;

class IndexController extends Controller
{
    public function index(Request $request)
    {
        return view('pc/index/index');
    }
}