<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use Illuminate\Support\Facades\Auth;
use App\Models\Admin;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Menu;
use Validator;
use DB;
use Cache;

class RoleController extends Controller
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
        $guardName = $request->get('guardName','admin');
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Role::query()->where('guard_name',$guardName);

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['query'])) {
                $query->where('name','like','%'.$search['query'].'%');
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
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        foreach ($lists as $key => $list) {
            $menu = Menu::where('path',$list['name'])->where('guard_name','admin')->first();
            if(isset($menu->name)) {
                $lists[$key]['title'] = $menu->name;
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
        $lists = Menu::where('status',1)->where('guard_name','admin')->select('name as title','id as key','pid')->get()->toArray();

        $data['menus'] = Helper::listToTree($lists,'key','pid','children',0);
        
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
        $name          =   $request->json('name','');
        $menuIds       =   $request->json('menuIds');
        
        if (empty($name)) {
            return $this->error('角色名称必须填写！');
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';

        // 添加角色
        $role = Role::create($data);

        // 根据菜单id获取所有权限
        $permissions = Permission::whereIn('menu_id',$menuIds)->pluck('id')->toArray();

        // 同步权限
        $result = $role->syncPermissions(array_filter(array_unique($permissions)));

        if ($result) {
            return $this->success('操作成功！','/admin/role/index');
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

        // 所有菜单
        $menus = Menu::where('status',1)->where('guard_name','admin')->select('name as title','id as key','pid')->get()->toArray();

        $role = Role::find($id);

        $checkedMenus = [];

        foreach ($menus as $key => $menu) {
            $permissionIds = Permission::where('menu_id',$menu['key'])->pluck('id');

            $roleHasPermission = DB::table('role_has_permissions')
            ->whereIn('permission_id',$permissionIds)
            ->where('role_id',$role['id'])
            ->first();

            if($roleHasPermission) {
                $checkedMenus[] = strval($menu['key']);
            }

            $menus[$key]['key'] = strval($menu['key']);
        }

        $data['menus'] = Helper::listToTree($menus,'key','pid','children',0);
        $data['role'] = $role;
        $data['checkedMenus'] = $checkedMenus;

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
        $id            =   $request->json('id','');
        $name          =   $request->json('name','');
        $menuIds       =   $request->json('menuIds');
        
        if (empty($id)) {
            return $this->error('参数错误！');
        }

        if (empty($name)) {
            return $this->error('角色名称必须填写！');
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';

        // 更新角色
        $result = Role::where('id',$id)->update($data);

        // 根据菜单id获取所有权限
        $permissions = Permission::whereIn('menu_id',$menuIds)->pluck('id')->toArray();

        // 同步权限
        $result1 = Role::where('id',$id)->first()->syncPermissions(array_filter(array_unique($permissions)));

        if ($result && $result1) {
            return $this->success('操作成功！','/admin/role/index');
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

        $result = Role::destroy($id);

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
        $query = Role::query();

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
