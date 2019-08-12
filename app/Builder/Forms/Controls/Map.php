<?php

namespace App\Builder\Forms\Controls;

class Map extends Control
{
    public  $type,$zoom,$key;

    function __construct() {
        $this->componentName = 'map';
        $this->type = 'text';
        $this->zoom = 14;
        $this->key = '788e08def03f95c670944fe2c78fa76f';
        $position['longitude'] = '116.397724';
        $position['latitude'] = '39.903755';
        $this->value = $position;
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
    
    public function zoom($zoom)
    {
        $this->zoom = $zoom;
        return $this;
    }

    public function key($key)
    {
        $this->key = $key;
        return $this;
    }

    public function position($longitude,$latitude)
    {
        $position['longitude'] = $longitude;
        $position['latitude'] = $latitude;
        $this->value = $position;
        return $this;
    }
}
