<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function index()
    {
        return $this->message('请求成功');
    }
}