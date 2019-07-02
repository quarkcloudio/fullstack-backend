<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use App\Builder\Fields\Text;
use App\Models\Post;
use App\Models\Category;

class DemoController extends Controller
{
    /**
     * 创建器-表单演示
     * 
     * @param  Request  $request
     * @return Response
     */
    public function builderForm(Request $request)
    {
        return [
            Text::make('姓名','username')->value('love'),
            Text::make('密码','password'),
        ];
    }
}
