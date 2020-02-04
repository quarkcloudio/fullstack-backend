<?php

namespace App\Planet\Form\Fields;

use App\Planet\Form\Item;

class SwitchButton extends Item
{
    public  $checkedChildren,
            $unCheckedChildren;

    function __construct() {
        $this->componentName = 'switch';
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

    public function checkedText($text)
    {
        $this->checkedChildren = $text;
        return $this;
    }

    public function unCheckedText($text)
    {
        $this->unCheckedChildren = $text;
        return $this;
    }
}
