<?php

namespace App\Planet\UI\Tabs;

class Tabs
{
    public  $name,$tabPanes,$componentName;

    function __construct() {
        $this->componentName = 'tabs';
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function defaultActiveKey($key = 1)
    {
        $this->key = $key;
        return $this;
    }

    public function tabPanes($tabPanes)
    {
        $this->tabPanes = $tabPanes;
        return $this;
    }

    protected function unsetNullProperty()
    {
        foreach ($this as $key => $value) {
            if(empty($value)) {
                unset($this->$key);
            }
        }
    }
}
