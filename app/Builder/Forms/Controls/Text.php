<?php

namespace App\Builder\Form\Controls;

class Text extends Control
{
    function __construct() {
        $this->type = 'text';
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
