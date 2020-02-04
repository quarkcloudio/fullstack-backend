<?php

namespace App\Planet\Form\Fields;

use App\Planet\Form\Item;

class Radio extends Item
{
    public  $options;

    function __construct() {
        $this->componentName = 'radio';
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

    public function options($options)
    {
        $this->options = $options;
        return $this;
    }
}
