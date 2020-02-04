<?php

namespace App\Planet\Form\Fields;

use App\Planet\Form\Item;

class Text extends Item
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
