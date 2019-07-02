<?php

namespace App\Builder\Fields;

class Text
{
    public  $labelName,
            $fieldName,
            $value,
            $placeholder,
            $size;

    function __construct() {
        $this->size = 'default';
    }

    static function make($labelName,$fieldName)
    {
        $self = new self();

        $self->labelName = $labelName;
        $self->fieldName = $fieldName;
        $self->unsetNullValue();
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

    protected function unsetNullValue()
    {
        foreach ($this as $key => $value) {
            if(empty($value)) {
                unset($this->$key);
            }
        }
    }
}
