<?php

namespace App\Builder\Forms\Controls;

class Editor extends Control
{
    function __construct() {
        $this->controlType = 'editor';
        $this->style = ['height' => 400, 'boxShadow' => 'inset 0 1px 3px rgba(0,0,0,.1)'];
    }

    static function make($labelName,$name)
    {
        $self = new self();

        $self->labelName = $labelName;
        $self->name = $name;

        $self->placeholder = '请输入'.$labelName;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }
}
