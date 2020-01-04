<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PostCate;
use App\Models\Post;
use App\Models\PostRelationships;
use App\Services\Helper;
use DB;

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
            $page = Post::where('id', $id)
            ->where('status', 1)
            ->where('type', 'PAGE')
            ->first();
        } elseif(!empty($name)) {
            $page = Post::where('name', $name)
            ->where('status', 1)
            ->where('type', 'PAGE')
            ->first();
        } else {
            abort(404, 'Not Found');
        }

        if (empty($page)) {
            abort(404, 'Not Found');
        }

        // 浏览量自增
        Post::where('id', $id)->increment('view');

        $data['page'] = $page;

        return view($page->page_tpl,$data);
    }
}