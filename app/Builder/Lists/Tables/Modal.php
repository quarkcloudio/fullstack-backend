<?php

namespace App\Builder\Lists\Tables;

class modal
{
    public  $title,
            $width,
            $height,
            $formUrl;

    function __construct() {
        $this->controls = false;
    }

    static function make($title)
    {
        $self = new self();

        $self->title = $title;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function width($width)
    {
        $this->width = $width;
        return $this;
    }

    public function height($height)
    {
        $this->height = $height;
        return $this;
    }

    public function formUrl($url)
    {
        $this->formUrl = $url;
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
