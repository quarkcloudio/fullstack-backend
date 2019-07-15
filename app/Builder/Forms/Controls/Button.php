<?php

namespace App\Builder\Forms\Controls;

class Button extends Control
{
    public  $href,$icon,$target,$type,$onClick,$render,$extendButtons;

    function __construct() {
        $this->controlType = 'button';
        $this->type = 'default';
        $this->onClick['name'] = null;
        $this->onClick['url'] = null;
        $this->onClick['value'] = null;
        $this->extendButtons = false;
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function href($href)
    {
        $this->href = '#/'.$href;
        return $this;
    }

    public function icon($icon)
    {
        $this->icon = $icon;
        return $this;
    }

    public function size($size)
    {
        $this->size = $size;
        return $this;
    }

    public function target($target)
    {
        $this->target = $target;
        return $this;
    }

    public function withExtendButtons($extendButtons)
    {
        $this->extendButtons = $extendButtons;
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

    public function onClick($name,$value='',$url='')
    {
        $this->onClick['name'] = $name;
        $this->onClick['url'] = $url;
        $this->onClick['value'] = $value;
        return $this;
    }
}
