<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Services\Helper;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $pid = $request->input('pid',0);
        $type = $request->input('type','ARTICLE');
        // 读取列表
        $categorys = Category::where('status',1)
        ->where('type',$type)
        ->where('pid',$pid)
        ->orderBy('sort', 'asc')
        ->get()
        ->toArray();

        // 数组转换成tree
        $categorysTree = Helper::listToTree(Helper::mobileAdaptor($categorys),'id','pid','_child',$pid);

        return $this->success('获取成功！','',$categorysTree);
    }
}