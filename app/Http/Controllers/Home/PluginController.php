<?php

namespace App\Http\Controllers\PC\Plugin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\PC\BaseController;
use Illuminate\Http\Request;
use App\Services\Helper;
use DB;

class PluginController extends BaseController
{
	/**
     * 搜索模块
     * @author tangtanglove
	 */
    public function form(Request $request)
    {
        $name    = $request->input('name');

        return view('pc/plugin/form/'.$name,compact('lists'));
    }

}