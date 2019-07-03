<?php

namespace App\Builder\Form;

class ItemLayout
{
    public  $labelName,
            $name,
            $value,
            $placeholder,
            $size,
            $rules,
            $wrapperCol,
            $labelCol,
            $type;

    function __construct() {
        $this->size = 'default';
        $this->type = 'text';
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

    protected function unsetNullProperty()
    {
        foreach ($this as $key => $value) {
            if(empty($value)) {
                unset($this->$key);
            }
        }
    }
}
