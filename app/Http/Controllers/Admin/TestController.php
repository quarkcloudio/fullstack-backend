<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\Planet\Model\Form;
use App\Planet\Model\Table;
use App\Models\Post;
use App\Models\Category;

class TestController extends Controller
{
    /**
     * test
     * 
     * @param  Request  $request
     * @return Response
     */
    public function index(Request $request)
    {
        $result = Helper::htmlToImage('https://m.qarc.cn',750,null,'','D:\\Software\\phantomjs\\bin\\phantomjs');
        echo($result);
    }
}
