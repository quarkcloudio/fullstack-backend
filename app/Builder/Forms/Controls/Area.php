<?php

namespace App\Builder\Forms\Controls;

use App\Models\Area as AreaModel;
use App\Services\Helper;

class Area extends Control
{
    public  $options;

    function __construct() {
        $this->componentName = 'cascader';
        $areas = AreaModel::where('pid','<>',0)
        ->select('area_name as value','area_name as label','id','pid')
        ->get()
        ->toArray();
        $this->options = Helper::listToTree($areas,'id','pid','children',1);
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

    public function option($options)
    {
        $this->options = $options;
        return $this;
    }
}
