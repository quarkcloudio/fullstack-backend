<?php

namespace App\Planet\Form\Fields;

use App\Planet\Form\Item;

class Input extends Item
{
    public  $type;

    function __construct() {
        $this->componentName = 'input';
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

    public function type($type)
    {
        $this->type = $type;
        return $this;
    }
}
