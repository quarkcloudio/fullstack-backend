<?php

namespace App\Planet;

use App\Planet\Form\Fields\Input;

class Form
{
    public  $name,$tabPanes,$component;

    function __construct() {
        $this->component = 'form';
    }

    /**
     * text组件
     *
     * @param  string $label
     * @param  string $name
     * @return $this
     */
    static function text($name,$label = '')
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
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
