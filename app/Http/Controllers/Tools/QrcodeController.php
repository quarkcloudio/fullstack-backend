<?php

namespace App\Http\Controllers\Tools;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;

class QrcodeController extends Controller
{
    /**
     * 二维码
     * @param  integer
     * @return string
     */
    public function getQrcode(Request $request)
    {
        $text = $request->input('text');
        if(empty($text)) {
            return '参数错误！';
        }
        
        Helper::createQrCode($text);
    }
}
