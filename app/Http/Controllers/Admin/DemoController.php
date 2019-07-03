<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use App\Builder\Form\Controls\Text;
use App\Builder\Form\Form;
use App\Models\Post;
use App\Models\Category;

class DemoController extends Controller
{
    /**
     * 创建器-表单演示
     * 
     * @param  Request  $request
     * @return Response
     */
    public function getFormInfo(Request $request)
    {

        $labelCol['sm'] = ['span'=>2];
        $wrapperCol['sm'] = ['span'=>22];

        $controls = [
            Text::make('姓名','username')->value('love'),
            Text::make('密码','password')->value('love'),
        ];

        $data = Form::make('form')
        ->action('admin/demo/store')
        ->controls($controls)
        ->labelCol($labelCol)
        ->wrapperCol($wrapperCol);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->error('获取失败！');
        }
    }
}
