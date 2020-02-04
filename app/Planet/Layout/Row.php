<?php

namespace App\Planet\Layout;

class Row
{
    public  $type,
            $align,
            $gutter,
            $justify,
            $col,
            $componentName;

    function __construct() {
        $this->align = 'top';
        $this->gutter = '0';
        $this->justify = 'start';
        $this->componentName = 'row';
    }

    public function type($type)
    {
        $this->type = $type;
        return $this;
    }

    public function align($align)
    {
        $this->align = $align;
        return $this;
    }

    public function gutter($gutter)
    {
        $this->gutter = $gutter;
        return $this;
    }

    public function justify($justify)
    {
        $this->justify = $justify;
        return $this;
    }

    public function col($span,$content = null)
    {
        if(!is_array($span)) {
            $col['span'] = $span;
            $col['content'] = $content;
            $this->col[] = $col;
        } else {
            $this->col = $span;
        }
        return $this;
    }
}
