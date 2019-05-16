<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\Helper;
use App\Models\Post;
use App\Models\Category;

class CategoryController extends Controller
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
        $search     = $request->get('search');
            
        // 定义对象
        $query = Category::query();

        // 查询
        if(!empty($search)) {

            // 标题
            if(isset($search['title'])) {
                if(!empty($search['title'])) {
                    $query->where('title',$search['title']);
                }
            }

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('name',$search['name']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }
            
            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('categories.*')
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
            $statue = $list['status'];
            if($statue == 1) {
                $lists[$key]['status'] = '正常';
            }
            if($statue == 2) {
                $lists[$key]['status'] = '已禁用';
            }
        }
        
        // 模板数据
        $data['lists'] = $lists;

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
        $categorys         = Category::all()->toArray();
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
        $id             =   $request->json('id');
        $title          =   $request->json('title','');
        $name           =   $request->json('name');
        $type           =   $request->json('type');
        $description    =   $request->json('description');
        $sort           =   $request->json('sort');
        $pid            =   $request->json('pid');
        $coverIds       =   $request->json('cover_ids',0);
        $indexTpl       =   $request->json('indexTpl');
        $listsTpl       =   $request->json('listsTpl');
        $detailTpl      =   $request->json('detailTpl');
        $pageNum        =   $request->json('pageNum');
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }
        if (empty($type)) {
            return $this->error('分类类型必须填写！');
        }
        if (empty($pageNum)) {
            return $this->error('分页数量必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title']          = $title;
        $data['name']           = $name;
        $data['type']           = $type;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['pid']            = $pid;
        $data['cover_id']       = $coverIds;
        $data['index_tpl']      = $indexTpl;
        $data['lists_tpl']      = $listsTpl;
        $data['detail_tpl']     = $detailTpl;
        $data['page_num']       = $pageNum;
        $data['status']         = $status;

        $result = Category::create($data);

        if($result) {
            return $this->success('操作成功！','index');
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

        $data = Category::find($id)->toArray();

        $data['cover_path'] = Helper::getPicture($data['cover_id']);

        $categorys         = Category::all()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
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
        $name           =   $request->json('name');
        $type           =   $request->json('type');
        $description    =   $request->json('description');
        $sort           =   $request->json('sort');
        $coverIds       =   $request->json('cover_ids',0);
        $indexTpl       =   $request->json('indexTpl');
        $listsTpl       =   $request->json('listsTpl');
        $detailTpl      =   $request->json('detailTpl');
        $pageNum        =   $request->json('pageNum');
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }
        if (empty($type)) {
            return $this->error('分类类型必须填写！');
        }
        if (empty($pageNum)) {
            return $this->error('分页数量必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title']          = $title;
        $data['name']           = $name;
        $data['type']           = $type;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['cover_id']       = $coverIds;
        $data['index_tpl']      = $indexTpl;
        $data['lists_tpl']      = $listsTpl;
        $data['detail_tpl']     = $detailTpl;
        $data['page_num']       = $pageNum;
        $data['status']         = $status;

        $result = Category::where('id',$id)->update($data);
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

        $result = Category::destroy($id);

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
        $query = Category::query();

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

}
