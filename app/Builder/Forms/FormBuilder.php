<?php

namespace App\Builder\Forms;

class FormBuilder
{
    public  $name,
            $pageTitle,
            $controls,
            $wrapperCol,
            $labelCol,
            $submitName,
            $submitType,
            $submitLayout,
            $action;

    function __construct() {
        $this->pageTitle = 'default title';
        $this->name = 'default form';
        $this->controls = [];
        $this->submitName = '提交';
        $this->submitType = 'primary';
        $this->submitLayout = ['wrapperCol'=>['span' => 12, 'offset' => 5]];
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function pageTitle($title)
    {
        $this->pageTitle = $title;
        return $this;
    }

    public function controls($controls)
    {
        $this->controls = $controls;
        return $this;
    }

    public function wrapperCol($col)
    {
        $this->wrapperCol = $col;
        return $this;
    }

    public function labelCol($col)
    {
        $this->labelCol = $col;
        return $this;
    }

    public function action($url)
    {
        $this->action = $url;
        return $this;
    }

    public function submit($name,$type = 'primary',$layout = ['wrapperCol'=>['span' => 12, 'offset' => 5]])
    {
        $this->submitName = $name;
        $this->submitType = $type;
        $this->submitLayout = $layout;
        return $this;
    }

    protected function unsetNullProperty()
    {
        foreach ($this as $key => $value) {
            if(empty($value)) {
                unset($this->$key);
            }
        }
    }
}
