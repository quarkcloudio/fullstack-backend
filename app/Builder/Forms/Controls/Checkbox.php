<?php

namespace App\Builder\Forms\Controls;

class Checkbox extends Control
{
    public  $list;

    function __construct() {
        $this->componentName = 'checkbox';
    }

    static function make($labelName,$name)
    {
        $self = new self();

        $self->labelName = $labelName;
        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function list($list)
    {
        $this->list = $list;
        return $this;
    }
}
