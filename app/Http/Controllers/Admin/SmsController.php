<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Log;
use App\Models\Admin;
use App\User;
use App\Models\Sms;

class SmsController extends Controller
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
        
        // 模板数据
        $data['lists'] = $lists;

        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
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
    public function destroy(Request $request)
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
}
