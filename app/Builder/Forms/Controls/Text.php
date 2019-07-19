<?php

namespace App\Builder\Forms\Controls;

class Text extends Control
{
    public  $type;

    function __construct() {
        $this->componentName = 'text';
    }

    static function make($labelName)
    {
        $self = new self();

        $self->labelName = $labelName;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }
}
