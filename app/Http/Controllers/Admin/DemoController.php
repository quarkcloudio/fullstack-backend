<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use App\Builder\Form\Controls\Text;
use App\Builder\Form\Controls\TextArea;
use App\Builder\Form\Controls\InputNumber;
use App\Builder\Form\Controls\Checkbox;
use App\Builder\Form\Controls\Radio;
use App\Builder\Form\Controls\Select;
use App\Builder\Form\Controls\SwitchButton;
use App\Builder\Form\Controls\DatePicker;
use App\Builder\Form\Controls\Editor;
use App\Builder\Form\Controls\Image;
use App\Builder\Form\Controls\File;
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

        $checkboxList = [
            [
                'name'=>'首页推荐',
                'value'=>1,
            ],
            [
                'name'=>'列表页推荐',
                'value'=>2,
            ],
        ];

        $radioList = [
            [
                'name'=>'无图',
                'value'=>1,
            ],
            [
                'name'=>'单图（小）',
                'value'=>2,
            ],
            [
                'name'=>'多图',
                'value'=>3,
            ],
        ];

        $categorys = [
            [
                'name'=>'无图',
                'value'=>1,
            ],
            [
                'name'=>'单图（小）',
                'value'=>2,
            ],
            [
                'name'=>'多图',
                'value'=>3,
            ],
        ];

        $defaultList[0]['uid'] = 2;
        $defaultList[0]['name'] = Helper::getPicture(2,0,'name');
        $defaultList[0]['url'] = Helper::getPicture(2);
        $defaultList[0]['status'] = 'done';
        $defaultList[1]['uid'] = 3;
        $defaultList[1]['name'] = Helper::getPicture(2,0,'name');
        $defaultList[1]['url'] = Helper::getPicture(2);
        $defaultList[1]['status'] = 'done';

        $controls = [
            Text::make('姓名','username')->style(['width'=>200])->value('love'),
            Text::make('密码','password')->extra('请输入6-8为字符')->value('love'),
            TextArea::make('描述','des')->value('love'),
            InputNumber::make('排序','level')->extra('越大越靠前')->max(100)->value(1),
            Checkbox::make('推荐位','position')->list($checkboxList)->value([1,2]),
            Radio::make('展现形式','show_type')->list($radioList)->value(1),
            Select::make('分类','category')->option($categorys)->value(2),
            SwitchButton::make('开关','switch')->checkedText('是')->unCheckedText('否')->value(true),
            DatePicker::make('创建时间','create_time')->format("YYYY-MM-DD HH:mm:ss")->value('2019'),
            Editor::make('内容','content')->value('2019'),
            Image::make('多图上传','cover_id')->mode('multiple')->list($defaultList),
            Image::make('单图上传','cover'),
            File::make('附件','file_id')->list($defaultList),
        ];

        $data = Form::make('form')
        ->action('admin/demo/store')
        ->controls($controls)
        ->labelCol($labelCol)
        ->wrapperCol($wrapperCol)
        ->submit('提交表单');

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->error('获取失败！');
        }
    }

    /**
     * 创建器-表单演示
     * 
     * @param  Request  $request
     * @return Response
     */
    public function getListInfo(Request $request)
    {

        $labelCol['sm'] = ['span'=>2];
        $wrapperCol['sm'] = ['span'=>22];

        $checkboxList = [
            [
                'name'=>'首页推荐',
                'value'=>1,
            ],
            [
                'name'=>'列表页推荐',
                'value'=>2,
            ],
        ];

        $radioList = [
            [
                'name'=>'无图',
                'value'=>1,
            ],
            [
                'name'=>'单图（小）',
                'value'=>2,
            ],
            [
                'name'=>'多图',
                'value'=>3,
            ],
        ];

        $categorys = [
            [
                'name'=>'无图',
                'value'=>1,
            ],
            [
                'name'=>'单图（小）',
                'value'=>2,
            ],
            [
                'name'=>'多图',
                'value'=>3,
            ],
        ];

        $defaultList[0]['uid'] = 2;
        $defaultList[0]['name'] = Helper::getPicture(2,0,'name');
        $defaultList[0]['url'] = Helper::getPicture(2);
        $defaultList[0]['status'] = 'done';
        $defaultList[1]['uid'] = 3;
        $defaultList[1]['name'] = Helper::getPicture(2,0,'name');
        $defaultList[1]['url'] = Helper::getPicture(2);
        $defaultList[1]['status'] = 'done';

        $controls = [
            Text::make('姓名','username')->style(['width'=>200])->value('love'),
            Text::make('密码','password')->extra('请输入6-8为字符')->value('love'),
            TextArea::make('描述','des')->value('love'),
            InputNumber::make('排序','level')->extra('越大越靠前')->max(100)->value(1),
            Checkbox::make('推荐位','position')->list($checkboxList)->value([1,2]),
            Radio::make('展现形式','show_type')->list($radioList)->value(1),
            Select::make('分类','category')->option($categorys)->value(2),
            SwitchButton::make('开关','switch')->checkedText('是')->unCheckedText('否')->value(true),
            DatePicker::make('创建时间','create_time')->format("YYYY-MM-DD HH:mm:ss")->value('2019'),
            Editor::make('内容','content')->value('2019'),
            Image::make('多图上传','cover_id')->mode('multiple')->list($defaultList),
            Image::make('单图上传','cover'),
            File::make('附件','file_id')->list($defaultList),
        ];

        $data = Form::make('form')
        ->action('admin/demo/store')
        ->controls($controls)
        ->labelCol($labelCol)
        ->wrapperCol($wrapperCol)
        ->submit('提交表单');

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->error('获取失败！');
        }
    }
}
