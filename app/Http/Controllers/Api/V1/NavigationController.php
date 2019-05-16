<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Services\Helper;
use App\Models\Navigation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class NavigationController extends BaseController
{
    public function index(Request $request)
    {
        $pid = $request->input('pid',0);

        // 读取导航
        $navigations = Navigation::where('status',1)->orderBy('sort', 'asc')->get()->toArray();

        // 数组转换成tree
        $navigationsTree = Helper::listToTree($navigations,'id','pid','_child',$pid);

        if(!empty($navigationsTree)) {
            return $this->success('操作成功','',$navigationsTree);
        } else {
            return $this->error('操作失败');
        }
    }
}