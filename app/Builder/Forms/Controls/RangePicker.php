<?php

namespace App\Builder\Forms\Controls;

class RangePicker extends Control
{
    public  $format,
            $showTime;

    function __construct() {
        $this->componentName = 'rangePicker';
        $this->showTime = true;
        $this->value = [null,null];
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

    public function showTime($showTime)
    {
        $this->showTime = $showTime;
        return $this;
    }

    public function format($format)
    {
        $this->format = $format;
        return $this;
    }
}
