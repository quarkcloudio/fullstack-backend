<?php

namespace App\Planet\Table;

class Column
{
    public  $align,
            $colSpan,
            $dataIndex,
            $fixed,
            $title,
            $width,
            $render,
            $tag,
            $a,
            $actions;

    function __construct() {
        $this->align = 'left';
        $this->fixed = false;
        $this->actions = false;
        $this->tag = false;
        $this->isImage = false;
        $this->isIcon = false;
    }

    static function make($title,$dataIndex)
    {
        $self = new self();

        $self->title = $title;
        $self->dataIndex = $dataIndex;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function align($align)
    {
        $this->align = $align;
        return $this;
    }

    public function colSpan($colSpan)
    {
        $this->colSpan = $colSpan;
        return $this;
    }

    public function fixed($fixed)
    {
        $this->fixed = $fixed;
        return $this;
    }

    public function width($width)
    {
        $this->width = $width;
        return $this;
    }

    public function render($render)
    {
        $this->render = $render;
        return $this;
    }

    public function withTag($color)
    {
        if(strpos($color,"'") == false && strpos($color,'"') == false) {
            $color = "'".$color."'";
        }
        $this->tag = $color;
        return $this;
    }

    public function withA($href,$target='_self')
    {
        if(!(strpos($href,'http') !== false)) {
            $href = '#/'.$href;
        }

        $a['href'] = $href;
        $a['target'] = $target;
        $this->a = $a;
        return $this;
    }

    public function isIcon()
    {
        $this->isIcon = true;
        return $this;
    }

    public function isImage()
    {
        $this->isImage = true;
        return $this;
    }

    public function actions($actions)
    {
        $this->actions = $actions;
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
