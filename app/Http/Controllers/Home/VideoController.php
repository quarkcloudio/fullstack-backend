<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Video;
use App\Services\Helper;
use DB;

class VideoController extends Controller
{
	/**
     * 视频主题页
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
        }

        if(empty($category)) {
            abort(404, 'Not Found');
        }

        $videos = Video::where('category_id', $category->id)
        ->orderBy('level', 'desc')
        ->orderBy('id', 'desc')
        ->paginate($category->page_num);

        // 获取文章内图片
        foreach ($videos as $key => $value) {
            $videos[$key]->content_pictures = Helper::getContentPicture($value->content);
        }

        return view('home/'.$category->index_tpl,compact('videos','category'));
    }

	/**
     * 视频列表页
     * @author tangtanglove
	 */
    public function list(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
        }

        if(empty($category)) {
            abort(404, 'Not Found');
        }

        $videos = Video::where('category_id', $category->id)
        ->where('status', 1)
        ->orderBy('id', 'desc')
        ->orderBy('level', 'desc')
        ->paginate($category->page_num);

        // 获取视频内图片
        foreach ($videos as $key => $value) {
            $videos[$key]->content_pictures = Helper::getContentPicture($value->content);
        }

        $data['videos'] = $videos;
        $data['category'] = $category;
        
        return view('home/'.$category->lists_tpl,$data);
    }

	/**
     * 视频详情页
     * @author tangtanglove
	 */
    public function detail(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');

        if (!empty($id)) {
            $article = Video::where('id', $id)->where('status', 1)->first();
        } elseif(!empty($name)) {
            $article = Video::where('name', $name)->where('status', 1)->first();
        } else {
            abort(404, 'Not Found');
        }

        $category = Category::where('id', $article->category_id)->first();

        // 浏览量自增
        Video::where('id', $id)->increment('view',3);

        if (empty($article)) {
            abort(404, 'Not Found');
        }

        // 上一个
        $prev = Video::where('id','<', $id)->where('category_id',$article->category_id)->limit(1)->where('status', 1)->first();
        // 下一个
        $next = Video::where('id','>', $id)->where('category_id',$article->category_id)->limit(1)->where('status', 1)->first();

        $tags = explode(',',$article->tags);

        $ids = [];
        foreach ($tags as $key => $value) {
            // 相似文章ids
            $getIds = Video::where('status',1)
            ->where('tags','like','%'.$value.'%')
            ->take(10)
            ->orderBy('id', 'desc')
            ->select('id')
            ->get()
            ->toArray();

            foreach ($getIds as $key1 => $value1) {
                $ids[] = $value1;
            }
        }

        if(!empty($ids)) {
            // 相似文章
            $similarvideos = Video::where('status',1)
            ->whereIn('id',$ids)
            ->take(4)
            ->orderBy('id', 'desc')
            ->get()
            ->toArray();
        }

        return view('home/'.$category['detail_tpl'],compact('article','category','prev','next'));
    }
}