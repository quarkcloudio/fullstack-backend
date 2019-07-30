<?php

namespace App\Planet\UI\Layout;

class Content
{
    public  $title,
            $description,
            $breadcrumb,
            $body;

    function __construct() {
        $this->title = '';
        $this->description = '';
        $this->breadcrumb = null;
        $this->body = null;
    }

    public function title($title)
    {
        $this->title = $title;

        // 删除空属性
        $this->unsetNullProperty();
        return $this;
    }

    public function description($description)
    {
        $this->description = $description;
        return $this;
    }

    public function breadcrumb($breadcrumb)
    {
        $this->breadcrumb = $breadcrumb;
        return $this;
    }

    public function body($body)
    {
        $this->body = $body;
        return $this;
    }

    public function row($row)
    {
        $this->body = $row;
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
