<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use Illuminate\Support\Facades\Auth;
use App\Models\Admin;
use App\Models\Navigation;
use Validator;
use DB;

class NavigationController extends Controller
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
        $pageSize  = intval($request->get('pageSize',1000));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Navigation::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['query'])) {
                $query->where('title','like','%'.$search['query'].'%');
            }

        }

        // 查询数量
        $total = $query
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('sort', 'asc')
        ->orderBy('id', 'asc')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {
            $status = $list['status'];
            if($status == 1) {
                $lists[$key]['status'] = '正常';
            }

            if($status == 2) {
                $lists[$key]['status'] = '已禁用';
            }
        }

        $NavigationTrees     = Helper::listToTree($lists,'id','pid','children',0);
        $TreeLists = Helper::treeToOrderList($NavigationTrees,0,'title','children');
        // 模板数据
        $data['lists'] = $NavigationTrees;
        $data['TreeLists'] = $TreeLists;

        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $title         =   $request->json('title','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $url           =   $request->json('url','');
        $status        =   $request->json('status','');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['url'] = $url;
        $data['status'] = $status;

        $result = Navigation::create($data);

        if($result) {
            return $this->success('操作成功！');
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

        $data = Navigation::find($id)->toArray();

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
        $id            =   $request->json('id');
        $title         =   $request->json('title','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $url           =   $request->json('url');
        $status        =   $request->json('status','');

        if (empty($id)) {
            return $this->error('请选择数据！');
        }
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['url'] = $url;
        $data['status'] = $status;

        $result = Navigation::where('id',$id)->update($data);

        if ($result) {
            return $this->success('操作成功！');
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

        $result = Navigation::destroy($id);

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
        $query = Navigation::query();

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
        $query = Navigation::query();

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

}
