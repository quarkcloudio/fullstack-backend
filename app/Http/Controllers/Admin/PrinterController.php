<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use EasyWeChat\Factory;
use Illuminate\Support\Facades\Storage;
use App\Models\Post;
use App\Models\Category;
use App\Models\Printer;
use App\Models\Shop;
use DB;
use Cache;

class PrinterController extends Controller
{
    /**
     * 打印机列表页
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
        $query = Printer::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('printers.title','like','%'.$search['title'].'%');
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('printers.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('printers.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        $lists = $query
        ->join('shops', 'shops.id', '=', 'printers.shop_id')
        ->where('printers.status', '>', 0)
        ->orderBy('printers.id', 'desc')
        ->select('printers.*','shops.title as shop_title')
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

        // 模板数据
        $data['lists'] = Helper::listsFormat($lists);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }   
    }

}
