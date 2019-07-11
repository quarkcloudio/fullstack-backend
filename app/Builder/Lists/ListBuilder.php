<?php

namespace App\Builder\Lists;

class ListBuilder
{
    public  $name,
            $pageTitle,
            $search,
            $advancedSearch,
            $headerButtons,
            $toolbarButtons,
            $formModel,
            $table;

    function __construct() {
        $this->pageTitle = 'default title';
        $this->name = 'default list';
        $this->search = [];
        $this->advancedSearch = [];
        $this->table = [];
    }

    static function make($name)
    {
        $self = new self();

        $self->name = $name;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    public function pageTitle($title)
    {
        $this->pageTitle = $title;
        return $this;
    }

    public function search($controls)
    {
        $this->search = $controls;
        return $this;
    }

    public function advancedSearch($controls)
    {
        $this->advancedSearch = $controls;
        return $this;
    }

    public function headerButton($buttons)
    {
        $this->headerButtons = $buttons;
        return $this;
    }

    public function toolbarButton($buttons)
    {
        $this->toolbarButtons = $buttons;
        return $this;
    }

    public function table($table)
    {
        $this->table = $table;
        return $this;
    }

    public function modal($controls)
    {
        $this->modal = $controls;
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
