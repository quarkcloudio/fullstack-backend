<?php

namespace App\Builder\Forms\Controls;

class Cascader extends Control
{
    public  $options;

    function __construct() {
        $this->componentName = 'cascader';
    }

    static function make($labelName,$name)
    {
        $self = new self();

        $self->labelName = $labelName;
        $self->name = $name;

        $self->placeholder = '请选择'.$labelName;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function option($options)
    {
        $this->options = $options;
        return $this;
    }
}
