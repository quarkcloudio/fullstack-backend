<?php

namespace App\Builder\Form\Controls;

class SwitchButton extends Control
{
    public  $checkedChildren,
            $unCheckedChildren,
            $type;

    function __construct() {
        $this->type = 'switch';
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
