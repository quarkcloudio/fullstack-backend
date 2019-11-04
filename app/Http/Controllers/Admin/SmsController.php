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
use App\Models\Sms;

class SmsController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '短信';
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
        $query = Sms::query();

        // 查询
        if(!empty($search)) {

            // 手机号
            if(isset($search['phone'])) {
                if(!empty($search['phone'])) {
                    $query->where('phone',$search['phone']);
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
        ->select('sms.*')
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
                $lists[$key]['status'] = '发送成功';
            }
            if($statue == 2) {
                $lists[$key]['status'] = '发送失败';
            }
        }
        
        $searchs = [
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('手机号','phone'),
            Column::make('验证码','code'),
            Column::make('内容','content'),
            Column::make('状态','status')->withTag("text === '发送失败' ? 'red' : 'blue'"),
            Column::make('发送时间','created_at'),
        ];

        $headerButtons = [
            Button::make('发送'.$this->pageTitle)->icon('login')->type('primary')->href('admin/system/'.$this->controllerName().'/create'),
        ];

        $toolbarButtons = [
            Button::make('重发')->type('primary')->onClick('submit',null,'admin/'.$this->controllerName().'/sendSms'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $actions = [
            Button::make('重发')->type('link')->onClick('submit',null,'admin/'.$this->controllerName().'/sendSms'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,$toolbarButtons,$actions);

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

        $result = Sms::destroy($id);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 发送短信验证码
     * @param  integer
     * @return string
     */
    public function send(Request $request)
    {
        $phone = $request->input('phone');
        $content = $request->input('content');

        if(empty($phone)) {
            return $this->error('手机号不能为空！');
        }

        if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
            return $this->error('手机号格式不正确！');
        }

        if(empty($content)) {
            return $this->error('内容不能为空！');
        }

        $sendDayCount = Sms::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->where('phone',$phone)->count();

        // 每天最多发送6条短信
        if($sendDayCount >6) {
            return $this->error('抱歉，每个手机号一天最多获取6条短信！');
        }

        $result = Helper::siooSendSms($phone,$content);

        $data['phone'] = $phone;
        $data['content'] = $content;

        if($result) {
            $data['status'] = 1;
            Sms::create($data);
            return $this->success('短信已发送！');
        } else {
            $data['status'] = 2;
            Sms::create($data);
            return $this->error('短信发送失败！');
        }
    }
}
