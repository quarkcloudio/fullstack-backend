<?php

namespace App\Planet\Form\Fields;

use App\Planet\Form\Item;
use Exception;

class Input extends Item
{
    public  $addonAfter,
            $addonBefore,
            $defaultValue,
            $disabled,
            $id,
            $maxLength,
            $prefix,
            $size,
            $suffix,
            $type,
            $value,
            $onChange,
            $onPressEnter,
            $allowClear;

    function __construct() {
        $this->component = 'input';
        $this->type = 'text';
    }

    /**
     * 创建组件
     *
     * @param  string $name
     * @param  string $label
     * @return object
     */
    static function make($name,$label = '')
    {
        $self = new self();

        $self->name = $name;
        if(empty($label)) {
            $self->label = $name;
        } else {
            $self->label = $label;
        }

        $self->placeholder = '请输入'.$label;

        // 删除空属性
        $self->unsetNullProperty();
        return $self;
    }

    /**
     * 带标签的 input，设置后置标签。例如：'http://'
     *
     * @param  string $addonAfter
     * @return object
     */
    public function addonAfter($addonAfter = '')
    {
        $this->addonAfter = $addonAfter;
        return $this;
    }

    /**
     * 带标签的 input，设置前置标签。例如：'.com'
     *
     * @param  string $addonBefore
     * @return object
     */
    public function addonBefore($addonBefore = '')
    {
        $this->addonBefore = $addonBefore;
        return $this;
    }

    /**
     * 输入框默认内容
     *
     * @param  string $value
     * @return object
     */
    public function defaultValue($value = '')
    {
        $this->defaultValue = $value;
        return $this;
    }

    /**
     * 是否禁用状态，默认为 false
     * 
     * @param  bool $status
     * @return object
     */
    public function disabled($status = true)
    {
        $status ? $this->disabled = true : $this->disabled = false;
        return $this;
    }

    /**
     * 最大长度
     * 
     * @param  number $length
     * @return object
     */
    public function maxLength($length = 0)
    {
        if(!is_numeric($length)) {
            throw new Exception('argument must be of numeric type!');
        }

        $this->maxLength = $length;
        return $this;
    }

    /**
     * 带有前缀图标的 input
     * 
     * @param  string $prefix
     * @return object
     */
    public function prefix($prefix = '')
    {
        $this->prefix = $prefix;
        return $this;
    }

    /**
     * 控件大小。注：标准表单内的输入框大小限制为 large。可选 large default small
     * 
     * @param  large|default|small $prefix
     * @return object
     */
    public function size($size = 'default')
    {
        if(!in_array($align,['large', 'default', 'small'])) {
            throw new Exception("argument must be in 'large', 'default', 'small'!");
        }

        $this->size = $size;
        return $this;
    }

    /**
     * 带有后缀图标的 input
     * 
     * @param  string $suffix
     * @return object
     */
    public function suffix($suffix = '')
    {
        $this->suffix = $suffix;
        return $this;
    }

    /**
     * 声明 input 类型，同原生 input 标签的 type 属性，见：MDN(请直接使用 Input.TextArea 代替 type="textarea")。
     * 
     * @param  string $type
     * @return object
     */
    public function type($type = 'text')
    {
        $this->type = $type;
        return $this;
    }

    /**
     * 输入框内容
     * 
     * @param  string $value
     * @return object
     */
    public function value($value = '')
    {
        $this->value = $value;
        return $this;
    }

    /**
     * 可以点击清除图标删除内容
     * 
     * @param  string $allowClear
     * @return object
     */
    public function allowClear($allowClear = true)
    {
        $allowClear ? $this->allowClear = true : $this->allowClear = false;
        return $this;
    }
}
