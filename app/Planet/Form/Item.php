<?php

namespace App\Planet\Form;

use Exception;

class Item
{
    public  $colon,
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
     * 配合 label 属性使用，表示是否显示 label 后面的冒号
     *
     * @param  bool $show
     * @return $this
     */
    public function colon($show = true)
    {
        $show ? $this->colon = true : $this->colon = false;
        return $this;
    }

    /**
     * 配合 label 属性使用，表示是否显示 label 后面的冒号
     *
     * @param  bool $show
     * @return $this
     */
    public function dependencies($fileds)
    {
        if(!is_array($fileds)) {
            throw new Exception('argument must be an array!');
        }

        $this->dependencies = $fileds;
        return $this;
    }

    /**
     * 额外的提示信息，和 help 类似，当需要错误信息和提示文案同时出现时，可以使用这个。
     *
     * @param  string $extra
     * @return $this
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
     * 配合 validateStatus 属性使用，展示校验状态图标，建议只配合 Input 组件使用
     *
     * @param  bool $hasFeedback
     * @return $this
     */
    public function hasFeedback($hasFeedback = true)
    {
        $hasFeedback ? $this->hasFeedback = true : $this->hasFeedback = false;
        return $this;
    }

    /**
     * 配合 validateStatus 属性使用，展示校验状态图标，建议只配合 Input 组件使用
     *
     * @param  bool $hasFeedback
     * @return $this
     */
    public function help($help = '')
    {
        if(empty($help)) {
            throw new Exception('argument cannot be empty!');
        }

        $this->help = $help;
        return $this;
    }

    /**
     * 为 true 时不带样式，作为纯字段控件使用
     *
     * @return $this
     */
    public function noStyle()
    {
        $this->noStyle = true;
        return $this;
    }

    /**
     * label 标签的文本
     *
     * @param  string $label
     * @return $this
     */
    public function label($label = '')
    {
        $this->label = $label;
        return $this;
    }

    /**
     * 标签文本对齐方式
     *
     * @param  left|right $align
     * @return $this
     */
    public function labelAlign($align = 'right')
    {
        if(!in_array($align,['left','right'])) {
            throw new Exception("argument must be 'left' or 'right'!");
        }

        $this->labelAlign = $labelAlign;
        return $this;
    }

    /**
     * label 标签布局，同 <Col> 组件，设置 span offset 值，如 {span: 3, offset: 12} 或 sm: {span: 3, offset: 12}。
     * 你可以通过 Form 的 labelCol 进行统一设置。当和 Form 同时设置时，以 Item 为准
     *
     * @param  array|$this $col
     * @return $this
     */
    public function labelCol($col)
    {
        if(!is_array($col)) {
            throw new Exception("argument must be an array!");
        }

        $this->labelCol = $col;
        return $this;
    }

    /**
     * 字段名，支持数组
     *
     * @param  string $name
     * @return $this
     */
    public function name($name = '')
    {
        $this->name = $name;
        return $this;
    }

    /**
     * 是否必填，如不设置，则会根据校验规则自动生成
     * 
     * @return $this
     */
    public function required()
    {
        $this->required = true;
        return $this;
    }

    /**
     * 校验规则，设置字段的校验逻辑
     * 
     * @param  array|$this $rules
     * @return $this
     */
    public function rule($rules)
    {
        if(!is_array($rules)) {
            throw new Exception("argument must be an array!");
        }

        $this->rules = $rules;
        return $this;
    }

    /**
     * 子节点的值的属性，如 Switch 的是 'checked'
     * 
     * @param  string $valuePropName
     * @return $this
     */
    public function valuePropName($valuePropName = '')
    {
        $this->valuePropName = $valuePropName;
        return $this;
    }

    /**
     * 需要为输入控件设置布局样式时，使用该属性，用法同 labelCol。
     * 你可以通过 Form 的 wrapperCol 进行统一设置。当和 Form 同时设置时，以 Item 为准。
     *
     * @param  array|$this $col
     * @return $this
     */
    public function wrapperCol($col)
    {
        if(!is_array($col)) {
            throw new Exception("argument must be an array!");
        }

        $this->wrapperCol = $col;
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
