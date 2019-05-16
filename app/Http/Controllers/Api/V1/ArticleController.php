<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Post;
use App\Models\Comment;
use App\Services\Helper;
use App\User;

class ArticleController extends BaseController
{
	/**
     * 文章主题页
     * @author tangtanglove
	 */
    public function index(Request $request)
    {
        $id         = $request->input('id');
        $name       = $request->input('name');
        $page       = $request->input('page');
        $limit      = $request->input('limit');
        $search     = $request->input('search');
        $position   = $request->input('position'); // 1,2,4,8
        $date       = $request->input('date'); // 指定日期的文章

        // 定义对象
        $query = Post::query()->where('type', 'ARTICLE');
        $category = '';

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
            if(empty($category)) {
                return $this->error('无此分类');
            }
            $query->where('category_id', $category->id);
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
            if(empty($category)) {
                return $this->error('无此分类');
            }
            $query->where('category_id', $category->id);
        }

        // 查询
        if(!empty($search)) {
            $query->where('title','like','%'.$search.'%');
        }

        // 推荐位
        if(!empty($position)) {
            switch ($position) {
                case '1': // 首页推荐
                    $query->whereIn('position',[1,3,5,7,9,15]);
                    break;
                case '2': // 频道推荐
                    $query->whereIn('position',[2,3,6,7,9,10,14,15]);
                    break;
                case '4': // 列表推荐
                    $query->whereIn('position',[4,5,6,7,12,13,14,15]);
                    break;
                case '8': // 详情推荐
                    $query->whereIn('position',[8,9,10,11,12,13,14,15]);
                    break;
                default: // 默认首页推荐
                    $query->whereIn('position',[1,3,5,7,9,15]);
                    break;
            }
        } else {
            $getIds = Post::where('type', 'ARTICLE')
            ->where('status',1)
            ->whereIn('position',[2,3,6,7,9,10,14,15])
            ->skip(0)
            ->take(4)
            ->orderBy('id', 'desc')
            ->select('id')
            ->get()
            ->toArray();

            foreach ($getIds as $key => $value) {
                $ids[] = $value['id'];
            }

            $getIds1 = Post::where('type', 'ARTICLE')
            ->where('status',1)
            ->whereIn('position',[1,3,5,7,9,15])
            ->skip(0)
            ->take(1)
            ->orderBy('id', 'desc')
            ->select('id')
            ->get()
            ->toArray();

            foreach ($getIds1 as $key1 => $value1) {
                $ids[] = $value1['id'];
            }

            $query->whereNotIn('id',$ids);
        }

        // 指定日期
        if(!empty($date)) {
            $query->whereBetween('created_at', [date($date.' 00:00:00'), date($date.' 23:59:59')])
            ->orderBy('position', 'desc')
            ->groupBy('category_id');
        }

        $count= $query->where('status',1)
        ->where('type', 'ARTICLE')
        ->count();

        $articles = $query->where('type', 'ARTICLE')
        ->where('status',1)
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        $data['articles'] = Helper::mobileAdaptor($articles);
        $data['category'] = $category;

