<?php

namespace App\Modules\Mobile\Http\Controllers;

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
     * 
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $query    = $request->input('query');
        $module   = $request->input('module');
        $user = DB::table('users')->where('id', 1)->first();
        $website = Helper::getKeyValue($user->uuid,'website.config');

        switch ($module) {
            case 'article':
                    $lists = DB::table('posts')
                    ->leftJoin("post_relationships",'posts.id','=','post_relationships.object_id')
                    ->where('posts.type', 'article')
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
            case 'page':
                    $lists = DB::table('posts')
                    ->leftJoin("post_relationships",'posts.id','=','post_relationships.object_id')
                    ->where('posts.type', 'page')
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
            default:
                    $lists = DB::table('posts')
                    ->leftJoin("post_relationships",'posts.id','=','post_relationships.object_id')
                    ->where('posts.type', 'article')
                    ->where('posts.title', 'like', '%'.mb_convert_encoding($query,'UTF-8','auto').'%')
                    ->orderBy('id', 'desc')
                    ->paginate(8);
                break;
        }

        return view('mobile::search',compact('website','lists','query'));
    }

}