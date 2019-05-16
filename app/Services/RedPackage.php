<?php
namespace App\Services;

//配置传输数据DTO
class OptionDTO
{
 
    //红包总金额
    public $totalMoney;
 
    //红包数量
    public $num;
 
    //范围开始
    public $rangeStart;
 
    //范围结算
    public $rangeEnd;
 
    //生成红包策略
    public $builderStrategy;
 
    //随机红包剩余规则
    public $randFormatType; //Can_Left：不修数据,可以有剩余；No_Left：不能有剩余
 
    public static function create($totalMoney,$num,$rangeStart,$rangEnd,
        $builderStrategy,$randFormatType = 'No_Left')
    {
        $self = new self();
        $self->num = $num;
        $self->rangeStart = $rangeStart;
        $self->rangeEnd = $rangEnd;
        $self->totalMoney = $totalMoney;
        $self->builderStrategy = $builderStrategy;
        $self->randFormatType = $randFormatType;
        return $self;
    }
}
 
//红包生成器接口
interface IBuilderStrategy
{
    //创建红包
    public function create();    
    //设置配置
    public function setOption(OptionDTO $option); 
    //是否可以生成红包
    public function isCanBuilder();
    //生成红包函数
    public function fx($x);
}
 
//固定等额红包策略
class EqualPackageStrategy implements IBuilderStrategy
{
    //单个红包金额
    public $oneMoney;
 
    //数量
    public $num;
 
    public function __construct($option = null) 
    {
        if($option instanceof OptionDTO)
        {
            $this->setOption($option);
        }
    }
 
    public function setOption(OptionDTO $option)
    {
        $this->oneMoney = $option->rangeStart;
        $this->num = $option->num;
    }
 
    public function create() 
    {
 
        $data = array();
        if(false == $this->isCanBuilder())
        {
            return $data;    
        }
 
        $data = array();
        if(false == is_int($this->num) || $this->num <= 0) 
        {
            return $data;    
        }
        for($i = 1;$i <= $this->num;$i++)
        {
            $data[$i] = $this->fx($i);
        }
        return $data;
    }
    
    /**
     * 等额红包的方程是一条直线 
     * 
     * @param mixed $x 
     * @access public
     * @return void
     */
    public function fx($x) 
    {
        return $this->oneMoney; 
    }
 
    /**
     * 是否能固定红包 
     * 
     * @access public
     * @return void
     */
    public function isCanBuilder()
    {
        if(false == is_int($this->num) || $this->num <= 0) 
        {
            return false;    
        }
 
        if(false ==  is_numeric($this->oneMoney) || $this->oneMoney <= 0)
        {
            return false;
        }
 
        //单个红包小于1分
        if($this->oneMoney < 0.01)
        {
            return false;
        }
        
        return true;
 
    }
 
 
}
 
//随机红包策略(三角形)
class RandTrianglePackageStrategy implements IBuilderStrategy
{
    //总额
    public $totalMoney;
 
    //红包数量
    public $num;
 
    //随机红包最小值
    public $minMoney;
 
    //随机红包最大值
    public $maxMoney;
 
    //修数据方式：NO_LEFT: 红包总额 = 预算总额；CAN_LEFT: 红包总额 <= 预算总额
    public $formatType;
 
    //预算剩余金额
    public $leftMoney;
 
 
    public function __construct($option = null)
    {
        if($option instanceof OptionDTO)
        {
            $this->setOption($option);
        }
    }
 
    public function setOption(OptionDTO $option)
    {
        $this->totalMoney = $option->totalMoney;
        $this->num = $option->num;
        $this->formatType = $option->randFormatType;
        $this->minMoney = $option->rangeStart;
        $this->maxMoney = $option->rangeEnd;
        $this->leftMoney = $this->totalMoney;
    }
 
    /**
     * 创建随机红包 
     * 
     * @access public
     * @return void
     */
    public function create() 
    {
        
        $data = array();
        if(false == $this->isCanBuilder())
        {
            return $data;
        }
        
        $leftMoney = $this->leftMoney;
        for($i = 1;$i <= $this->num;$i++)
        {
            $data[$i] = $this->fx($i);
            $leftMoney = $leftMoney - $data[$i];
        }
 
        //修数据
        list($okLeftMoney,$okData) = $this->format($leftMoney,$data);
 
        //随机排序
        shuffle($okData);
        $this->leftMoney = $okLeftMoney;
 
        return $okData;
    }
 
    /**
     * 是否能够发随机红包 
     * 
     * @access public
     * @return void
     */
    public function isCanBuilder()
    {
        if(false == is_int($this->num) || $this->num <= 0)
        {
            return false;
        }
 
        if(false ==  is_numeric($this->totalMoney) || $this->totalMoney <= 0)
        {
            return false;
        }
 
        //均值
        $avgMoney = $this->totalMoney / 1.0 / $this->num;
        
        //均值小于最小值
        if($avgMoney < $this->minMoney )
        {
            return false;
        }
        
        return true;

    }
 
    /**
     * 获取剩余金额 
     * 
     * @access public
     * @return void
     */
    public function getLeftMoney()
    {
        return $this->leftMoney;
    }
 
