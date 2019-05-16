<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Config;
use App\Services\Helper;
use DB;
use Cache;

class ConfigController extends Controller
{
    /**
     * 网站设置
     *
     * @param  Request  $request
     * @return Response
     */
     public function website(Request $request)
     {
        // 获取参数
        $getGroupName = $request->input('groupName','基本');
        
        $groupNames = Config::query()
        ->where('status', 1)
        ->orderBy('id', 'asc')
        ->select(['group_name'])
        ->distinct()
        ->get();

        // 查询列表
        $configs = Config::query()
        ->where('status', 1)
        ->where('group_name', $getGroupName)
        ->orderBy('id', 'asc')
        ->get()
        ->toArray();

        foreach ($configs as $key => $value) {
            if($value['type'] == 'picture') {
                $name = $value['name'];
                $data[$name.'_cover_path'] = Helper::getPicture($value['value']);
                $data[$name.'_cover_id'] = $value['value'];
            }
            if($value['type'] == 'file') {
                $name = $value['name'];
                $data[$name.'_file_path'] = Helper::getFile($value['value']);
                $data[$name.'_file_name'] = Helper::getFile($value['value'],'name');
                $data[$name.'_file_id'] = $value['value'];
            }
        }
        
        $data['groupNames'] = $groupNames;
        $data['configs'] = $configs;

        return $this->success('获取成功！','',$data);
    }
     /**
    * 保存站点配置数据
    *
    * @param  Request  $request
    * @return Response
    */
    public function saveWebsite(Request $request)
    {
        $values = $request->json('values'); 
        $result = true;
        // 遍历插入数据
        foreach ($values as $key => $value) {
            // 修改时清空缓存
            Cache::pull($key);
            $getResult = Config::where('name',$key)->update(['value'=>$value]);
            if($getResult === false) {
                $result = false;
            }
        }

        if ($result) {
            return $this->success('操作成功！','');
        } else {
            return $this->error('操作失败！');
        }
    }
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
        $query = Config::query();

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

            // 备注
            if(isset($search['remark'])) {
                if(!empty($search['remark'])) {
                    $query->where('remark',$search['remark']);
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
        ->select('configs.*')
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
     * 创建页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function create()
    {
        return $this->success('获取成功！','');
    }

    /**
     * 保存创建数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $title          =   $request->json('title');
        $type           =   $request->json('type');
        $name           =   $request->json('name');
        $groupName      =   $request->json('groupName');
        $value          =   $request->json('value');
        $remark         =   $request->json('remark');
        $status         =   $request->json('status');
       
        if (empty($name)) {
            return $this->error('配置名不能为空！');
        }

        $hasName = Config::where('name',$name)->first();

        if (!empty($hasName)) {
            return $this->error('配置名已经存在！');
        }
        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['type'] = $type;
        $data['name'] = $name;
        $data['group_name'] = $groupName;
        $data['value'] = $value;
        $data['remark'] = $remark;
        $data['status'] = $status;

        $result = Config::create($data);
        if ($result) {
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

        $data = Config::find($id)->toArray();
        
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
        $title          =   $request->json('title');
        $type           =   $request->json('type');
        $name           =   $request->json('name');
        $groupName      =   $request->json('groupName');
        $value          =   $request->json('value');
        $remark         =   $request->json('remark');
        $status         =   $request->json('status');
       
        if (empty($name)) {
            return $this->error('配置名不能为空！');
        }

        $hasName = Config::where('name',$name)->where('id','<>',$id)->first();

        if (!empty($hasName)) {
            return $this->error('配置名已经存在！');
        }
        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['type'] = $type;
        $data['name'] = $name;
        $data['group_name'] = $groupName;
        $data['value'] = $value;
        $data['remark'] = $remark;
        $data['status'] = $status;

        $result = Config::where('id',$id)->update($data);
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

        $result = Config::destroy($id);

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
        $query = Config::query();

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
     * 改变多个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeMultiStatus(Request $request)
    {
        $data = $request->input('data');
        $status = $request->input('status');

        foreach (json_decode($data,true) as $key => $value) {
            $ids[] = $value['id'];
        }

        if($status == -1) {
            $result = Config::destroy($ids);
        } else {
            $result = Config::whereIn('id',$ids)->update(['status'=>$status]);
        }

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }
    
}
