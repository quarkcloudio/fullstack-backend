<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use Illuminate\Support\Facades\Auth;
use App\Models\Admin;
use App\Models\Menu;
use Spatie\Permission\Models\Permission;
use Validator;
use DB;

class MenuController extends Controller
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
        $pageSize  = intval($request->get('pageSize',1000));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Menu::query()->where('menus.guard_name',$guardName);

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['query'])) {
                $query->where('menus.name','like','%'.$search['query'].'%');
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('menus.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
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

            if($list['show']) {
                $lists[$key]['show'] = '是';
            } else {
                $lists[$key]['show'] = '否';
            }

            if(empty($list['icon'])) {
                $lists[$key]['icon'] = '无';
            }

            $menuPermissions = Permission::where('menu_id',$list['id'])->get();

            $lists[$key]['permission_name'] = '';
            foreach ($menuPermissions as $key1 => $value1) {
                $lists[$key]['permission_name'] = $lists[$key]['permission_name'].$value1['name']."<br />";
            }
        }

        $menuTrees     = Helper::listToTree($lists,'id','pid','children',0);
        $menuTreeLists = Helper::treeToOrderList($menuTrees,0,'name','children');
        // 模板数据
        $data['lists'] = $menuTrees;
        $data['menuTreeLists'] = $menuTreeLists;
        
        // 所有权限
        $data['permissions'] = Permission::all();

        $data['icons'] = ['lock','unlock','bars','book','calendar','cloud','cloud-download','code','copy','credit-card','delete','desktop','download','ellipsis','more','file','file-text','file-unknown','file-pdf','file-word','file-excel','file-jpg','file-ppt','file-markdown','file-add','folder','folder-open','folder-add','hdd','frown','meh','smile','inbox','laptop','appstore','link','mail','mobile','notification','paper-clip','picture','poweroff','reload','search','setting','share-alt','shopping-cart','tablet','tag','tags','to-top','upload','user','video-camera','home','loading','loading-3-quarters','cloud-upload','star','heart','environment','eye','eye-invisible','camera','save','team','solution','phone','filter','exception','import','export','customer-service','qrcode','scan','like','dislike','message','pay-circle','calculator','pushpin','bulb','select','switcher','rocket','bell','disconnect','database','compass','barcode','hourglass','key','flag','layout','printer','sound','usb','skin','tool','sync','wifi','car','schedule','user-add','user-delete','usergroup-add','usergroup-delete','man','woman','shop','gift','idcard','medicine-box','red-envelope','coffee','copyright','trademark','safety','wallet','bank','trophy','contacts','global','shake','api','fork','dashboard','table','profile','alert','audit','branches','build','border','crown','experiment','fire','money-collect','property-safety','read','reconciliation','rest','security-scan','insurance','interation','safety-certificate','project','thunderbolt','block','cluster','deployment-unit','dollar','euro','pound','file-done','file-exclamation','file-protect','file-search','file-sync','gateway','gold','robot','shopping'];

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
        $name          =   $request->json('name','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $icon          =   $request->json('icon','');
        $path          =   $request->json('path');
        $permissionIds =   $request->json('permissionIds','');
        $show          =   $request->json('show');
        $status        =   $request->json('status','');
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($show == true) {
            $show = 1;
        } else {
            $show = 0; //隐藏
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['icon'] = $icon;
        $data['path'] = $path;
        $data['show'] = $show;
        $data['status'] = $status;

        $result = Menu::create($data);

        if($permissionIds) {
            Permission::whereIn('id',$permissionIds)->update(['menu_id' => $result['id']]);
        }

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

        $data = Menu::find($id)->toArray();

        $permissionIds= Permission::where('menu_id',$id)->pluck('id');

        foreach ($permissionIds as $key => $value) {
            $data['permissionIds'][] = strval($value);
        }

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
        $name          =   $request->json('name','');
        $pid           =   $request->json('pid',0);
        $sort          =   $request->json('sort',0);
        $icon          =   $request->json('icon','');
        $path          =   $request->json('path');
        $permissionIds =   $request->json('permissionIds','');
        $show          =   $request->json('show');
        $status        =   $request->json('status','');

        if (empty($id)) {
            return $this->error('请选择数据！');
        }
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($show == true) {
            $show = 1;
        } else {
            $show = 0; //隐藏
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name'] = $name;
        $data['guard_name'] = 'admin';
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['icon'] = $icon;
        $data['path'] = $path;
        $data['show'] = $show;
        $data['status'] = $status;

        $result = Menu::where('id',$id)->update($data);

        if($permissionIds) {

            // 先清空
            Permission::where('menu_id',$id)->update(['menu_id' => 0]);

            // 赋值
            Permission::whereIn('id',$permissionIds)->update(['menu_id' => $id]);
        }

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

        $result = Menu::destroy($id);

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
        $query = Menu::query();

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
        $query = Menu::query();

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
