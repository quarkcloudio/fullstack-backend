<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PostCate;
use App\Models\Post;
use App\Models\PostRelationships;
use App\Services\Helper;
use DB;

class SearchController extends Controller
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
                    $items = DB::table('posts')
                    ->where('posts.type', 'ARTICLE')
                    ->where('posts.status', 1)
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
            case 'page':
                    $items = DB::table('posts')
                    ->where('posts.type', 'PAGE')
                    ->where('posts.status', 1)
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
            default:
                    $items = DB::table('posts')
                    ->where('posts.type', 'ARTICLE')
                    ->where('posts.status', 1)
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
        }
        
        // 获取文章内图片
        foreach ($items as $key => $value) {
            $items[$key]->content_pictures = Helper::getContentPicture($value->content);
        }

        $data['items'] = $items;
        $data['query'] = $query;

        return view('search',$data);
    }

}