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

class BannerController extends Controller
{
    /**
     * 列表页
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
        $query = Banner::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('banners.title','like','%'.$search['title'].'%');
            }
            
            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('banners.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('banners.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('banners.deadline', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        // 查询列表
        $lists = $query
        ->join('banner_categories', 'banners.category_id', '=', 'banner_categories.id')
        ->leftjoin('pictures', 'pictures.id', '=', 'banners.cover_id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('banners.status', '>', 0)
        ->orderBy('banners.sort', 'desc')
        ->orderBy('banners.id', 'desc')
        ->select('banners.*','banner_categories.title as category_title','pictures.path')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {

            // 获取文件url，用于外部访问
            if(strpos($value['path'],'http') !== false) {
                $url = $value['path'];
            } else {
                $url = Storage::url($value['path']);
            }

            if($value['cover_id']) {
                $lists[$key]['cover_path'] = Helper::getPicture($value['cover_id']);
            }
            $lists[$key]['img'] = '<a href="javascript:void(0)" onclick="pictureView(\''.$url.'\')"><img layer-src="'.$url.'" src="'.$url.'" width="100%" /></a>';
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
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {
        $data['categorys'] = BannerCategory::all();
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
        $title          =   $request->json('title');
        $categoryId     =   $request->json('categoryId','');
        $url            =   $request->json('url','');
        $coverId        =   $request->json('cover_id',0);
        $sort           =   $request->json('sort','');
        $deadline       =   $request->json('deadline');
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
            'url' =>  ['required','url','max:255',Rule::unique('admins')->ignore(ADMINID)],
        ];

        // 进行验证
        $validator = Validator::make($rules,$messages);

        if ($validator->fails()) {
            $errors = $validator->errors()->getMessages();

            foreach($errors as $key => $value) {
                if($key === 'title') {
                    $errorMsg = '标题'.$value[0];
                }
                if($key === 'url') {
                    $errorMsg = '链接'.$value[0];
                }
            }
            return $this->error($errorMsg);
        }

        if (empty($categoryId)) {
            return $this->error('请选择位置！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['category_id'] = $categoryId;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['sort'] = $sort;
        $data['deadline'] = $deadline;
        $data['status'] = $status;

        $result = Banner::create($data);
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

        $data = Banner::find($id);

        $data['cover_path'] = Helper::getPicture($data['cover_id']);

        if(empty($data['deadline'])) {
            $data['deadline'] = date('Y-m-d H:i:s',strtotime($data['deadline']));;
        }
        
        $categorys = BannerCategory::all();

        $data['categorys'] = $categorys;
        
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
        $categoryId     =   $request->json('categoryId','');
        $url            =   $request->json('url','');
        $coverId        =   $request->json('cover_id',0);
        $sort           =   $request->json('sort','');
        $deadline       =   $request->json('deadline');
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择位置！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['category_id'] = $categoryId;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['sort'] = $sort;
        $data['deadline'] = $deadline;
        $data['status'] = $status;

        $result = Banner::where('id',$id)->update($data);
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

        $result = Banner::destroy($id);

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
        $query = Banner::query();

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
