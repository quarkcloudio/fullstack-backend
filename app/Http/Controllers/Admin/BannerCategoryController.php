<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Post;
use App\Models\BannerCategory;
use App\Models\Banner;
use App\Models\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Validator;
use Hash;
use DB;

class BannerCategoryController extends Controller
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
        $query = BannerCategory::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('title','like','%'.$search['title'].'%');
            }

            // 状态
            if(isset($search['status'])) {
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
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if(empty($value['title'])) {
                $lists[$key]['title'] = '暂无';
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
        $data['lists'] = Helper::listsFormat($lists);

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
        return $this->success('获取成功！');
    }

    /**
     * 保存创建数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $title     =   $request->json('title');
        $name      =   $request->json('name');
        $width     =   $request->json('width');
        $height    =   $request->json('height');
        $status    =   $request->json('status');
        
        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'title' => ['required','max:255',Rule::unique('admins')->ignore(ADMINID)],
            'name' =>  ['required','name','max:255',Rule::unique('admins')->ignore(ADMINID)],
        ];

        // 进行验证
        $validator = Validator::make($rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'title') {
                    $errorMsg = '标题'.$value[0];
                }
                if($key === 'name') {
                    $errorMsg = '名称'.$value[0];
                }
            }
            return $this->error($errorMsg);
        }

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['name'] = $name;
        $data['width'] = $width;
        $data['height'] = $height;
        $data['status'] = $status;

        $result = BannerCategory::create($data);
        
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
        $id = $request->input('id');

        $data = BannerCategory::find($id)->toArray();

        if(empty($data['width'])) {
            $data['width'] = '暂无';
        }

        if(empty($data['height'])) {
            $data['height'] = '暂无';
        }

        return $this->success('获取成功！','',$data);
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
        $name           =   $request->json('name');
        $width          =   $request->json('width');
        $height         =   $request->json('height');
        $status         =   $request->json('status');
        
        // 表单验证错误提示信息
        $messages = [
            'required' => '必填',
            'max' => '最大长度不超过255位',
            'email' => '格式无效',
            'unique' => '已经存在',
        ];

        // 表单验证规则
        $rules = [
            'title' => ['required','max:255',Rule::unique('admins')->ignore(ADMINID)],
            'name' =>  ['required','name','max:255',Rule::unique('admins')->ignore(ADMINID)],
        ];

        // 进行验证
        $validator = Validator::make($rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'title') {
                    $errorMsg = '标题'.$value[0];
                }
                if($key === 'name') {
                    $errorMsg = '名称'.$value[0];
                }
            }
            return $this->error($errorMsg);
        }

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['name'] = $name;
        $data['width'] = $width;
        $data['height'] = $height;
        $data['status'] = $status;

        $result = BannerCategory::where('id',$id)->update($data);
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

        $result = BannerCategory::destroy($id);

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
        $query = BannerCategory::query();

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
