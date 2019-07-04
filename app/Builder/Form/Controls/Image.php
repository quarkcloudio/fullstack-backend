<?php

namespace App\Builder\Form\Controls;

class Image extends Control
{
    public  $mode,$list,$button;

    function __construct() {
        $this->mode = 'single';
        $this->button = '上传图片';
        $this->type = 'image';
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

    public function mode($mode)
    {
        $this->mode = $mode;
        return $this;
    }

    public function defaultList($list)
    {
        $this->list = $list;
        return $this;
    }

    public function button($text)
    {
        $this->button = $text;
        return $this;
    }
}
