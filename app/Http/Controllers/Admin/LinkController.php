<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Post;
use App\Models\Category;
use App\Models\Link;
use App\Models\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Validator;
use Hash;
use DB;

class LinkController extends Controller
{
    /**
     * 链接列表页
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
        $query = Link::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('links.title','like','%'.$search['title'].'%');
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('links.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('links.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        $lists = $query
        ->leftJoin('pictures', 'pictures.id', '=', 'links.cover_id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('links.status', '>', 0)
        ->orderBy('sort', 'desc')
        ->orderBy('id', 'desc')
        ->select('links.*','pictures.path')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            
            if(!empty($value['path'])) {
                // 获取文件url，用于外部访问
                if(strpos($value['path'],'http') !== false) {
                    $url = $value['path'];
                } else {
                    $url = Storage::url($value['path']);
                }
            } else {
                $url = '/static/images/default.png';
            }

            $lists[$key]['cover_list'] = '<a href="javascript:void(0)" onclick="pictureView(\''.$url.'\')"><img layer-src="'.$url.'" src="'.$url.'" width="100%" /></a>';

            if($value['cover_id']) {
                $lists[$key]['cover_path'] = Helper::getPicture($value['cover_id']);
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
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {
        return $this->success('获取成功！');
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
        $url            =   $request->json('url','');
        $coverId        =   $request->json('cover_ids',0);
        $sort           =   $request->json('sort','');
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

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['sort'] = $sort;
        $data['status'] = $status;

        $result = Link::create($data);

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
        $id = $request->input('id');

        $link = Link::find($id);

        //获取图片
        $coverIds = json_decode($link['cover_id'],true);
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
        
        $data['link'] = $link;
        
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
        $title          =   $request->json('title','');
        $url            =   $request->json('url','');
        $coverId        =   $request->json('cover_ids',0);
        $sort           =   $request->json('sort','');
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['url'] = $url;
        $data['cover_id'] = $coverId;
        $data['sort'] = $sort;
        $data['status'] = $status;

        $result = Link::where('id',$id)->update($data);
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

        $result = Link::destroy($id);

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
        $query = Link::query();

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