    /**
     * 随机红包生成函数。三角函数。[(1,0.01),($num/2,$avgMoney),($num,0.01)]
     * 
     * @param mixed $x,1 <= $x <= $this->num;
     * @access public
     * @return void
     */
    public function fx($x)
    {
        
        if(false == $this->isCanBuilder())
        {
            return 0;
        }
 
        if($x < 1 || $x > $this->num)
        {
            return 0;
        }
        
        $x1 = 1;
        $y1 = $this->minMoney;
        
        //我的峰值
        $y2 = $this->maxMoney;
 
        //中间点
        $x2 = ceil($this->num /  1.0 / 2);
 
        //最后点
        $x3 = $this->num;
        $y3 = $this->minMoney;
 
        //当x1,x2,x3都是1的时候(竖线)
        if($x1 == $x2 && $x2 == $x3)
        {
            return $y2;
        }
 
        // '/_\'三角形状的线性方程
        //'/'部分
        if($x1 != $x2 && $x >= $x1 && $x <= $x2)
        {
 
            $y = 1.0 * ($x - $x1) / ($x2 - $x1) * ($y2 - $y1) + $y1;
            return number_format($y, 2, '.', '');
        }
 
        //'\'形状
        if($x2 != $x3 && $x >= $x2 && $x <= $x3)
        {
 
            $y = 1.0 * ($x - $x2) / ($x3 - $x2) * ($y3 - $y2) + $y2;
            return number_format($y, 2, '.', '');
        }
        
        return 0;
    }
 
    /**
     * 格式化修红包数据 
     * 
     * @param mixed $leftMoney 
     * @param array $data 
     * @access public
     * @return void
     */
    private function format($leftMoney,array $data)
    {
 
        //不能发随机红包
        if(false == $this->isCanBuilder())
        {
            return array($leftMoney,$data);  
        }
        
        //红包剩余是0
        if(0 == $leftMoney)
        {
            return array($leftMoney,$data);  
        }
 
        //数组为空
        if(count($data) < 1)
        {
            return array($leftMoney,$data);  
        }
 
        //如果是可以有剩余，并且$leftMoney > 0
        if('Can_Left' == $this->formatType
          && $leftMoney > 0)
        {
            return array($leftMoney,$data);  
        }
 
 
        //我的峰值
        $myMax = $this->maxMoney;
 
        // 如果还有余钱，则尝试加到小红包里，如果加不进去，则尝试下一个。
        while($leftMoney > 0)
        {
            $found = 0;
            foreach($data as $key => $val) 
            {
                //减少循环优化
                if($leftMoney <= 0)
                {
                    break;
                }
 
                //预判
                $afterLeftMoney =  (double)$leftMoney - 0.01;
                $afterVal = (double)$val + 0.01;
                if( $afterLeftMoney >= 0  && $afterVal <= $myMax)
                {
                    $found = 1;
                    $data[$key] = number_format($afterVal,2,'.','');
                    $leftMoney = $afterLeftMoney;
                    //精度
                    $leftMoney = number_format($leftMoney,2,'.','');
                }
            }
 
            //如果没有可以加的红包，需要结束,否则死循环
            if($found == 0)
            {
                break;
            }
        }
        //如果$leftMoney < 0 ,说明生成的红包超过预算了，需要减少部分红包金额
        while($leftMoney < 0)
        {
            $found = 0;
            foreach($data as $key => $val) 
            {
                if($leftMoney >= 0)
                {
                    break; 
                }
                //预判
                
                $afterLeftMoney =  (double)$leftMoney + 0.01;
                $afterVal = (double)$val - 0.01;
                if( $afterLeftMoney <= 0 && $afterVal >= $this->minMoney)
                {
                    $found = 1;
                    $data[$key] = number_format($afterVal,2,'.','');
                    $leftMoney = $afterLeftMoney;
                    $leftMoney = number_format($leftMoney,2,'.','');
                }
            }
            
            //如果一个减少的红包都没有的话，需要结束，否则死循环
            if($found == 0)
            {
                break;
            }
        }
        return array($leftMoney,$data);  
    }
}
 
//维护策略的环境类
class RedPackageBuilder
{
 
    // 实例  
    protected static $_instance = null;  
 
    /** 
     * Singleton instance（获取自己的实例） 
     * 
     * @return MemcacheOperate 
     */  
    public static function getInstance()
    {  
        if (null === self::$_instance) 
        {  
            self::$_instance = new self();  
        }  
        return self::$_instance;  
    }  
 
    /** 
     * 获取策略【使用反射】
     * 
     * @param string $type 类型 
     * @return void 
     */  
    public function getBuilderStrategy($type)
    {
        switch ($type) {
            case 'Equal':
                    return new EqualPackageStrategy();
                break;
            case 'RandTriangle':
                    return new RandTrianglePackageStrategy();
                break;
            default:
                    return '错误！';
                break;
        }
    }  
 
    public function getRedPackageByDTO(OptionDTO $optionDTO)
    {
        //获取策略
        $builderStrategy = $this->getBuilderStrategy($optionDTO->builderStrategy);

        //设置参数
        $builderStrategy->setOption($optionDTO);

        return $builderStrategy->create();
    }
}
 
class RedPackage
{
    public static function create($totalMoney,$num,$rangeStart,$rangEnd,$builderStrategy,$randFormatType = 'No_Left')
    {
        switch ($builderStrategy) {
            case 'Equal':
            //固定红包
                $dto = OptionDTO::create($totalMoney,$num,$rangeStart,$rangEnd,'Equal');
                $data = RedPackageBuilder::getInstance()->getRedPackageByDTO($dto);
                break;
            case 'RandTriangle':
            //随机红包[修数据]
                $dto = OptionDTO::create($totalMoney,$num,$rangeStart,$rangEnd,'RandTriangle');
                $data = RedPackageBuilder::getInstance()->getRedPackageByDTO($dto);
                break;
            case 'RandTriangleCanLeft':
            //随机红包[修数据]
                $dto = OptionDTO::create($totalMoney,$num,$rangeStart,$rangEnd,'RandTriangle','Can_Left');
                $data = RedPackageBuilder::getInstance()->getRedPackageByDTO($dto);
                break;
            default:
                $data = '错误！';
                break;
        }

        return $data;
    }
}