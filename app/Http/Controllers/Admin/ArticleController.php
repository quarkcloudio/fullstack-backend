<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Post;
use App\Models\Category;

class ArticleController extends Controller
{
    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function index(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Post::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('posts.title','like','%'.$search['title'].'%');
            }

            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('posts.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('posts.status',$search['status']);
                }
            }

            // 作者
            if(isset($search['author'])) {
                if(!empty($search['author'])) {
                    $query->where('posts.author',$search['author']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('posts.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('posts.status', '>', 0)
        ->where('posts.type', 'ARTICLE')
        ->count();

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if(empty($value['name'])) {
                $lists[$key]['name'] = '暂无';
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $categorys         = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
        $data['categorys'] = $categoryTreeLists;
        $data['lists'] = Helper::listsFormat($lists);
        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {
        $categorys         = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
        $data['categorys'] = $categoryTreeLists;

        return $this->success('获取成功！','',$data);
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $title          =   $request->json('title','');
        $description    =   $request->json('description','');
        $categoryId     =   $request->json('category_id',0);
        $tags           =   $request->json('tags','');
        $commentStatus  =   $request->json('comment_status');
        $content        =   $request->json('content','');
        $createdAt      =   $request->json('created_at');
        $name           =   $request->json('name','');
        $author         =   $request->json('author','');
        $level          =   $request->json('level',0);
        $comment        =   $request->json('comment',0);
        $view           =   $request->json('view',0);
        $password       =   $request->json('password',0);
        $position       =   $request->json('position',0);
        $showType       =   $request->json('show_type');
        $coverIds       =   $request->json('cover_ids',0);
        $fileId         =   $request->json('file_id',0);
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if ($commentStatus == true) {
            $commentStatus = 'open';
        } else {
            $commentStatus = 'close'; //禁用
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['description'] = $description;
        $data['adminid'] = ADMINID;
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['comment_status'] = $commentStatus;
        $data['content'] = $content;
        $data['created_at'] = $createdAt;
        $data['name'] = $name;
        $data['author'] = $author;
        $data['level'] = $level;
        $data['comment'] = $comment;
        $data['view'] = $view;
        $data['password'] = $password;
        $data['show_type'] = $showType;
        $data['position'] = collect($position)->sum();
        $data['cover_ids'] = $coverIds;
        $data['file_id'] = $fileId;
        $data['status'] = $status;
        $data['type'] = 'ARTICLE';

        $result = Post::create($data);

        if($result) {
            return $this->success('操作成功！','/article/index');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function edit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $data = Post::find($id)->toArray();

        $coverIds = json_decode($data['cover_ids'],true);
        if($coverIds) {
            foreach ($coverIds as $key => $value) {
                // 获取封面图列表
                $data['cover_list'][$key]['uid'] = $value;
                $data['cover_list'][$key]['name'] = Helper::getPicture($value,0,'name');
                $data['cover_list'][$key]['url'] = Helper::getPicture($value);
                $data['cover_list'][$key]['status'] = 'done';
            }
        } else {
            $data['cover_list'] = [];
        }

        // 获取文件
        $data['file_path'] = Helper::getFile($data['file_id']);
        $data['file_name'] = Helper::getFile($data['file_id'],'name');

        $position = [];

        if(in_array($data['position'], [1,3,5,7,9,15])) {
            $position[] = 1;
        }

        if(in_array($data['position'], [2,3,6,7,9,10,14,15])) {
            $position[] = 2;
        }

        if(in_array($data['position'], [4,5,6,7,12,13,14,15])) {
            $position[] = 4;
        }

        if(in_array($data['position'], [8,9,10,11,12,13,14,15])) {
            $position[] = 8;
        }

        $data['position'] = $position;

        $categorys = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 所有分类
        $data['categorys'] = $categoryTreeLists;

        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function save(Request $request)
    {
        $id             =   $request->json('id');
        $title          =   $request->json('title','');
        $description    =   $request->json('description','');
        $categoryId     =   $request->json('category_id',0);
        $tags           =   $request->json('tags','');
        $commentStatus  =   $request->json('comment_status');
        $content        =   $request->json('content','');
        $createdAt      =   $request->json('created_at');
        $name           =   $request->json('name','');
        $author         =   $request->json('author','');
        $level          =   $request->json('level',0);
        $comment        =   $request->json('comment',0);
        $view           =   $request->json('view',0);
        $password       =   $request->json('password',0);
        $position       =   $request->json('position',0);
        $showType       =   $request->json('show_type');
        $coverIds       =   $request->json('cover_ids',0);
        $fileId         =   $request->json('file_id',0);
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if ($commentStatus == true) {
            $commentStatus = 'open';
        } else {
            $commentStatus = 'close';
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['description'] = $description;
        $data['adminid'] = ADMINID;
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['comment_status'] = $commentStatus;
        $data['content'] = $content;
        $data['created_at'] = $createdAt;
        $data['name'] = $name;
        $data['author'] = $author;
        $data['level'] = $level;
        $data['comment'] = $comment;
        $data['view'] = $view;
        $data['password'] = $password;
        $data['show_type'] = $showType;
        $data['position'] = collect($position)->sum();
        $data['cover_ids'] = $coverIds;
        $data['file_id'] = $fileId;
        $data['status'] = $status;
        $data['type'] = 'ARTICLE';

        $result = Post::where('id',$id)->update($data);
        if ($result) {
            return $this->success('操作成功！','index');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 删除单个数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function destroy(Request $request)
    {
        $id = $request->json('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $result = Post::destroy($id);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = Post::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 导出数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function export(Request $request)
    {
        // 获取参数
        $search = $request->get('search');
            
        // 定义对象
        $query = Post::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('posts.title','like','%'.$search['title'].'%');
            }

            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('posts.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('posts.status',$search['status']);
                }
            }

            // 作者
            if(isset($search['author'])) {
                if(!empty($search['author'])) {
                    $query->where('posts.author',$search['author']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('posts.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        $fileName = 'data';

        $title = ['ID','标题'];

        Helper::export($fileName,$title,$lists);
    }

    /**
     * 我发布的文章列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function myPublished(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Post::query();

        if(ADMINID) {
            $query->where('posts.adminid',ADMINID);
        }

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('posts.title','like','%'.$search['title'].'%');
            }

            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('posts.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('posts.status',$search['status']);
                }
            }

            // 作者
            if(isset($search['author'])) {
                if(!empty($search['author'])) {
                    $query->where('posts.author',$search['author']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('posts.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('posts.status', '>', 0)
        ->where('posts.type', 'ARTICLE')
        ->count();

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if(empty($value['name'])) {
                $lists[$key]['name'] = '暂无';
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $categorys         = Category::where('type','ARTICLE')->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
        $data['categorys'] = $categoryTreeLists;
        $data['lists'] = Helper::listsFormat($lists);
        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }
    }
}
