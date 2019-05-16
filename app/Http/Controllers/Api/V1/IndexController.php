<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;

class IndexController extends BaseController
{
    public function index()
    {
        return $this->message('请求成功');
    }
}