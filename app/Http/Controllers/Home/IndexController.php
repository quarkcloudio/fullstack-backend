<?php

namespace App\Http\Controllers\PC;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PostCate;
use App\Models\Post;
use App\Models\PostRelationships;
use App\Services\Helper;
use DB;

class IndexController extends BaseController
{
    public function index()
    {
        return view('pc/index/index');
    }
}