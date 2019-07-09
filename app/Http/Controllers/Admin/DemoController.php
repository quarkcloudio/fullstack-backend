<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Services\Helper;
use App\Builder\Forms\Controls\Text;
use App\Builder\Forms\Controls\TextArea;
use App\Builder\Forms\Controls\InputNumber;
use App\Builder\Forms\Controls\Checkbox;
use App\Builder\Forms\Controls\Radio;
use App\Builder\Forms\Controls\Select;
use App\Builder\Forms\Controls\SwitchButton;
use App\Builder\Forms\Controls\DatePicker;
use App\Builder\Forms\Controls\Editor;
use App\Builder\Forms\Controls\Image;
use App\Builder\Forms\Controls\File;
use App\Builder\Forms\Controls\Button;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
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

        $data = FormBuilder::make('form')
        ->pageTitle('表单创建器')
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
     * 创建器-列表演示
     * 
     * @param  Request  $request
     * @return Response
     */
    public function getListInfo(Request $request)
    {

        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Post::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('posts.title','like','%'.$search['title'].'%');
            }

            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('posts.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('posts.status',$search['status']);
                }
            }

            // 作者
            if(isset($search['author'])) {
                if(!empty($search['author'])) {
                    $query->where('posts.author',$search['author']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('posts.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('posts.status', '>', 0)
        ->where('posts.type', 'ARTICLE')
        ->count();

        // 查询列表
        $lists = $query
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('posts.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('posts.*','categories.name as category_name','categories.title as category_title')
        ->get()
        ->toArray();

        foreach ($lists as $key => $value) {
            if(empty($value['name'])) {
                $lists[$key]['name'] = '暂无';
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $controls = [
            Button::make('发布文章')->icon('plus-circle')->type('primary')->onClick('openFormModel'),
            Button::make('导出数据')->icon('download')->href('#/')->target('_blank'),
        ];

        $actions = [
            Button::make('禁用')->render("{row.status == '1' ? '禁用' : '启用'}")->type('link')->onClick('changeStatus'),
            Button::make('编辑')->type('link')->onClick('openFormModel'),
            Button::make('删除')->type('link')->onClick('destroy'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('标题','title'),
            Column::make('操作','action')->actions($actions),
        ];

        $table = Table::make('table')->columns($columns)->dataSource($lists)->pagination($pagination);

        $data = ListBuilder::make('list')
        ->pageTitle('列表创建器')
        ->headerButton($controls)
        ->toolbarButton($controls)
        ->search($controls,'url')
        ->advancedSearch($controls,'url')
        ->formModel($controls,'formUrl')
        ->table($table);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }
}
