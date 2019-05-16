<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use DB;

class PluginController extends CommonController
{
	/**
     * 搜索模块
     * @author tangtanglove
	 */
    public function form(Request $request)
    {
        $name    = $request->input('name');

        return view('wechat/plugin/form/'.$name,compact('lists'));
    }

}