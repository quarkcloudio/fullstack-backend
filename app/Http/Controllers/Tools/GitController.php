<?php

namespace App\Http\Controllers\Tools;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;

class GitController extends Controller
{
    /**
     * git自动部署
     * @param  integer
     * @return string
     */
    public function webhook(Request $request)
    {

        $version = $request->input('version');

        if(empty($version)) {
            return $this->error('版本错误！');
        }

        print '当前用户：'.shell_exec('whoami').'<br>';

        // '2>$1' 配置管道输出错误，方便调试
        // 这里已经配置了上面coding仓库的remote，并且-u 绑定了默认remote，所以直接使用'git pull'
        $command = 'cd ' . str_replace('\\', '/\\', base_path()) . ' & git pull origin '.$version.' 2>&1';
  
        $status = shell_exec($command);
  
        print $status;
    }
}
