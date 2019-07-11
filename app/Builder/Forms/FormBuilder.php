<?php

namespace App\Builder\Forms;

class FormBuilder
{
    public  $name,
            $pageTitle,
            $controls,
            $wrapperCol,
            $labelCol;

    function __construct() {
        $this->pageTitle = 'default title';
        $this->name = 'default form';
        $this->controls = [];
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function pageTitle($title)
    {
        $this->pageTitle = $title;
        return $this;
    }

    public function controls($controls)
    {
        $this->controls = $controls;
        return $this;
    }

    public function wrapperCol($col)
    {
        $this->wrapperCol = $col;
        return $this;
    }

    public function labelCol($col)
    {
        $this->labelCol = $col;
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
