<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\User;
use App\Models\Order;
use App\Models\Post;
use App\Services\Helper;
use Artisan;

class DashboardController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $result['user_today_num'] = User::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->count();

        $result['article_total_num'] = Post::count();

        $result['order_today_money'] = Order::whereBetween('paid_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->sum('amount');

        $result['order_total_money'] = Order::where('status',2)->sum('amount');

        $result['user_data'] = $this->getUserData();

        $result['order_data'] = $this->getOrderData();

        $result['app_version'] = config('app.version');

        return $this->success('获取成功！','',$result);
    }

    /**
     * 清空缓存
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function clearCache(Request $request)
    {
        // Helper::clearCache();
        
        $result = Artisan::call('config:clear');

        if($result !== false) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    // 获取用户统计数据
    protected function getUserData()
    {
        $data[0]['count'] = User::whereBetween('created_at', [$this->getMonth('01',1), $this->getMonth('01',2)])
        ->count();
        $data[0]['month'] = '一月';

        $data[1]['count'] = User::whereBetween('created_at', [$this->getMonth('02',1), $this->getMonth('02',2)])
        ->count();
        $data[1]['month'] = '二月';

        $data[2]['count'] = User::whereBetween('created_at', [$this->getMonth('03',1), $this->getMonth('03',2)])
        ->count();
        $data[2]['month'] = '三月';

        $data[3]['count'] = User::whereBetween('created_at', [$this->getMonth('04',1), $this->getMonth('04',2)])
        ->count();
        $data[3]['month'] = '四月';

        $data[4]['count'] = User::whereBetween('created_at', [$this->getMonth('05',1), $this->getMonth('05',2)])
        ->count();
        $data[4]['month'] = '五月';

        $data[5]['count'] = User::whereBetween('created_at', [$this->getMonth('06',1), $this->getMonth('06',2)])
        ->count();
        $data[5]['month'] = '六月';

        $data[6]['count'] = User::whereBetween('created_at', [$this->getMonth('07',1), $this->getMonth('07',2)])
        ->count();
        $data[6]['month'] = '七月';

        $data[7]['count'] = User::whereBetween('created_at', [$this->getMonth('08',1), $this->getMonth('08',2)])
        ->count();
        $data[7]['month'] = '八月';

        $data[8]['count'] = User::whereBetween('created_at', [$this->getMonth('09',1), $this->getMonth('09',2)])
        ->count();
        $data[8]['month'] = '九月';

        $data[9]['count'] = User::whereBetween('created_at', [$this->getMonth('10',1), $this->getMonth('10',2)])
        ->count();
        $data[9]['month'] = '十月';

        $data[10]['count'] = User::whereBetween('created_at', [$this->getMonth('11',1), $this->getMonth('11',2)])
        ->count();
        $data[10]['month'] = '十一月';

        $data[11]['count'] = User::whereBetween('created_at', [$this->getMonth('12',1), $this->getMonth('12',2)])
        ->count();
        $data[11]['month'] = '十二月';

        return $data;
    }

    // 获取订单统计数据
    protected function getOrderData()
    {
        for ($i=0; $i < 7; $i++) { 
            if($i == 0) {
                $data[$i]['money'] = Order::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
                ->sum('amount');
                $data[$i]['date'] = date('m-d');
            } else {
                $data[$i]['money'] = Order::whereBetween('created_at', [date('Y-m-d 00:00:00',strtotime("-$i day")), date('Y-m-d 23:59:59',strtotime("-$i day"))])
                ->sum('amount');
                $data[$i]['date'] = date('m-d',strtotime("-$i day"));
            }
        }
        return array_reverse($data);
    }

    // 获取当前年月的开始与结束日期
    protected function getMonth($month,$type)
    {
        $startDate = date("Y-".$month."-01 00:00:00");
        $endDate = date('Y-m-d', mktime(23, 59, 59, date('m', strtotime($startDate))+1, 00));
        if($type == 1) {
            return $startDate;
        } elseif($type == 2) {
            return $endDate;
        }
    }

    /**
     * 版本升级
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function update(Request $request)
    {
        $header['Accept'] = 'application/json';

        $repository = json_decode(Helper::curl('https://api.github.com/repos/tangtanglove/fullstack-backend/releases/latest?access_token='.base64_decode('YWM1MWIzYWQ5NjMzMGNlNGZlMTMyYTVhNWY4MDM2ZWEyM2QwY2ZjMw=='),false,'get',$header,1),true);

        $result['app_version'] = config('app.version');
        $result['repository'] = $repository;

        $result['can_update'] = false;

        if(isset($repository['name'])) {
            if($repository['name'] != $result['app_version']) {
                $result['can_update'] = true;
            }
        }

        return $this->success('获取成功！','',$result);
    }

    /**
     * 下载最新版本文件
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function download(Request $request)
    {
        $version   = $request->get('version');

        // $url = 'https://github.com/tangtanglove/fullstack-backend/archive/'.$version.'.zip';
        // $file = readfile($url);

        $url ='https://dev.tencent.com/u/tangtanglove/p/fullstack-backend/git/archive/'.$version.'.zip';
        $file = Helper::curl($url,false,'get',false,1);

        // 默认本地上传
        $path = 'uploads/files/'.$version.".zip";

        $result = Storage::disk('public')->put($path,$file);

        if($result) {
            return $this->success('文件下载成功！','',$path);
        } else {
            return $this->error('文件下载失败！');
        }
    }

    /**
     * 解压程序包
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function extract(Request $request)
    {
        $version   = $request->get('version');

        $path = storage_path('app/').'public/uploads/files/'.$version.".zip";
        $outPath = storage_path('app/').'public/uploads/files/';

        $zip = new \ZipArchive();

        $result = $zip->open($path);

        if ($result === true) {
          $zip->extractTo($outPath);
          $zip->close();
        }

        if($result) {
            return $this->success('文件解压成功！');
        } else {
            return $this->error('文件解压失败！');
        }
    }

    /**
     * 更新文件
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function updateFile(Request $request)
    {
        $version   = $request->get('version');

        $path = storage_path('app/').'public/uploads/files/fullstack-backend-'.$version;

        $dirs = Helper::getDir($path);
        $files = Helper::getFileLists($path);

        foreach ($dirs as $key => $value) {
            Helper::copyDirToDir(storage_path('app/').'public/uploads/files/fullstack-backend-'.$version.'/'.$value,base_path());
        }

        foreach ($files as $key => $value) {
            Helper::copyFileToDir(storage_path('app/').'public/uploads/files/fullstack-backend-'.$version.'/'.$value,base_path());
        }

        return $this->success('程序更新成功！');
    }

    /**
     * 更新数据库
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function updateDatabase(Request $request)
    {
        $result = Artisan::call('migrate');

        if($result !== false) {
            return $this->success('数据库更新成功！','',$result);
        } else {
            return $this->error('数据库更新失败！',$result);
        }
    }

    /**
     * 完成，更新程序版本
     * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function finish(Request $request)
    {
        $version   = $request->get('version');

        $data = [
            'APP_VERSION' => $version
        ];

        Helper::modifyEnv($data);

        $result = Artisan::call('config:clear');

        if($result !== false) {
            return $this->success('更新成功！');
        } else {
            return $this->error('更新失败！');
        }
    }
}