        return $this->success('获取成功！','',$data,$count);
    }

	/**
     * 文章列表页
     * @author tangtanglove
	 */
    public function lists(Request $request)
    {
        $id         = $request->input('id');
        $name       = $request->input('name');
        $page       = $request->input('page');
        $limit      = $request->input('limit');
        $search     = $request->input('search');
        $position   = $request->input('position'); // 1,2,4,8
        $date       = $request->input('date'); // 指定日期的文章

        // 定义对象
        $query = Post::query()->where('type', 'ARTICLE');
        $category = '';

        if (!empty($id)) {
            $category = Category::where('id', $id)->first();
            if(empty($category)) {
                return $this->error('无此分类');
            }
            $query->where('category_id', $category->id);
        } elseif(!empty($name)) {
            $category = Category::where('name', $name)->first();
            if(empty($category)) {
                return $this->error('无此分类');
            }
            $query->where('category_id', $category->id);
        }

        // 查询
        if(!empty($search)) {
            $search = urldecode($search);
            $query->where('title','like','%'.$search.'%');
        }

        // 推荐位
        if(!empty($position)) {
            switch ($position) {
                case '1': // 首页推荐
                    $query->whereIn('position',[1,3,5,7,9,15]);
                    break;
                case '2': // 频道推荐
                    $query->whereIn('position',[2,3,6,7,9,10,14,15]);
                    break;
                case '4': // 列表推荐
                    $query->whereIn('position',[4,5,6,7,12,13,14,15]);
                    break;
                case '8': // 详情推荐
                    $query->whereIn('position',[8,9,10,11,12,13,14,15]);
                    break;
                default: // 默认首页推荐
                    $query->whereIn('position',[1,3,5,7,9,15]);
                    break;
            }
        } else {
            $getIds = Post::where('type', 'ARTICLE')
            ->where('category_id', $category->id)
            ->where('status',1)
            ->whereIn('position',[2,3,6,7,9,10,14,15])
            ->skip(0)
            ->take(4)
            ->orderBy('id', 'desc')
            ->select('id')
            ->get()
            ->toArray();

            $ids = [];

            foreach ($getIds as $key => $value) {
                $ids[] = $value['id'];
            }

            $getIds1 = Post::where('type', 'ARTICLE')
            ->where('category_id', $category->id)
            ->where('status',1)
            ->whereIn('position',[1,3,5,7,9,15])
            ->skip(0)
            ->take(1)
            ->orderBy('id', 'desc')
            ->select('id')
            ->get()
            ->toArray();

            foreach ($getIds1 as $key1 => $value1) {
                $ids[] = $value1['id'];
            }

            $query->whereNotIn('id',$ids);
        }

        // 指定日期
        if(!empty($date)) {
            $query->whereBetween('created_at', [date($date.' 00:00:00'), date($date.' 23:59:59')])
            ->orderBy('position', 'desc')
            ->orderBy('category_id', 'desc');
        }

        $count= $query->where('status',1)
        ->where('type', 'ARTICLE')
        ->count();

        $articles = $query->where('type', 'ARTICLE')
        ->where('status',1)
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($articles as $key => $article) {
            $articles[$key]['created_at'] = date("Y-m-d",strtotime($article['created_at']));
        }

        $data['articles'] = Helper::mobileAdaptor($articles);
        $data['category'] = $category;

        return $this->success('获取成功！','',$data,$count);
    }

	/**
     * 文章详情页
     * @author tangtanglove
	 */
    public function detail(Request $request)
    {
        $id      = $request->input('id');
        $name    = $request->input('name');

        if (!empty($id)) {
            $article = Post::where('id', $id)
            ->where('status',1)
            ->first();
        } elseif(!empty($name)) {
            $article = Post::where('name', $name)
            ->where('status',1)
            ->first();
        } else {
            return $this->error('参数错误');
        }

        // 文章分类
        $category = Category::where('id', $article->category_id)->first();

        // 相关推荐
        $similarArticles = Post::where('category_id', $article->category_id)
        ->whereIn('position',[8,9,10,11,12,13,14,15])
        ->where('status',1)
        ->take(4)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        // 浏览量自增
        Post::where('id', $id)->increment('view',6);

        $data['article'] = Helper::mobileAdaptor($article);
        $data['category'] = $category;
        $data['similar_articles'] = Helper::mobileAdaptor($similarArticles);

        return $this->success('获取成功！','',$data);
    }

	/**
     * 文章评论
     * @author tangtanglove
	 */
    public function comments(Request $request)
    {
        $objectId   = $request->input('objectId');
        $type       = $request->input('type','ARTICLE');
        $page       = $request->input('page',1);
        $limit      = $request->input('limit',10);

        if (empty($objectId) || empty($type)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $comments = Comment::where('type', $type)
        ->where('status',1)
        ->where('pid',0)
        ->where('object_id',$objectId)
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($comments as $key => $comment) {

            // 获取评论用户昵称
            $user = User::where('id',$comment['uid'])->first();
            if($user) {
                $comments[$key]['nickname'] = $user->nickname;
                $comments[$key]['cover_id'] = $user->cover_id;
            } else {
                $comments[$key]['nickname'] = '该用户已被禁用';
            }

            // 官方回复
            $replys = Comment::where('type', $type)
            ->where('status',1)
            ->where('pid',$comment['id'])
            ->get();
            $comments[$key]['replys'] = $replys;

            // 时间格式化
            $comments[$key]['created_at'] = date("Y/m/d H:i:s",strtotime($comment['created_at']));
        }

        $data = Helper::mobileAdaptor($comments);

        $count = Comment::where('type', $type)
        ->where('status',1)
        ->where('object_id',$objectId)
        ->count();

        return $this->success('获取成功！','',$data,$count);
    }
}