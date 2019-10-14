<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Builder\Forms\Controls\ID;
use App\Builder\Forms\Controls\Input;
use App\Builder\Forms\Controls\Text;
use App\Builder\Forms\Controls\TextArea;
use App\Builder\Forms\Controls\InputNumber;
use App\Builder\Forms\Controls\Checkbox;
use App\Builder\Forms\Controls\Radio;
use App\Builder\Forms\Controls\Select;
use App\Builder\Forms\Controls\SwitchButton;
use App\Builder\Forms\Controls\DatePicker;
use App\Builder\Forms\Controls\RangePicker;
use App\Builder\Forms\Controls\Editor;
use App\Builder\Forms\Controls\Image;
use App\Builder\Forms\Controls\File;
use App\Builder\Forms\Controls\Button;
use App\Builder\Forms\Controls\Popconfirm;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use App\Models\ActionLog;
use App\Services\Helper;
use App\Models\Admin;
use App\User;

class ActionLogController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '日志';
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
        $query = ActionLog::query();

        // 查询
        if(!empty($search)) {

            // 用户名
            if(isset($search['username'])) {
                $admin = Admin::where('username',$search['username'])->first();
                $user = User::where('username',$search['username'])->first();
                if(!empty($admin)) {
                    $adminId = $admin['id'];
                    $query->where('adminid',$adminId);
                }
                if(!empty($user)) {
                    $userId = $user['id'];
                    $query->where('uid',$userId);
                }
            }

            // 行为
            if(isset($search['action'])) {
                if(!empty($search['action'])) {
                    $query->where('action','like','%'.$search['action'].'%');
                }
            }

            // IP
            if(isset($search['ip']) && $search['ip'] !=0) {
                if(!empty($search['ip'])) {
                    $query->where('ip',$search['ip']);
                }
            }

            // 备注
            if(isset($search['remark'])) {
                if(!empty($search['remark'])) {
                    $query->where('remark','like','%'.$search['remark'].'%');
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

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {

            if($list['type'] === 'ADMIN') {
                if(!empty($list['object_id'])) {
                    $adminInfo = Admin::where('id',$list['object_id'])->first();
                    if(empty($adminInfo)) {
                        $lists[$key]['username'] = $adminInfo['username'];
                    }
                }
            } else {
                $userInfo = User::where('id',$list['object_id'])->first();
                if(empty($userInfo)) {
                    $lists[$key]['username'] = $userInfo['username'];
                }
            }

            if(empty($lists[$key]['username'])) {
                $lists[$key]['username'] = '暂无';
            }
        }

        $searchs = [
            Input::make('搜索的用户名','username'),
            Button::make('搜索')->onClick('search'),
        ];

        $advancedSearchs = [
            Input::make('用户名','username'),
            Input::make('行为','action'),
            Input::make('IP','ip'),
            Input::make('备注','remark'),
            RangePicker::make('发生时间','created_at')->format("YYYY-MM-DD HH:mm:ss"),
            Button::make('搜索')->type('primary')->onClick('search'),
            Button::make('重置')->onClick('resetSearch'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('用户名','username')->withA('admin/'.$this->controllerName().'/edit'),
            Column::make('行为','action'),
            Column::make('操作地址','url'),
            Column::make('备注','remark'),
            Column::make('IP','ip'),
            Column::make('发生时间','created_at'),
        ];
        
        $q['search'] = $search;
        $q['token'] = Helper::token($request);

        $exportUrl = url('api/admin/'.$this->controllerName().'/export?'.http_build_query($q));

        $headerButtons = [
            Button::make('导出'.$this->pageTitle)->icon('export')->type('default')->target('_blank')->href($exportUrl),
        ];

        $toolbarButtons = [
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $actions = [
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,$advancedSearchs,$headerButtons,$toolbarButtons,$actions);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 删除单个数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeStatus(Request $request)
    {
        $id = $request->json('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $result = ActionLog::destroy($id);

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
        $query = ActionLog::query();

        // 查询
        if(!empty($search)) {

            // 用户名
            if(isset($search['name'])) {
                $admin = Admin::where('name',$search['name'])->first();
                $user = User::where('name',$search['name'])->first();
                if(!empty($admin)) {
                    $adminId = $admin['id'];
                    $query->where('object_id',$adminId)->where('type','ADMIN');
                }
                if(!empty($user)) {
                    $userId = $user['id'];
                    $query->where('object_id',$userId)->where('type','USER');
                }
            }

            // 行为
            if(isset($search['action'])) {
                if(!empty($search['action'])) {
                    $query->where('action','like','%'.$search['action'].'%');
                }
            }

            // IP
            if(isset($search['ip']) && $search['ip'] !=0) {
                if(!empty($search['ip'])) {
                    $query->where('ip',$search['ip']);
                }
            }

            // 备注
            if(isset($search['remark'])) {
                if(!empty($search['remark'])) {
                    $query->where('remark','like','%'.$search['remark'].'%');
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }
        // 查询列表
        $lists = $query
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();    

        foreach ($lists as $key => $list) {

            if($list['type'] === 'ADMIN') {
                if(!empty($list['object_id'])) {
                    $adminInfo = Admin::where('id',$list['object_id'])->first();
                    if(empty($adminInfo)) {
                        $lists[$key]['username'] = $adminInfo['username'];
                    }
                }
            } else {
                $userInfo = User::where('id',$list['object_id'])->first();
                if(empty($userInfo)) {
                    $lists[$key]['username'] = $userInfo['username'];
                }
            }

            if(empty($lists[$key]['username'])) {
                $lists[$key]['username'] = '暂无';
            }
        }

        $fileName = 'data';

        $title = ['ID','用户名称','行为','访问地址','备注','IP地址','状态','发生时间','发生时间'];

        Helper::export($fileName,$title,$lists);
    }
}
