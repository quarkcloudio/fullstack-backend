<?php

namespace App\Planet\Form;

use Exception;

class Item
{
    public  $colon, // 配合 label 属性使用，表示是否显示 label 后面的冒号
            $dependencies,
            $extra,
            $getValueFromEvent,
            $hasFeedback,
            $help,
            $htmlFor,
            $noStyle,
            $label,
            $labelAlign,
            $labelCol,
            $name,
            $normalize,
            $required,
            $rules,
            $shouldUpdate,
            $trigger,
            $validateStatus,
            $validateTrigger,
            $valuePropName,
            $wrapperCol,
            $style,
            $component;

    function __construct() {
        $this->colon = true;
    }

    /**
     *  配合 label 属性使用，表示是否显示 label 后面的冒号
     *
     * @param  boolean $show
     * @return object
     */
    public function colon($show = true)
    {
        $show ? $this->colon = true : $this->colon = false;
        return $this;
    }

    /**
     *  配合 label 属性使用，表示是否显示 label 后面的冒号
     *
     * @param  boolean $show
     * @return object
     */
    public function dependencies($fileds)
    {
        if(!is_array($fileds)) {
            throw new Exception('Argument must be an array!');
        }

        $this->dependencies = $fileds;
        return $this;
    }

    /**
     *  额外的提示信息，和 help 类似，当需要错误信息和提示文案同时出现时，可以使用这个。
     *
     * @param  string $extra
     * @return object
     */
    public function extra($extra)
    {
        if(empty($extra)) {
            throw new Exception('argument cannot be empty!');
        }

        $this->extra = $extra;
        return $this;
    }

    /**
     *  配合 validateStatus 属性使用，展示校验状态图标，建议只配合 Input 组件使用
     *
     * @param  boolean $hasFeedback
     * @return object
     */
    public function hasFeedback($hasFeedback = true)
    {
        $hasFeedback ? $this->hasFeedback = true : $this->hasFeedback = false;
        return $this;
    }

    /**
     *  配合 validateStatus 属性使用，展示校验状态图标，建议只配合 Input 组件使用
     *
     * @param  boolean $hasFeedback
     * @return object
     */
    public function help($help)
    {
        if(empty($help)) {
            throw new Exception('argument cannot be empty!');
        }

        $this->help = $help;
        return $this;
    }

    /**
     *  为 true 时不带样式，作为纯字段控件使用
     *
     * @return object
     */
    public function noStyle()
    {
        $this->noStyle = true;
        return $this;
    }

    /**
     *  label 标签的文本
     *
     * @param  string $label
     * @return object
     */
    public function label($label = '')
    {
        $this->label = $label;
        return $this;
    }

    /**
     *  标签文本对齐方式
     *
     * @param  left|right $align
     * @return object
     */
    public function labelAlign($align = 'right')
    {
        if(!in_array($align,['left','right'])) {
            throw new Exception('Argument must be an array!');
        }

        $this->labelAlign = $labelAlign;
        return $this;
    }

    /**
     *  label 标签布局，同 <Col> 组件，设置 span offset 值，如 {span: 3, offset: 12} 或 sm: {span: 3, offset: 12}。
     *  你可以通过 Form 的 labelCol 进行统一设置。当和 Form 同时设置时，以 Item 为准
     *
     * @param  array|object $col
     * @return object
     */
    public function labelCol($col)
    {
        if(!is_array($col)) {
            throw new Exception("argument must be an array!");
        }

        $this->col = $col;
        return $this;
    }

    /**
     *  label 标签布局，同 <Col> 组件，设置 span offset 值，如 {span: 3, offset: 12} 或 sm: {span: 3, offset: 12}。
     *  你可以通过 Form 的 labelCol 进行统一设置。当和 Form 同时设置时，以 Item 为准
     *
     * @param  array|object $col
     * @return object
     */
    public function name($name)
    {
        if(!is_array($name)) {
            throw new Exception("argument must be an array!");
        }

        $this->name = $name;
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
