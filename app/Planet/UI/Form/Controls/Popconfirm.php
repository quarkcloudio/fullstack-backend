<?php

namespace App\Planet\UI\Form\Controls;

class Popconfirm extends Control
{
    public $icon,$type,$render,$placement,$title,$onConfirm,$okText,$cancelText;

    function __construct() {
        $this->componentName = 'popconfirm';
        $this->type = 'default';
        $this->onConfirm['name'] = null;
        $this->onConfirm['url'] = null;
        $this->onConfirm['value'] = null;
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function icon($icon)
    {
        $this->icon = $icon;
        return $this;
    }

    public function type($type)
    {
        $this->type = $type;
        return $this;
    }

    public function render($render)
    {
        $this->render = $render;
        return $this;
    }

    public function onConfirm($name,$value='',$url='')
    {
        $this->onConfirm['name'] = $name;
        $this->onConfirm['url'] = $url;
        $this->onConfirm['value'] = $value;
        return $this;
    }

    public function placement($placement)
    {
        $this->placement = $placement;
        return $this;
    }

    public function title($title)
    {
        $this->title = $title;
        return $this;
    }

    public function okText($okText)
    {
        $this->okText = $okText;
        return $this;
    }

    public function cancelText($cancelText)
    {
        $this->cancelText = $cancelText;
        return $this;
    }
}
