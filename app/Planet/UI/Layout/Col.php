<?php

namespace App\Planet\UI\Layout;

class Col
{
    public  $offset,
            $order,
            $pull,
            $push,
            $span,
            $xs,
            $sm,
            $md,
            $lg,
            $xl,
            $xxl,
            $row;

    function __construct() {
        $this->offset = 0;
        $this->order = 0;
        $this->pull = 0;
        $this->push = 0;
        $this->span = 24;
        $this->componentName = 'col';
    }

    public function offset($offset)
    {
        $this->offset = $offset;
        return $this;
    }

    public function order($order)
    {
        $this->order = $order;
        return $this;
    }

    public function pull($pull)
    {
        $this->pull = $pull;
        return $this;
    }

    public function push($push)
    {
        $this->push = $push;
        return $this;
    }

    public function span($span)
    {
        $this->span = $span;
        return $this;
    }

    public function xs($xs)
    {
        $this->xs = $xs;
        return $this;
    }

    public function sm($sm)
    {
        $this->sm = $sm;
        return $this;
    }

    public function md($md)
    {
        $this->md = $md;
        return $this;
    }

    public function lg($lg)
    {
        $this->lg = $lg;
        return $this;
    }

    public function xl($xl)
    {
        $this->xl = $xl;
        return $this;
    }

    public function xxl($xxl)
    {
        $this->xxl = $xxl;
        return $this;
    }

    public function row($row)
    {
        if(!is_array($row)) {
            $this->row[] = $row;
        } else {
            $this->row = $row;
        }
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
