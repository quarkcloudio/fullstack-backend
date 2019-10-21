<?php

namespace App\Http\Controllers\Mobile;

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
            $page = Post::where('id', $id)->where('type', 'PAGE')->first();
        } elseif(!empty($name)) {
            $page = Post::where('name', $name)->where('type', 'PAGE')->first();
        } else {
            abort(404, 'Not Found');
        }

        // 浏览量自增
        Post::where('id', $id)->increment('view');

        if (empty($page)) {
            abort(404, 'Not Found');
        }

        return view('mobile/'.$page->page_tpl,compact('page'));
    }
}