<?php

namespace App\Builder\Forms\Controls;

class DatePicker extends Control
{
    public  $format,
            $showTime,
            $mode;

    function __construct() {
        $this->controlType = 'datePicker';
        $this->showTime = true;
        $this->mode = 'date';
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

    public function mode($mode)
    {
        $this->mode = $mode;
        return $this;
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
