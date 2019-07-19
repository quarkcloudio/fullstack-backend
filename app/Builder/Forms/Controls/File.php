<?php

namespace App\Builder\Forms\Controls;

class File extends Control
{
    public  $list,$button,$limitSize,$limitType,$limitNum;

    function __construct() {
        $this->button = '上传文件';
        $this->limitSize = 2; // 默认文件大小2M
        $this->limitType = ['image/jpeg','image/png'];
        $this->limitNum = 3; // 默认上传个数
        $this->componentName = 'file';
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

    public function value($value)
    {
        $this->value = $value;
        return $this;
    }

    public function limitSize($limitSize)
    {
        $this->limitSize = $limitSize;
        return $this;
    }

    public function limitType($limitType)
    {
        $this->limitType = $limitType;
        return $this;
    }

    public function limitNum($limitNum)
    {
        $this->limitNum = $limitNum;
        return $this;
    }

    public function button($text)
    {
        $this->button = $text;
        return $this;
    }
}
