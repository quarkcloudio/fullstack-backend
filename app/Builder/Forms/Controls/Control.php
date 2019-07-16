<?php

namespace App\Builder\Forms\Controls;

class Control
{
    public  $labelName,
            $name,
            $value,
            $placeholder,
            $size,
            $rules,
            $wrapperCol,
            $labelCol,
            $style,
            $extra,
            $componentName;

    function __construct() {
        $this->size = 'default';
    }

    public function value($value)
    {
        $this->value = $value;
        return $this;
    }

    public function placeholder($text)
    {
        $this->placeholder = $text;
        return $this;
    }

    public function size($size)
    {
        $this->size = $size;
        return $this;
    }

    public function rule($rules)
    {
        $this->rules = $rules;
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

    public function style($style)
    {
        $this->style = $style;
        return $this;
    }

    public function extra($extra)
    {
        $this->extra = $extra;
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
