<?php

namespace App\Planet\Table;

class Table
{
    public  $name,
            $bordered,
            $columns,
            $dataSource,
            $pagination,
            $size,
            $componentName;

    function __construct() {
        $this->componentName = 'table';
        $this->bordered = false;
        $this->columns = [];
        $this->dataSource = [];
        $this->pagination = false;
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function columns($columns)
    {
        $this->columns = $columns;
        return $this;
    }

    public function dataSource($dataSource)
    {
        $this->dataSource = $dataSource;
        return $this;
    }

    public function pagination($pagination)
    {
        $this->pagination = $pagination;
        return $this;
    }

    public function size($size)
    {
        $this->size = $size;
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
