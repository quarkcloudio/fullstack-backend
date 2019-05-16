<?php

namespace App\Http\Controllers\PC\Plugin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\PC\BaseController;
use Illuminate\Http\Request;
use App\Models\PostCate;
use App\Models\Post;
use App\Models\PostRelationships;
use App\Services\Helper;
use DB;

class SearchController extends BaseController
{
	/**
     * 搜索模块
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $query    = $request->input('query');
        $module   = $request->input('module');

        switch ($module) {
            case 'article':
                    $lists = DB::table('posts')
                    ->where('posts.type', 'ARTICLE')
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
            case 'page':
                    $lists = DB::table('posts')
                    ->where('posts.type', 'PAGE')
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
            default:
                    $lists = DB::table('posts')
                    ->where('posts.type', 'ARTICLE')
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
        }
        // 获取文章内图片
        foreach ($lists as $key => $value) {
            $lists[$key]->content_pictures = Helper::getContentPicture($value->content);
        }
        return view('pc/plugin/search/index',compact('lists','query'));
    }

}