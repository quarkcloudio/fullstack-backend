<?php

namespace App\Builder\Forms\Controls;

class InputNumber extends Control
{
    public  $min,
            $max,
            $step;

    function __construct() {
        $this->componentName = 'inputNumber';
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

    public function min($min)
    {
        $this->min = $min;
        return $this;
    }

    public function max($max)
    {
        $this->max = $max;
        return $this;
    }

    public function step($step)
    {
        $this->step = $step;
        return $this;
    }
}
