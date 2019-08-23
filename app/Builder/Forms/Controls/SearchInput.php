<?php

namespace App\Builder\Forms\Controls;

class SearchInput extends Control
{
    public  $mode;

    function __construct() {
        $this->componentName = 'searchInput';
        $this->options = [];
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

    public function option($options)
    {
        $this->options = $options;
        return $this;
    }

    public function mode($mode)
    {
        $this->mode = $mode;
        return $this;
    }

    public function dataSource($dataSource)
    {
        $this->dataSource = $dataSource;
        return $this;
    }
}
