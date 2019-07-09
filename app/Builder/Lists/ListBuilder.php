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

    public function search($controls,$url='')
    {
        $search['controls'] = $controls;
        $search['url'] = $url;
        $this->search = $search;
        return $this;
    }

    public function advancedSearch($controls,$url='')
    {
        $advancedSearch['controls'] = $controls;
        $advancedSearch['url'] = $url;
        $this->advancedSearch = $advancedSearch;
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

    public function formModel($controls,$url)
    {
        $formModel['controls'] = $controls;
        $formModel['url'] = $url;
        $this->formModel = $formModel;
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
