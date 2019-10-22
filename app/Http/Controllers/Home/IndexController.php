<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Post;
use App\Services\Helper;
use DB;

class IndexController extends Controller
{
    public function index(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');

        $category = [];

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
        }

        $archives = Post::where('status', 1)
        ->select(DB::raw("DATE_FORMAT(created_at,'%Y-%m') as created_date"))
        ->distinct()
        ->get();

        $query = Post::query();

        if(empty($category)) {
            $pageNum = 10;
        } else {
            $query->where('category_id', $category->id);
            $pageNum = $category->page_num;
        }

        
        $articles = $query->where('type', 'ARTICLE')
        ->where('status', 1)
        ->orderBy('level', 'desc')
        ->orderBy('id', 'desc')
        ->paginate($pageNum);

        // 获取文章内图片
        foreach ($articles as $key => $value) {
            $articles[$key]->content_pictures = Helper::getContentPicture($value->content);
        }

        $data['category'] = $category;
        $data['articles'] = $articles;

        return view('home/index',$data);
    }
}