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

class BuilderController extends Controller
{

    protected $pageTitle,$headerButtons,$toolbarButtons,$actions;

    public function __construct()
    {
        $this->pageTitle = '默认页面';
    }

    /**
     * 创建器-表单演示
     * 
     * @param  Request  $request
     * @return Response
     */
    protected function formBuilder($controls,$data = [],$labelCol = [],$wrapperCol = [])
    {

        if(empty($labelCol)) {
            $labelCol['sm'] = ['span'=>2];
        }

        if(empty($wrapperCol)) {
            $wrapperCol['sm'] = ['span'=>22];
        }

        if(isset($data['id'])) {
            $pageTitle = '编辑'.$this->pageTitle;
        } else {
            $pageTitle = '新增'.$this->pageTitle;
        }

        if(!empty($data)) {
            if(isset($controls->componentName)) {
                foreach ($controls->tabPanes as $key => $tabPane) {
                    foreach ($tabPane->controls as $key1 => $tabPaneControl) {
                        if(isset($tabPaneControl->name)) {
                            if(isset($data[$tabPaneControl->name])) {
                                $tabPaneControl->value = $data[$tabPaneControl->name];
                                $controls->tabPanes[$key]->controls[$key1] = $tabPaneControl;
                            }
                        }
                    }
                }
            } else {
                foreach ($controls as $key => $control) {
                    if(isset($control->name)) {
                        if(isset($data[$control->name])) {
                            $control->value = $data[$control->name];
                            $controls[$key] = $control;
                        }
                    }
                }
            }
        }

        $result = FormBuilder::make('form')
        ->pageTitle($pageTitle)
        ->controls($controls)
        ->labelCol($labelCol)
        ->wrapperCol($wrapperCol);

        return $result;
    }

    protected function listBuilder($columns,$lists,$pagination,$searchs = [],$advancedSearchs = [],$headerButtons=[],$toolbarButtons = [],$actions = [])
    {

        if(empty($headerButtons)) {
            if($this->headerButtons) {
                $headerButtons = $this->headerButtons;
            } else {
                $headerButtons = [
                    Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/'.$this->controllerName().'/create'),
                    //Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->onClick('openModal',['title'=>'新增'.$this->pageTitle,'width'=>600],'admin/'.$this->controllerName().'/create'),
                    //Button::make('导出数据')->icon('download')->href('admin/'.$this->controllerName().'/export')->target('_blank'),
                ];
            }
        }

        if(empty($toolbarButtons)) {
            if($this->toolbarButtons) {
                $toolbarButtons = $this->toolbarButtons;
            } else {
                $toolbarButtons = [
                    Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/changeStatus'),
                    Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/changeStatus'),
                    Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
                ];
            }
        }

        if(empty($actions)) {
            if($this->actions) {
                $actions = $this->actions;
            } else {
                $actions = [
                    Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
                    Button::make('编辑')->type('link')->href('admin/'.$this->controllerName().'/edit'),
                    Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
                    //Button::make('编辑')->type('link')->onClick('openModal',['title'=>'编辑'.$this->pageTitle,'width'=>600],'admin/'.$this->controllerName().'/create'),
                ];
            }
        }

        $columns[] = Column::make('操作','action')->actions($actions);

        $table = Table::make('table')->columns($columns)->dataSource($lists)->pagination($pagination);

        $result = ListBuilder::make('list')
        ->pageTitle($this->pageTitle.'列表')
        ->headerButton($headerButtons)
        ->toolbarButton($toolbarButtons)
        ->search($searchs)
        ->advancedSearch($advancedSearchs)
        ->table($table);

        return $result;
    }

    protected function controllerName () {
        list($class, $method) = explode('@', request()->route()->getActionName());

        # 控制器名称
        $controller = lcfirst(str_replace(
            'Controller',
            '',
            substr(strrchr($class, '\\'), 1)
        ));

        return $controller;
    }
}
