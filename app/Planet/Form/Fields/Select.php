<?php

namespace App\Planet\Form\Fields;

use App\Planet\Form\Item;

class Select extends Item
{
    public  $options,
            $mode;

    function __construct() {
        $this->componentName = 'select';
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

    public function options($options)
    {
        $this->options = $options;
        return $this;
    }

    public function mode($mode)
    {
        $this->mode = $mode;
        return $this;
    }
}
