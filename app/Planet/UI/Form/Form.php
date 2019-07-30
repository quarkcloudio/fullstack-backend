<?php

namespace App\Planet\UI\Form;

class Form
{
    public  $controls,
            $wrapperCol,
            $labelCol,
            $componentName;

    function __construct() {
        $this->componentName = 'form';
        $this->controls = [];
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
