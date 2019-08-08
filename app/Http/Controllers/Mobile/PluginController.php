<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use DB;

class PluginController extends Controller
{
	/**
     * 
     * @author tangtanglove
	 */
    public function form(Request $request)
    {
        $name    = $request->input('name');

        return view('mobile/plugin/form/'.$name,compact('lists'));
    }

}