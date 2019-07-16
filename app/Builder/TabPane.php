<?php

namespace App\Builder;

class TabPane
{
    public  $title,$key,$controls;

    function __construct() {

    }

    static function make($title,$key)
    {
        $self = new self();

        $self->title = $title;
        $self->key = $key;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function controls($controls)
    {
        $this->controls = $controls;
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
