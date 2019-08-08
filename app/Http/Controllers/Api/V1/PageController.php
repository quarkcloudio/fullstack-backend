<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Post;
use App\Services\Helper;

class PageController extends Controller
{
	/**
     * 单页
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');

        if (!empty($id)) {
            $page = Post::where('id', $id)->where('type', 'PAGE')->first();
        } elseif(!empty($name)) {
            $page = Post::where('name', $name)->where('type', 'PAGE')->first();
        } else {
            return Helper::error('参数错误！');
        }

        // 浏览量自增
        Post::where('id', $id)->increment('view');

        return $this->success($page);
    }

}