<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\Helper;
use App\Builder\Forms\Controls\ID;
use App\Builder\Forms\Controls\Input;
use App\Builder\Forms\Controls\Text;
use App\Builder\Forms\Controls\TextArea;
use App\Builder\Forms\Controls\InputNumber;
use App\Builder\Forms\Controls\Checkbox;
use App\Builder\Forms\Controls\Radio;
use App\Builder\Forms\Controls\Select;
use App\Builder\Forms\Controls\SwitchButton;
use App\Builder\Forms\Controls\DatePicker;
use App\Builder\Forms\Controls\RangePicker;
use App\Builder\Forms\Controls\Editor;
use App\Builder\Forms\Controls\Image;
use App\Builder\Forms\Controls\File;
use App\Builder\Forms\Controls\Button;
use App\Builder\Forms\Controls\Popconfirm;
use App\Builder\Forms\Controls\Area;
use App\Builder\Forms\Controls\Map;
use App\Builder\Forms\Controls\SearchInput;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use App\Builder\Tabs;
use App\Builder\TabPane;
use App\Models\Goods;
use App\Models\GoodsCategory;
use App\Models\GoodsType;
use App\Models\GoodsAttribute;
use App\Models\GoodsAttributeValue;
use App\Models\GoodsAttributeAlia;
use App\Models\GoodsCategoryAttribute;
use App\Models\GoodsInfoAttributeValue;
use App\Models\GoodsBrand;
use App\Models\GoodsUnit;
use App\Models\GoodsLayout;
use App\Models\GoodsSku;
use App\Models\Shop;

class GoodsController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '商品';
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function index(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');
            
        // 定义对象
        $query = Goods::query();

        // 查询
        if(!empty($search)) {

            // 用户名
            if(isset($search['goods_name'])) {
                $query->where('goods_name','like','%'.$search['goods_name'].'%');
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $searchs = [
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','goods_name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('商品封面','cover_id')->isImage(),
            Column::make('商品名称','goods_name')->withA('admin/mall/'.$this->controllerName().'/edit'),
            Column::make('商品标签','tags'),
            Column::make('售价','goods_price'),
            Column::make('库存','stock_num'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('发布时间','created_at'),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/'.$this->controllerName().'/create'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/changeStatus'),
            Button::make('编辑')->type('link')->href('admin/mall/'.$this->controllerName().'/edit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/changeStatus'),
        ];

        foreach ($lists as $key => $value) {
            $lists[$key]['cover_id'] = Helper::getPicture($value['cover_id']);
        }

        $lists = Helper::listsFormat($lists);

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {

        $categorys = GoodsCategory::where('status',1)
        ->select('goods_categories.id','goods_categories.pid','goods_categories.title as label','goods_categories.id as value')
        ->get()
        ->toArray();

        $categoryTrees = Helper::listToTree($categorys,'id','pid','children',0);

        $shops = Shop::where('status',1)
        ->select('id','title')
        ->get()
        ->toArray();

        $goodsUnits = GoodsUnit::where('status',1)
        ->select('id','name')
        ->get()
        ->toArray();

        $goodsBrands = GoodsBrand::where('status',1)
        ->select('id','name')
        ->get()
        ->toArray();

        $topLayouts = GoodsLayout::where('status',1)
        ->where('position',1)
        ->select('id','layout_name')
        ->get()
        ->toArray();

        $bottomLayouts = GoodsLayout::where('status',1)
        ->where('position',2)
        ->select('id','layout_name')
        ->get()
        ->toArray();

        $packingLayouts = GoodsLayout::where('status',1)
        ->where('position',3)
        ->select('id','layout_name')
        ->get()
        ->toArray();

        $serviceLayouts = GoodsLayout::where('status',1)
        ->where('position',4)
        ->select('id','layout_name')
        ->get()
        ->toArray();

        // 模板数据
        $data['categorys'] = $categoryTrees;
        $data['shops'] = $shops;
        $data['goodsUnits'] = $goodsUnits;
        $data['goodsBrands'] = $goodsBrands;
        $data['topLayouts'] = $topLayouts;
        $data['bottomLayouts'] = $bottomLayouts;
        $data['packingLayouts'] = $packingLayouts;
        $data['serviceLayouts'] = $serviceLayouts;

        return $this->success('获取成功！','',$data);
    }

    /**
     * 根据分类获取商品属性
     * 
     * @param  Request  $request
     * @return Response
     */
    public function attribute(Request $request)
    {
        $categoryId  =   $request->get('categoryId','');
        $shopId      =   $request->get('shopId','');

        $systemSpus = GoodsAttribute::join('goods_category_attributes', 'goods_category_attributes.goods_attribute_id', '=', 'goods_attributes.id')
        ->where('goods_category_attributes.goods_category_id',$categoryId)
        ->where('goods_category_attributes.type',1)
        ->orderBy('goods_attributes.sort','asc')
        ->select('goods_attributes.id','goods_attributes.name','goods_attributes.style')
        ->get()
        ->toArray();

        foreach($systemSpus as $key => $systemSpu)
        {
            $systemSpuVnames = GoodsAttributeValue::where('goods_attribute_id',$systemSpu['id'])
            ->orderBy('sort','asc')
            ->get()
            ->toArray();

            $systemSpus[$key]['vname'] = $systemSpuVnames;
        }

        $shopSpus = GoodsAttribute::where('type',1)
        ->where('shop_id',$shopId)
        ->orderBy('sort','asc')
        ->get()
        ->toArray();

        foreach($shopSpus as $key => $shopSpu)
        {
            $shopSpuVnames = GoodsAttributeValue::where('goods_attribute_id',$shopSpu['id'])
            ->orderBy('sort','asc')
            ->get()
            ->toArray();

            $shopSpus[$key]['vname'] = $shopSpuVnames;
        }

        $skus = GoodsAttribute::join('goods_category_attributes', 'goods_category_attributes.goods_attribute_id', '=', 'goods_attributes.id')
        ->where('goods_category_attributes.type',2)
        ->whereRaw('(goods_category_attributes.goods_category_id = ? or goods_attributes.shop_id = ?)', [$categoryId, $shopId])
        ->orderBy('goods_attributes.sort','asc')
        ->select('goods_attributes.id','goods_attributes.name','goods_attributes.style')
        ->get()
        ->toArray();


        foreach($skus as $key => $sku)
        {
            $skuVnames = GoodsAttributeValue::where('goods_attribute_id',$sku['id'])
            ->orderBy('sort','asc')
            ->get()
            ->toArray();

            $skus[$key]['vname'] = $skuVnames;
        }

        // 模板数据
        $data['systemSpus'] = $systemSpus;
        $data['shopSpus'] = $shopSpus;
        $data['skus'] = $skus;

        return $this->success('获取成功！','',$data);
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $requestJson    =   $request->getContent();
        $requestData    =   json_decode($requestJson,true);

        $shopId                    =   $request->json('shop_id'); // 所属商家
        $goodsCategoryId           =   $request->json('goods_category_id'); // 商品分类
        $goodsMode                 =   $request->json('goods_mode',''); // 商品类别
        $otherCategoryIds          =   $request->json('other_category_ids',0); // 扩展分类
        $goodsName                 =   $request->json('goods_name'); // 商品名称
        $keywords                  =   $request->json('keywords'); // 关键词
        $description               =   $request->json('description',''); // 商品买点
        $pricingMode               =   $request->json('pricing_mode'); // 计价方式
        $goodsUnitId               =   $request->json('goods_unit_id',''); // 商品单位
        $goodsBrandId              =   $request->json('goods_brand_id',''); // 商品品牌
        $shopSpuNames              =   $request->json('shop_spu_names'); // 店铺自定义属性名称
        $shopSpuValues             =   $request->json('shop_spu_values'); // 店铺自定义属性值
        $skuValues                 =   $request->json('sku_values'); // 商品规格
        $goodsMoq                  =   $request->json('goods_moq'); // 最小起订量
        $goodsPrice                =   $request->json('goods_price'); // 店铺价
        $marketPrice               =   $request->json('market_price'); // 市场价
        $costPrice                 =   $request->json('cost_price'); // 成本价
        $stockNum                  =   $request->json('stock_num'); // 库存
        $warnNum                   =   $request->json('warn_num'); // 库存警告数量
        $goodsSn                   =   $request->json('goods_sn'); // 商品货号
        $goodsBarcode              =   $request->json('goods_barcode'); // 商品条形码
        $goodsStockcode            =   $request->json('goods_stockcode'); // 商品库位码
        $coverId                   =   $request->json('cover_id'); // 上传商品默认主图，无规格主图时展示该图
        $videoId                   =   $request->json('video_id'); // 主图视频
        $pcContent                 =   $request->json('pc_content'); // 电脑端商品详情
        $mobileContent             =   $request->json('mobile_content'); // 手机端商品详情
        $topLayoutId               =   $request->json('top_layout_id'); // 详情页顶部模板
        $bottomLayoutId            =   $request->json('bottom_layout_id'); // 详情页底部模板
        $packingLayoutId           =   $request->json('packing_layout_id'); // 详情页包装清单版式
        $serviceLayoutId           =   $request->json('service_layout_id'); // 详情页售后保证版式
        $goodsWeight               =   $request->json('goods_weight'); // 物流重量，商品的重量单位为千克，如果商品的运费模板按照重量计算请填写此项，为空则默认商品重量为0Kg；
        $goodsVolume               =   $request->json('goods_volume'); // 商品的体积单位为立方米，如果商品的运费模板按照体积计算请填写此项，为空则默认商品体积为0立方米；
        $goodsFreightType          =   $request->json('goods_freight_type'); // 运费类型 0：店铺承担运费 ，1：运费模板
        $freightId                 =   $request->json('freight_id'); // 运费模板id
        $effectiveType             =   $request->json('effective_type'); // 当商品为电子卡券类型商品时，兑换生效期类型：1付款完成立即生效，2付款完成N小时后生效,3付款完成次日生效
        $effectiveHour             =   $request->json('effective_hour'); // 当商品为电子卡券类型商品时，兑换生效期类型为付款完成N小时后生效，例如：12，为12小时候生效
        $validPeriodType           =   $request->json('valid_period_type'); // 当商品为电子卡券类型商品时，使用有效期类型：1长期有效，2具有明确截止时间例如2019-01-01到2019-01-31，3自购买之日起，N小时内有效,4自购买之日起，N天内有效
        $addTimeBegin              =   $request->json('add_time_begin'); // 当商品为电子卡券类型商品时，使用有效期类型为2具有明确截止时间时，开始时间
        $addTimeEnd                =   $request->json('add_time_end'); // 当商品为电子卡券类型商品时，使用有效期类型为2具有明确截止时间时，结束时间
        $validPeriodHour           =   $request->json('valid_period_hour'); // 当商品为电子卡券类型商品时，使用有效期类型为3自购买之日起，N小时内有效
        $validPeriodDay            =   $request->json('valid_period_day'); // 当商品为电子卡券类型商品时，使用有效期类型为4自购买之日起，N天内有效
        $isExpiredRefund           =   $request->json('is_expired_refund'); // 当商品为电子卡券类型商品时，是否支持过期退款
        $stockMode                 =   $request->json('stock_mode'); // 库存计数：1拍下减库存，2付款减库存，3出库减库存 拍下减库存：买家拍下商品即减少库存，存在恶拍风险。热销商品如需避免超卖可选此方式
        $status                    =   $request->json('status'); // 1出售中，2审核中，3已下架，4商品违规下架
        
        if(empty($shopId)) {
            return $this->error('请选择所属商家！');
        }

        if(empty($goodsCategoryId)) {
            return $this->error('请选择所属分类！');
        }

        if(empty($goodsName)) {
            return $this->error('请填写商品名称！');
        }

        if(empty($skuValues)) {
            if(empty($goodsPrice)) {
                return $this->error('请填写店铺价！');
            }
            if(empty($stockNum)) {
                return $this->error('请填写商品库存！');
            }
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2;
        }

        $data['shop_id'] = $shopId;
        $data['goods_category_id'] = $goodsCategoryId[count($goodsCategoryId)-1];
        $data['goods_mode'] = $goodsMode;
        $data['keywords'] = $keywords;
        $data['description'] = $description;
        $data['pricing_mode'] = $pricingMode;
        $data['goods_unit_id'] = $goodsUnitId;
        $data['goods_brand_id'] = $goodsBrandId;
        $data['goods_moq'] = $goodsMoq;
        $data['goods_price'] = $goodsPrice;
        $data['market_price'] = $marketPrice;
        $data['cost_price'] = $costPrice;
        $data['stock_num'] = $stockNum;
        $data['warn_num'] = $warnNum;
        $data['goods_sn'] = $goodsSn;
        $data['goods_barcode'] = $goodsBarcode;

        if($coverId) {
            $data['cover_id'] = $coverId[0]['id'];
        }

        if($videoId) {
            $data['video_id'] = $videoId[0]['id'];
        }

        $data['pc_content'] = $pcContent;
        $data['mobile_content'] = $mobileContent;
        $data['top_layout_id'] = $topLayoutId;
        $data['bottom_layout_id'] = $bottomLayoutId;
        $data['packing_layout_id'] = $packingLayoutId;
        $data['service_layout_id'] = $serviceLayoutId;
        $data['goods_weight'] = $goodsWeight;
        $data['goods_volume'] = $goodsVolume;
        $data['goods_freight_type'] = $goodsFreightType;
        $data['freight_id'] = $freightId;
        $data['effective_type'] = $effectiveType;
        $data['effective_hour'] = $effectiveHour;
        $data['valid_period_type'] = $validPeriodType;
        $data['add_time_begin'] = $addTimeBegin;
        $data['add_time_end'] = $addTimeEnd;
        $data['valid_period_hour'] = $validPeriodHour;
        $data['valid_period_day'] = $validPeriodDay;
        $data['is_expired_refund'] = $isExpiredRefund;
        $data['stock_mode'] = $stockMode;
        $data['status'] = $status;

        if(!empty($skuValues)) {
            $data['is_sku'] = 1;
        } else {
            $data['is_sku'] = 0;
        }

        // 添加商品sku
        if(!empty($skuValues)) {
            foreach($skuValues as $key => $value) {

                if(empty($value['stock_num'])) {
                    return $this->error('请填写库存！');
                }

                if(empty($value['goods_price'])) {
                    return $this->error('请填写商品价格！');
                }
            }
        }

        // 启动事务
        DB::beginTransaction();
        try {

            foreach($requestData as $key => $value) {
                if(strpos($key,'system_spu_') !== false) {
                    // 平台系统属性
                    $attrId = str_replace("system_spu_","",$key);
                    $systemSpus[] = ['attr_id' => $attrId,'attr_vid' => $value];
                }
            }

            // 平台系统属性
            $data['goods_attrs'] = json_encode($systemSpus);

            // "other_attr_name":"产地","other_attr_value":"唐山",
            foreach($shopSpuNames as $key => $shopSpuName) {
                $shopSpus[] = ['other_attr_name' => $shopSpuName,'other_attr_value' => $shopSpuValues[$key]];
            }

            // 商家自定义属性
            $data['other_attrs'] = json_encode($shopSpus);

            $result = Goods::create($data);

            foreach($requestData as $key => $value) {
                if(strpos($key,'system_spu_') !== false) {
                    // 平台系统属性
                    $attrId = str_replace("system_spu_","",$key);

                    // 添加平台系统属性spu
                    $data1['goods_id'] = $result->id;
                    $data1['goods_attribute_id'] = $attrId;
                    $data1['goods_attribute_value_id'] = json_encode($value);
                    $data1['type'] = 1;

                    $result1 = GoodsInfoAttributeValue::create($data1);
                }
            }

            // 添加商品sku
            if(!empty($skuValues)) {
                $data2['goods_id'] = $result->id;
                $data2['shop_id'] = $shopId;

                $properties = '';
                $propertyName = '';

                foreach($skuValues as $key => $value) {

                    foreach($value as $key1 => $value1) {
                        if(strpos($key1,'sku_') !== false) {

                            $arr = explode(';',$value1);
                            $skuName = explode(':',$arr[1])[1];
                            $skuValueName = explode(':',$arr[3])[1];

                            $properties = $properties.','.$skuValueName;
                            $propertyName = $propertyName.','.$skuName;
                        }
                    }

                    $data2['properties'] = $properties;
                    $data2['property_name'] = $propertyName;
                    $data2['stock_num'] = $value['stock_num'];
                    $data2['goods_price'] = $value['goods_price'];
                    $data2['market_price'] = $value['market_price'];
                    $data2['goods_sn'] = $value['goods_sn'];
                    $data2['goods_barcode'] = $value['goods_barcode'];

                    if(empty($data2['stock_num'])) {
                        return $this->error('请填写库存！');
                    }

                    if(empty($data2['goods_price'])) {
                        return $this->error('请填写商品价格！');
                    }

                    $result2 = GoodsSku::create($data2);

                    foreach($value as $key1 => $value1) {
                        if(strpos($key1,'sku_') !== false) {

                            $arr = explode(';',$value1);
                            $skuId = explode(':',$arr[0])[1];
                            $skuName = explode(':',$arr[1])[1];
                            $skuValueId = explode(':',$arr[2])[1];
                            $skuValueName = explode(':',$arr[3])[1];

                            // 添加规格sku
                            $data3['goods_id'] = $result->id;
                            $data3['goods_sku_id'] = $result2->id;
                            $data3['goods_attribute_id'] = $skuId;
                            $data3['goods_attribute_value_id'] = $skuValueId;
                            $data3['type'] = 2;
                            GoodsInfoAttributeValue::create($data3);
                        }
                    }
                }
            }

             // 提交事务
            DB::commit();	
        } catch (\Exception $e) {
            // 回滚事务

            DB::rollback();
        }

        if ($result) {
            return $this->success('操作成功！','/mall/goods/index');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function edit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $data = Goods::find($id)->toArray();

        $logo = $data['logo'];
        $coverIds = $data['cover_ids'];
        $businessLicenseCoverId = $data['business_license_cover_id'];
        $corporateIdcardCoverId = $data['corporate_idcard_cover_id'];

        unset($data['logo']);
        unset($data['cover_ids']);
        unset($data['business_license_cover_id']);
        unset($data['corporate_idcard_cover_id']);

        $data['logo'][0]['id'] =$logo;
        $data['logo'][0]['uid'] =$logo;
        $data['logo'][0]['name'] = Helper::getPicture($logo,'name');
        $data['logo'][0]['url'] = Helper::getPicture($logo);

        $data['cover_ids'] = json_decode($coverIds,true);

        $data['business_license_cover_id'][0]['id'] =$businessLicenseCoverId;
        $data['business_license_cover_id'][0]['uid'] =$businessLicenseCoverId;
        $data['business_license_cover_id'][0]['name'] = Helper::getPicture($businessLicenseCoverId,'name');
        $data['business_license_cover_id'][0]['url'] = Helper::getPicture($businessLicenseCoverId);

        $data['corporate_idcard_cover_id'][0]['id'] =$businessLicenseCoverId;
        $data['corporate_idcard_cover_id'][0]['uid'] =$businessLicenseCoverId;
        $data['corporate_idcard_cover_id'][0]['name'] = Helper::getPicture($businessLicenseCoverId,'name');
        $data['corporate_idcard_cover_id'][0]['url'] = Helper::getPicture($businessLicenseCoverId);

        $data['open_days'] = json_decode($data['open_days']);
        $data['open_times'] = json_decode($data['open_times']);

        $merchantInfo = Merchant::where('id',$data['mch_id'])->first();
        $data['uid'] = $merchantInfo['uid'];
        $data['bank_name'] = $merchantInfo['bank_name'];
        $data['bank_payee'] = $merchantInfo['bank_payee'];
        $data['bank_number'] = $merchantInfo['bank_number'];

        $position = [];

        if(in_array($data['position'], [1,3,5,7,9,15])) {
            $position[] = 1;
        }

        if(in_array($data['position'], [2,3,6,7,9,10,14,15])) {
            $position[] = 2;
        }

        if(in_array($data['position'], [4,5,6,7,12,13,14,15])) {
            $position[] = 4;
        }

        if(in_array($data['position'], [8,9,10,11,12,13,14,15])) {
            $position[] = 8;
        }

        $data['position'] = $position;
        
        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }

        $data = $this->form($data);

        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function save(Request $request)
    {
        $id                         =   $request->json('id');
        $title                      =   $request->json('title','');
        $logo                       =   $request->json('logo','');
        $uid                        =   $request->json('uid','');
        $categoryId                 =   $request->json('category_id',0);
        $tags                       =   $request->json('tags','');
        $description                =   $request->json('description');
        $content                    =   $request->json('content','');
        $coverIds                   =   $request->json('cover_ids');
        $level                      =   $request->json('level','');
        $position                   =   $request->json('position','');
        $username                   =   $request->json('username','');
        $phone                      =   $request->json('phone',0);
        $area                       =   $request->json('area');
        $address                    =   $request->json('address');
        $map                        =   $request->json('map');
        $businessLicenseCoverId     =   $request->json('business_license_cover_id');
        $corporateName              =   $request->json('corporate_name');
        $corporateIdcard            =   $request->json('corporate_idcard');
        $corporateIdcardCoverId     =   $request->json('corporate_idcard_cover_id');
        $comment                    =   $request->json('comment');
        $view                       =   $request->json('view');
        $commentStatus              =   $request->json('comment_status');
        $rate                       =   $request->json('rate');
        $openDays                   =   $request->json('open_days');
        $openTimes                  =   $request->json('open_times');
        $openStatus                 =   $request->json('open_status');
        $isSelf                     =   $request->json('is_self');
        $status                     =   $request->json('status');

        $bankName                  =   $request->json('bank_name');
        $bankPayee                 =   $request->json('bank_payee');
        $bankNumber                =   $request->json('bank_number');

        if(empty($title)) {
            return $this->error('商家名称不能为空！');
        }

        if(empty($logo)) {
            return $this->error('请上传logo！');
        }

        if(empty($uid)) {
            return $this->error('请选择绑定用户！');
        }

        if(empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if(empty($username)) {
            return $this->error('商家联系人不能为空！');
        }

        if(empty($phone)) {
            return $this->error('商家电话不能为空！');
        }

        $hasMerchant = Merchant::where('uid',$uid)->first();

        if(!empty($hasMerchant)) {
            $data['mch_id'] = $hasMerchant['id'];
            $merchantData['uid'] = $uid;
            $merchantData['bank_name'] = $bankName;
            $merchantData['bank_payee'] = $bankPayee;
            $merchantData['bank_number'] = $bankNumber;
            $merchantInfo = Merchant::where('id',$hasMerchant['id'])->update($merchantData);
        } else {
            $merchantData['uid'] = $uid;
            $merchantData['bank_name'] = $bankName;
            $merchantData['bank_payee'] = $bankPayee;
            $merchantData['bank_number'] = $bankNumber;
            $merchantInfo = Merchant::create($merchantData);
            $data['mch_id'] = $merchantInfo['id'];
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2;
        }

        if ($openStatus == true) {
            $openStatus = 1;
        } else {
            $openStatus = 2;
        }

        if ($commentStatus == true) {
            $commentStatus = 1;
        } else {
            $commentStatus = 2;
        }

        $data['title'] = $title;
        $data['logo'] = $logo[0]['id'];
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['description'] = $description;
        $data['content'] = $content;
        $data['cover_ids'] = json_encode($coverIds);
        $data['level'] = $level;
        $data['position'] = collect($position)->sum();
        $data['username'] = $username;
        $data['phone'] = $phone;
        $data['province'] = $area[0];
        $data['city'] = $area[1];
        $data['county'] = $area[2];
        $data['address'] = $address;

        if($map) {
            $maps = explode(',',$map);
            $data['longitude'] = $maps[0];
            $data['latitude'] = $maps[1];
        }

        if($businessLicenseCoverId) {
            $data['business_license_cover_id'] = $businessLicenseCoverId[0]['id'];
        }

        $data['corporate_name'] = $corporateName;
        $data['corporate_idcard'] = $corporateIdcard;

        if($corporateIdcardCoverId) {
            $data['corporate_idcard_cover_id'] = $corporateIdcardCoverId[0]['id'];
        }

        $data['comment_status'] = $commentStatus;
        $data['open_days'] = json_encode($openDays);

        $getOpenTimes = [date("H:i", strtotime($openTimes[0])),date("H:i", strtotime($openTimes[1]))];

        $data['open_times'] = json_encode($getOpenTimes);
        $data['open_status'] = $openStatus;
        $data['is_self'] = $isSelf;
        $data['status'] = $status;

        $result = Goods::where('id',$id)->update($data);

        if ($result) {
            return $this->success('操作成功！','/mall/shop/index');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = Goods::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryIndex(Request $request)
    {
        $this->pageTitle = '分类';
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search     = $request->get('search');
            
        // 定义对象
        $query = GoodsCategory::query();

        // 查询
        if(!empty($search)) {

            // 标题
            if(isset($search['title'])) {
                if(!empty($search['title'])) {
                    $query->where('title','like','%'.$search['title'].'%');
                }
            }

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('name',$search['name']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }
            
            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('goods_categories.*')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {
            $statue = $list['status'];
            if($statue == 1) {
                $lists[$key]['status'] = '正常';
            }
            if($statue == 2) {
                $lists[$key]['status'] = '已禁用';
            }
        }
        
        $categoryTrees = Helper::listToTree($lists,'id','pid','children',0);

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $searchs = [
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('标题','title')->withA('admin/mall/'.$this->controllerName().'/categoryEdit'),
            Column::make('排序','sort'),
            Column::make('名称','name'),
            Column::make('类型','type'),
            Column::make('分页数量','page_num'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('时间','created_at'),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/goods/categoryCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/categoryChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/categoryChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/categoryChangeStatus'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/categoryChangeStatus'),
            Button::make('编辑')->type('link')->href('admin/mall/goods/categoryEdit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/categoryChangeStatus'),
        ];

        $data = $this->listBuilder($columns,$categoryTrees,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function categoryCreate(Request $request)
    {
        $categorys         = GoodsCategory::where('status',1)->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
        $getCategorys = [];

        $getCategorys[0]['name'] = '请选择分类';
        $getCategorys[0]['value'] = '0';

        foreach ($categoryTreeLists as $key => $categoryTreeList) {
            $getCategorys[$key+1]['name'] = $categoryTreeList['title'];
            $getCategorys[$key+1]['value'] = $categoryTreeList['id'];
        }

        $goodsBrands = GoodsBrand::where('status',1)->select('id as key','name as title')->get();

        $data['categorys'] = $getCategorys;
        $data['goodsBrands'] = $goodsBrands;
        $data['goodsBrandSelectedKeys'] = [];

        $goodsTypes[0]['name'] = '请选择商品类型';
        $goodsTypes[0]['value'] = '0';

        $getGoodsTypes = GoodsType::where('status',1)->select('name','id as value')->get();

        foreach ($getGoodsTypes as $key => $getGoodsType) {
            $goodsTypes[$key+1]['name'] = $getGoodsType['name'];
            $goodsTypes[$key+1]['value'] = $getGoodsType['value'];
        }

        $data['goodsTypes'] = $goodsTypes;

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function categoryStore(Request $request)
    {
        $title          =   $request->json('title','');
        $name           =   $request->json('name');
        $description    =   $request->json('description');
        $sort           =   $request->json('sort');
        $pid            =   $request->json('pid');
        $coverId        =   $request->json('cover_id');
        $indexTpl       =   $request->json('index_tpl');
        $listsTpl       =   $request->json('lists_tpl');
        $detailTpl      =   $request->json('detail_tpl');
        $pageNum        =   $request->json('page_num');
        $status         =   $request->json('status');
        $brandIds       =   $request->json('brand_ids');

        $attributeSpuIds          =   $request->json('attribute_spu_ids');
        $attributeSpuSorts        =   $request->json('attribute_spu_sorts');
        $attributeSpuGroups       =   $request->json('attribute_spu_groups');

        $attributeSkuIds          =   $request->json('attribute_sku_ids');
        $attributeSkuSorts        =   $request->json('attribute_sku_sorts');
        $attributeSkuGroups       =   $request->json('attribute_sku_groups');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if (empty($pageNum)) {
            return $this->error('分页数量必须填写！');
        }

        $hasTitle = GoodsCategory::where('title',$title)->where('status',1)->first();

        if($hasTitle) {
            return $this->error('此分类标题已存在！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }
        
        if($coverId) {
            $coverId = $coverId[0]['id'];
        } else {
            $coverId = 0;
        }

        $data['title']          = $title;
        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['pid']            = $pid;
        $data['cover_id']       = $coverId;
        $data['index_tpl']      = $indexTpl;
        $data['lists_tpl']      = $listsTpl;
        $data['detail_tpl']     = $detailTpl;
        $data['page_num']       = $pageNum;
        $data['status']         = $status;
        $data['goods_brand_ids'] = json_encode($brandIds);

        $result = GoodsCategory::create($data);

        if($result) {
            if($attributeSpuIds) {
                foreach ($attributeSpuIds as $key => $attributeSpuId) {
                    $data1['goods_category_id'] = $result->id;
                    $data1['goods_attribute_id'] = $attributeSpuId;
                    $data1['gorup_name'] = $attributeSpuGroups[$key];
                    $data1['sort'] = $attributeSpuSorts[$key];
                    $data1['type'] = 1;
                    GoodsCategoryAttribute::create($data1);
                }
            }
            if($attributeSkuIds) {
                foreach ($attributeSkuIds as $key => $attributeSkuId) {
                    $data2['goods_category_id'] = $result->id;
                    $data2['goods_attribute_id'] = $attributeSkuId;
                    $data2['gorup_name'] = $attributeSkuGroups[$key];
                    $data2['sort'] = $attributeSkuSorts[$key];
                    $data2['type'] = 2;
                    GoodsCategoryAttribute::create($data2);
                }
            }
        }

        if($result) {
            return $this->success('操作成功！','categoryIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryEdit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $categorys         = GoodsCategory::where('status',1)->get()->toArray();
        $categoryTrees     = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees,0,'title');

        // 模板数据
        $getCategorys = [];

        $getCategorys[0]['name'] = '请选择分类';
        $getCategorys[0]['value'] = '0';

        foreach ($categoryTreeLists as $key => $categoryTreeList) {
            $getCategorys[$key+1]['name'] = $categoryTreeList['title'];
            $getCategorys[$key+1]['value'] = $categoryTreeList['id'];
        }

        $data = GoodsCategory::find($id)->toArray();

        $cover_id = $data['cover_id'];

        if($cover_id) {
            unset($data['cover_id']);
            $data['cover_id'][0]['id'] =$cover_id;
            $data['cover_id'][0]['uid'] =$cover_id;
            $data['cover_id'][0]['name'] = Helper::getPicture($cover_id,'name');
            $data['cover_id'][0]['url'] = Helper::getPicture($cover_id);
        }

        $goodsBrands = GoodsBrand::where('status',1)->select('id as key','name as title')->get();

        $data['categorys'] = $getCategorys;
        $data['goodsBrands'] = $goodsBrands;
        $data['goodsBrandSelectedKeys'] = json_decode($data['goods_brand_ids']);

        $goodsTypes[0]['name'] = '请选择商品类型';
        $goodsTypes[0]['value'] = '0';

        $getGoodsTypes = GoodsType::where('status',1)->select('name','id as value')->get();

        foreach ($getGoodsTypes as $key => $getGoodsType) {
            $goodsTypes[$key+1]['name'] = $getGoodsType['name'];
            $goodsTypes[$key+1]['value'] = $getGoodsType['value'];
        }

        $data['goodsTypes'] = $goodsTypes;

        $spuSelectedIds = GoodsCategoryAttribute::where('goods_category_id',$id)
        ->where('type',1)
        ->pluck('goods_attribute_id');
        $data['spuSelectedIds'] = $spuSelectedIds;

        $skuSelectedIds = GoodsCategoryAttribute::where('goods_category_id',$id)
        ->where('type',2)
        ->pluck('goods_attribute_id');
        $data['skuSelectedIds'] = $skuSelectedIds;

        // 定义对象
        $spuSelectedDatas = GoodsAttribute::whereIn('id', $spuSelectedIds)
        ->where('status', '>', 0)
        ->where('type', 1)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        $data['spuSelectedKeys'] = [];

        foreach ($spuSelectedDatas as $key => $spuSelectedData) {
            $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$spuSelectedData['id'])->pluck('vname')->toArray();
            $spuSelectedDatas[$key]['goods_attribute_values'] = implode(',',$goodsAttributeValues);
            $data['spuSelectedKeys'][] = $key;
        }

        $data['spuSelectedData'] = $spuSelectedDatas;

        // 定义对象
        $skuSelectedDatas = GoodsAttribute::whereIn('id', $skuSelectedIds)
        ->where('status', '>', 0)
        ->where('type', 2)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        $data['skuSelectedKeys'] = [];

        foreach ($skuSelectedDatas as $key => $skuSelectedData) {
            $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$skuSelectedData['id'])->pluck('vname')->toArray();
            $skuSelectedDatas[$key]['goods_attribute_values'] = implode(',',$goodsAttributeValues);
            $data['skuSelectedKeys'][] = $key;
        }

        $data['skuSelectedData'] = $skuSelectedDatas;

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }
        
        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function categorySave(Request $request)
    {
        $id             =   $request->json('id');
        $title          =   $request->json('title','');
        $name           =   $request->json('name');
        $description    =   $request->json('description');
        $sort           =   $request->json('sort');
        $pid            =   $request->json('pid');
        $coverId        =   $request->json('cover_id');
        $indexTpl       =   $request->json('index_tpl');
        $listsTpl       =   $request->json('lists_tpl');
        $detailTpl      =   $request->json('detail_tpl');
        $pageNum        =   $request->json('page_num');
        $status         =   $request->json('status');
        $brandIds       =   $request->json('brand_ids');

        $attributeSpuIds          =   $request->json('attribute_spu_ids');
        $attributeSpuSorts        =   $request->json('attribute_spu_sorts');
        $attributeSpuGroups       =   $request->json('attribute_spu_groups');

        $attributeSkuIds          =   $request->json('attribute_sku_ids');
        $attributeSkuSorts        =   $request->json('attribute_sku_sorts');
        $attributeSkuGroups       =   $request->json('attribute_sku_groups');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if (empty($pageNum)) {
            return $this->error('分页数量必须填写！');
        }

        $hasTitle = GoodsCategory::where('id','<>',$id)->where('title',$title)->where('status',1)->first();

        if($hasTitle) {
            return $this->error('此分类标题已存在！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }
        
        if($coverId) {
            $coverId = $coverId[0]['id'];
        } else {
            $coverId = 0;
        }

        $data['title']          = $title;
        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['pid']            = $pid;
        $data['cover_id']       = $coverId;
        $data['index_tpl']      = $indexTpl;
        $data['lists_tpl']      = $listsTpl;
        $data['detail_tpl']     = $detailTpl;
        $data['page_num']       = $pageNum;
        $data['status']         = $status;
        $data['goods_brand_ids'] = json_encode($brandIds);

        $result = GoodsCategory::where('id',$id)->update($data);

        if($result !== false) {
            GoodsCategoryAttribute::where('goods_category_id',$id)->delete();
            if($attributeSpuIds) {
                foreach ($attributeSpuIds as $key => $attributeSpuId) {
                    $data1['goods_category_id'] = $id;
                    $data1['goods_attribute_id'] = $attributeSpuId;
                    $data1['gorup_name'] = $attributeSpuGroups[$key];
                    $data1['sort'] = $attributeSpuSorts[$key];
                    $data1['type'] = 1;
                    GoodsCategoryAttribute::create($data1);
                }
            }
            if($attributeSkuIds) {
                foreach ($attributeSkuIds as $key => $attributeSkuId) {
                    $data2['goods_category_id'] = $id;
                    $data2['goods_attribute_id'] = $attributeSkuId;
                    $data2['gorup_name'] = $attributeSkuGroups[$key];
                    $data2['sort'] = $attributeSkuSorts[$key];
                    $data2['type'] = 2;
                    GoodsCategoryAttribute::create($data2);
                }
            }
        }

        if($result) {
            return $this->success('操作成功！','categoryIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryChangeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = GoodsCategory::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        if($status == -1) {
            
            // 查询此分类下是否有内容
            $hasShop = Goods::where('goods_category_id',$id)->where('status',1)->first();
            if($hasShop) {
                return $this->error('请先删除此分类下的内容！');
            }
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function typeIndex(Request $request)
    {
        $this->pageTitle = '商品类型';
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search     = $request->get('search');
            
        // 定义对象
        $query = GoodsType::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('name',$search['name']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {
            $statue = $list['status'];
            if($statue == 1) {
                $lists[$key]['status'] = '正常';
            }
            if($statue == 2) {
                $lists[$key]['status'] = '已禁用';
            }
        }

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $searchs = [
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('类型名称','name')->withA('admin/mall/'.$this->controllerName().'/typeEdit'),
            Column::make('类型描述','description'),
            Column::make('排序','sort'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/goods/typeCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/typeChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/typeChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/typeChangeStatus'),
        ];

        $actions = [
            Button::make('添加属性')->type('link')->href('admin/mall/goods/spuCreate')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('添加规格')->type('link')->href('admin/mall/goods/skuCreate')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('属性列表')->type('link')->href('admin/mall/goods/spuIndex')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('规格列表')->type('link')->href('admin/mall/goods/skuIndex')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/typeChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('编辑')->type('link')->href('admin/mall/goods/typeEdit')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/typeChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function typeForm($data = [])
    {
        $this->pageTitle = '商品类型';

        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/typeSave';
        } else {
            $action = 'admin/'.$this->controllerName().'/typeStore';
        }

        $controls = [
            ID::make('ID','id'),
            Input::make('类型名称','name')->style(['width'=>200]),
            TextArea::make('类型描述','description')->style(['width'=>400]),
            InputNumber::make('排序','sort')->style(['width'=>200])->value(0),
        ];

        $controls[] = SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true);
        $controls[] = Button::make('提交')
        ->type('primary')
        ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
        ->onClick('submit',null,$action);

        $result = $this->formBuilder($controls,$data);

        return $result;
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function typeCreate(Request $request)
    {
        $data = $this->typeForm();

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function typeStore(Request $request)
    {
        $name           =   $request->json('name');
        $description    =   $request->json('description');
        $sort           =   $request->json('sort');
        $status         =   $request->json('status');
        
        if (empty($name)) {
            return $this->error('类型名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['status']         = $status;

        $result = GoodsType::create($data);

        if($result) {
            return $this->success('操作成功！','typeIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function typeEdit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $data = GoodsType::find($id)->toArray();

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }

        $data = $this->typeForm($data);
        
        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function typeSave(Request $request)
    {
        $id             =   $request->json('id');
        $name           =   $request->json('name');
        $description    =   $request->json('description');
        $sort           =   $request->json('sort');
        $status         =   $request->json('status');
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['status']         = $status;

        $result = GoodsType::where('id',$id)->update($data);
        if ($result) {
            return $this->success('操作成功！','typeIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function typeChangeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = GoodsType::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function spuIndex(Request $request)
    {
        $this->pageTitle = '商品属性';
        // 获取参数
        $current            = intval($request->get('current',1));
        $pageSize           = intval($request->get('pageSize',10));
        $search             = $request->get('search');
        $spuSelectedIds     = $request->get('spuSelectedIds');
            
        // 定义对象
        $query = GoodsAttribute::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('goods_attributes.name',$search['name']);
                }
            }

            // 类型
            if(isset($search['goodsTypeId'])) {
                if(!empty($search['goodsTypeId'])) {
                    $query->where('goods_attributes.goods_type_id',$search['goodsTypeId']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('goods_attributes.status',$search['status']);
                }
            }
        }

        if(isset($spuSelectedIds)) {
            $query->whereNotIn('goods_attributes.id', $spuSelectedIds);
        }

        // 查询数量
        $total = $query
        ->where('goods_attributes.status', '>', 0)
        ->where('goods_attributes.type', 1)
        ->count();

        // 查询列表
        $lists = $query
        ->join('goods_types', 'goods_attributes.goods_type_id', '=', 'goods_types.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('goods_attributes.status', '>', 0)
        ->where('goods_attributes.type', 1)
        ->orderBy('goods_attributes.id', 'desc')
        ->select('goods_attributes.*','goods_types.name as goods_type_name')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {

            if($list['status'] == 1) {
                $lists[$key]['status'] = '正常';
            }

            if($list['status'] == 2) {
                $lists[$key]['status'] = '已禁用';
            }

            switch ($list['style']) {
                case 1:
                    $lists[$key]['style'] = '多选';
                    break;
                case 2:
                    $lists[$key]['style'] = '单选';
                    break;
                case 3:
                    $lists[$key]['style'] = '文本';
                    break;
                default:
                    $lists[$key]['style'] = '未知';
            }

            $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$list['id'])->pluck('vname')->toArray();

            $lists[$key]['goods_attribute_values'] = implode(',',$goodsAttributeValues);
        }

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $goodsTypes[0]['name'] = '请选择商品类型';
        $goodsTypes[0]['value'] = '0';

        $getGoodsTypes = GoodsType::where('status',1)->select('name','id as value')->get();

        foreach ($getGoodsTypes as $key => $getGoodsType) {
            $goodsTypes[$key+1]['name'] = $getGoodsType['name'];
            $goodsTypes[$key+1]['value'] = $getGoodsType['value'];
        }

        $searchs = [
            Select::make('商品类型','goodsTypeId')->option($goodsTypes)->value('0'),
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('属性名称','name')->withA('admin/mall/'.$this->controllerName().'/spuEdit'),
            Column::make('属性类型','goods_type_name'),
            Column::make('样式','style'),
            Column::make('属性值','goods_attribute_values'),
            Column::make('排序','sort'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/goods/spuCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/spuChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/spuChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/spuChangeStatus'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/spuChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('编辑')->type('link')->href('admin/mall/goods/spuEdit')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/spuChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function spuCreate(Request $request)
    {
        $id   =   $request->json('id');

        $data['goods_types'] = GoodsType::where('status',1)->get();

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function spuStore(Request $request)
    {
        $goodsTypeId            =   $request->json('goods_type_id');
        $name                   =   $request->json('name');
        $description            =   $request->json('description');
        $style                  =   $request->json('style');
        $attributeValues        =   $request->json('attribute_values');
        $attributeValuesSort    =   $request->json('attribute_values_sort');
        $sort                   =   $request->json('sort');
        $status                 =   $request->json('status');
        
        if (empty($goodsTypeId)) {
            return $this->error('请选择商品类型！');
        }

        if (empty($name)) {
            return $this->error('属性名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['goods_type_id']  = $goodsTypeId;
        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['status']         = $status;
        $data['style']          = $style;
        $data['type']           = 1;

        $result = GoodsAttribute::create($data);

        if(!empty($result) && !empty($attributeValues)) {
            foreach($attributeValues as $key => $attributeValue) {
                $data1['goods_attribute_id'] = $result->id;
                $data1['vname'] = $attributeValue;
                $data1['sort'] = $attributeValuesSort[$key];
                $result1 = GoodsAttributeValue::create($data1);
            }
        }

        if($result) {
            return $this->success('操作成功！','spuIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function spuEdit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $goodsAttribute = GoodsAttribute::find($id)->toArray();

        $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$goodsAttribute['id'])->get();

        $data['goods_attribute'] = $goodsAttribute;
        $data['goods_attribute_values'] = $goodsAttributeValues;
        $data['goods_types'] = GoodsType::where('status',1)->get();

        $data['keys'] = [];
        foreach($goodsAttributeValues as $key => $value) {
            $data['keys'][] = $key;
        }
        
        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function spuSave(Request $request)
    {
        $id                     =   $request->json('id');
        $goodsTypeId            =   $request->json('goods_type_id');
        $name                   =   $request->json('name');
        $description            =   $request->json('description');
        $style                  =   $request->json('style');
        $attributeValues        =   array_unique($request->json('attribute_values'));
        $attributeValuesSort    =   $request->json('attribute_values_sort');
        $sort                   =   $request->json('sort');
        $status                 =   $request->json('status');
        
        if (empty($id)) {
            return $this->error('参数错误！');
        }

        if (empty($goodsTypeId)) {
            return $this->error('请选择商品类型！');
        }

        if (empty($name)) {
            return $this->error('属性名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['goods_type_id']  = $goodsTypeId;
        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['status']         = $status;
        $data['style']          = $style;
        $data['type']           = 1;

        $result = GoodsAttribute::where('id',$id)->update($data);

        $hasAttributeValues = [];
        $hasAttributeIds = [];

        if($result!==false && !empty($attributeValues)) {

            $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$id)->get();
            
            foreach($goodsAttributeValues as $key => $goodsAttributeValue) {
                foreach($attributeValues as $key1 => $attributeValue) {
                    if($goodsAttributeValue['vname'] == $attributeValue) {

                        // 已存在的属性
                        unset($attributeValues[$key1]);

                        // 已存在的属性id
                        $hasAttributeIds[] = $goodsAttributeValue['id'];

                        $data1['sort'] = $attributeValuesSort[$key1];

                        // 更新数据
                        GoodsAttributeValue::where('id',$goodsAttributeValue['id'])->update($data1);
                    }
                }
            }

            GoodsAttributeValue::whereNotIn('id',$hasAttributeIds)
            ->where('goods_attribute_id',$id)
            ->delete();

            foreach($attributeValues as $key2 => $attributeValue) {
                if($attributeValue) {
                    $data2['goods_attribute_id'] = $id;
                    $data2['vname'] = $attributeValue;
                    $data2['sort'] = $attributeValuesSort[$key2];
                    $result1 = GoodsAttributeValue::create($data2);
                }
            }
        }

        if ($result!==false) {
            return $this->success('操作成功！','spuIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function spuChangeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = GoodsAttribute::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function skuIndex(Request $request)
    {
        $this->pageTitle = '商品规格';
        // 获取参数
        $current            = intval($request->get('current',1));
        $pageSize           = intval($request->get('pageSize',10));
        $search             = $request->get('search');
        $skuSelectedIds     = $request->get('skuSelectedIds');
            
        // 定义对象
        $query = GoodsAttribute::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('goods_attributes.name',$search['name']);
                }
            }

            // 类型
            if(isset($search['goodsTypeId'])) {
                if(!empty($search['goodsTypeId'])) {
                    $query->where('goods_attributes.goods_type_id',$search['goodsTypeId']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('goods_attributes.status',$search['status']);
                }
            }
        }

        if(isset($skuSelectedIds)) {
            $query->whereNotIn('goods_attributes.id', $skuSelectedIds);
        }

        // 查询数量
        $total = $query
        ->where('goods_attributes.status', '>', 0)
        ->where('goods_attributes.type', 2)
        ->count();

        // 查询列表
        $lists = $query
        ->join('goods_types', 'goods_attributes.goods_type_id', '=', 'goods_types.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('goods_attributes.status', '>', 0)
        ->where('goods_attributes.type', 2)
        ->orderBy('goods_attributes.id', 'desc')
        ->select('goods_attributes.*','goods_types.name as goods_type_name')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {

            if($list['status'] == 1) {
                $lists[$key]['status'] = '正常';
            }

            if($list['status'] == 2) {
                $lists[$key]['status'] = '已禁用';
            }

            switch ($list['style']) {
                case 1:
                    $lists[$key]['style'] = '多选';
                    break;
                case 2:
                    $lists[$key]['style'] = '单选';
                    break;
                case 3:
                    $lists[$key]['style'] = '文本';
                    break;
                default:
                    $lists[$key]['style'] = '未知';
            }

            $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$list['id'])->pluck('vname')->toArray();

            $lists[$key]['goods_attribute_values'] = implode(',',$goodsAttributeValues);
        }

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $goodsTypes[0]['name'] = '请选择商品类型';
        $goodsTypes[0]['value'] = '0';

        $getGoodsTypes = GoodsType::where('status',1)->select('name','id as value')->get();

        foreach ($getGoodsTypes as $key => $getGoodsType) {
            $goodsTypes[$key+1]['name'] = $getGoodsType['name'];
            $goodsTypes[$key+1]['value'] = $getGoodsType['value'];
        }

        $searchs = [
            Select::make('商品类型','goodsTypeId')->option($goodsTypes)->value('0'),
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('规格名称','name')->withA('admin/mall/'.$this->controllerName().'/skuEdit'),
            Column::make('规格类型','goods_type_name'),
            Column::make('样式','style'),
            Column::make('规格值','goods_attribute_values'),
            Column::make('排序','sort'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/goods/skuCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/skuChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/skuChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/skuChangeStatus'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/skuChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('编辑')->type('link')->href('admin/mall/goods/skuEdit')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/skuChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function skuCreate(Request $request)
    {
        $id   =   $request->json('id');

        $data['goods_types'] = GoodsType::where('status',1)->get();

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function skuStore(Request $request)
    {
        $goodsTypeId            =   $request->json('goods_type_id');
        $name                   =   $request->json('name');
        $description            =   $request->json('description');
        $style                  =   $request->json('style');
        $attributeValues        =   $request->json('attribute_values');
        $attributeValuesSort    =   $request->json('attribute_values_sort');
        $sort                   =   $request->json('sort');
        $status                 =   $request->json('status');
        
        if (empty($goodsTypeId)) {
            return $this->error('请选择商品类型！');
        }

        if (empty($name)) {
            return $this->error('属性名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['goods_type_id']  = $goodsTypeId;
        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['status']         = $status;
        $data['style']          = $style;
        $data['type']           = 2;

        $result = GoodsAttribute::create($data);

        if(!empty($result) && !empty($attributeValues)) {
            foreach($attributeValues as $key => $attributeValue) {
                $data1['goods_attribute_id'] = $result->id;
                $data1['vname'] = $attributeValue;
                $data1['sort'] = $attributeValuesSort[$key];
                $result1 = GoodsAttributeValue::create($data1);
            }
        }

        if($result) {
            return $this->success('操作成功！','skuIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function skuEdit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $goodsAttribute = GoodsAttribute::find($id)->toArray();

        $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$goodsAttribute['id'])->get();

        $data['goods_attribute'] = $goodsAttribute;
        $data['goods_attribute_values'] = $goodsAttributeValues;
        $data['goods_types'] = GoodsType::where('status',1)->get();

        $data['keys'] = [];
        foreach($goodsAttributeValues as $key => $value) {
            $data['keys'][] = $key;
        }
        
        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function skuSave(Request $request)
    {
        $id                     =   $request->json('id');
        $goodsTypeId            =   $request->json('goods_type_id');
        $name                   =   $request->json('name');
        $description            =   $request->json('description');
        $style                  =   $request->json('style');
        $attributeValues        =   array_unique($request->json('attribute_values'));
        $attributeValuesSort    =   $request->json('attribute_values_sort');
        $sort                   =   $request->json('sort');
        $status                 =   $request->json('status');
        
        if (empty($id)) {
            return $this->error('参数错误！');
        }

        if (empty($goodsTypeId)) {
            return $this->error('请选择商品类型！');
        }

        if (empty($name)) {
            return $this->error('属性名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['goods_type_id']  = $goodsTypeId;
        $data['name']           = $name;
        $data['description']    = $description;
        $data['sort']           = $sort;
        $data['status']         = $status;
        $data['style']          = $style;
        $data['type']           = 2;

        $result = GoodsAttribute::where('id',$id)->update($data);

        $hasAttributeValues = [];
        $hasAttributeIds = [];

        if($result!==false && !empty($attributeValues)) {

            $goodsAttributeValues = GoodsAttributeValue::where('goods_attribute_id',$id)->get();
            
            foreach($goodsAttributeValues as $key => $goodsAttributeValue) {
                foreach($attributeValues as $key1 => $attributeValue) {
                    if($goodsAttributeValue['vname'] == $attributeValue) {

                        // 已存在的属性
                        unset($attributeValues[$key1]);

                        // 已存在的属性id
                        $hasAttributeIds[] = $goodsAttributeValue['id'];

                        $data1['sort'] = $attributeValuesSort[$key1];

                        // 更新数据
                        GoodsAttributeValue::where('id',$goodsAttributeValue['id'])->update($data1);
                    }
                }
            }

            GoodsAttributeValue::whereNotIn('id',$hasAttributeIds)
            ->where('goods_attribute_id',$id)
            ->delete();

            foreach($attributeValues as $key2 => $attributeValue) {
                if($attributeValue) {
                    $data2['goods_attribute_id'] = $id;
                    $data2['vname'] = $attributeValue;
                    $data2['sort'] = $attributeValuesSort[$key2];
                    $result1 = GoodsAttributeValue::create($data2);
                }
            }
        }

        if ($result!==false) {
            return $this->success('操作成功！','skuIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function skuChangeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = GoodsAttribute::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function unitIndex(Request $request)
    {
        $this->pageTitle = '商品单位';
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search     = $request->get('search');
            
        // 定义对象
        $query = GoodsUnit::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['name'])) {
                if(!empty($search['name'])) {
                    $query->where('name',$search['name']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {
            $statue = $list['status'];
            if($statue == 1) {
                $lists[$key]['status'] = '正常';
            }
            if($statue == 2) {
                $lists[$key]['status'] = '已禁用';
            }
        }

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $searchs = [
            Select::make('状态','status')->option($status)->value('0'),
            Input::make('搜索内容','name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('单位名称','name')->withA('admin/mall/'.$this->controllerName().'/unitEdit'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/goods/unitCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/unitChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/unitChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/unitChangeStatus'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/unitChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('编辑')->type('link')->href('admin/mall/goods/unitEdit')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/unitChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function unitForm($data = [])
    {
        $this->pageTitle = '商品单位';

        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/unitSave';
        } else {
            $action = 'admin/'.$this->controllerName().'/unitStore';
        }

        $controls = [
            ID::make('ID','id'),
            Input::make('单位名称','name')->style(['width'=>200]),
        ];

        $controls[] = SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true);
        $controls[] = Button::make('提交')
        ->type('primary')
        ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
        ->onClick('submit',null,$action);

        $result = $this->formBuilder($controls,$data);

        return $result;
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function unitCreate(Request $request)
    {
        $data = $this->unitForm();

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function unitStore(Request $request)
    {
        $name           =   $request->json('name');
        $status         =   $request->json('status');
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name']           = $name;
        $data['status']         = $status;

        $result = GoodsUnit::create($data);

        if($result) {
            return $this->success('操作成功！','unitIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function unitEdit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $data = GoodsUnit::find($id)->toArray();

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }

        $data = $this->unitForm($data);
        
        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function unitSave(Request $request)
    {
        $id             =   $request->json('id');
        $name           =   $request->json('name');
        $status         =   $request->json('status');
        
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['name']           = $name;
        $data['status']         = $status;

        $result = GoodsUnit::where('id',$id)->update($data);
        if ($result) {
            return $this->success('操作成功！','unitIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function unitChangeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = GoodsUnit::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 列表页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function layoutIndex(Request $request)
    {
        $this->pageTitle = '详情版式';
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search     = $request->get('search');
            
        // 定义对象
        $query = GoodsLayout::query();

        // 查询
        if(!empty($search)) {

            // 名称
            if(isset($search['layout_name'])) {
                if(!empty($search['layout_name'])) {
                    $query->where('layout_name',$search['name']);
                }
            }

            // 状态
            if(isset($search['status']) && $search['status'] !=0) {
                if(!empty($search['status'])) {
                    $query->where('status',$search['status']);
                }
            }

            // 位置
            if(isset($search['position']) && $search['position'] !=0) {
                if(!empty($search['position'])) {
                    $query->where('position',$search['position']);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('status', '>', 0)
        ->orderBy('id', 'desc')
        ->get()
        ->toArray();

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        foreach ($lists as $key => $list) {
            $statue = $list['status'];
            if($statue == 1) {
                $lists[$key]['status'] = '正常';
            }
            if($statue == 2) {
                $lists[$key]['status'] = '已禁用';
            }

            switch ($list['position']) {
                case 1:
                    $lists[$key]['position'] = '详情顶部';
                    break;
                case 2:
                    $lists[$key]['position'] = '详情底部';
                    break;
                case 3:
                    $lists[$key]['position'] = '包装清单';
                    break;
                case 4:
                    $lists[$key]['position'] = '售后保障';
                    break;
                default:
                    $lists[$key]['position'] = '未知';
                    break;
            }
        }

        $status = [
            [
                'name'=>'所有状态',
                'value'=>'0',
            ],
            [
                'name'=>'正常',
                'value'=>'1',
            ],
            [
                'name'=>'禁用',
                'value'=>'2',
            ],
        ];

        $positions = [
            [
                'name'=>'所有位置',
                'value'=>'0',
            ],
            [
                'name'=>'详情顶部',
                'value'=>'1',
            ],
            [
                'name'=>'详情底部',
                'value'=>'2',
            ],
            [
                'name'=>'包装清单',
                'value'=>'3',
            ],
            [
                'name'=>'售后保障',
                'value'=>'4',
            ],
        ];

        $searchs = [
            Select::make('状态','status')->option($status)->value('0'),
            Select::make('位置','position')->option($positions)->value('0'),
            Input::make('搜索内容','layout_name'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('版式名称','layout_name')->withA('admin/mall/'.$this->controllerName().'/layoutEdit'),
            Column::make('模板位置','position'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/goods/layoutCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/layoutChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/layoutChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/layoutChangeStatus'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/layoutChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Button::make('编辑')->type('link')->href('admin/mall/goods/layoutEdit')->style(['paddingLeft'=>5,'paddingRight'=>5]),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/layoutChangeStatus')->style(['paddingLeft'=>5,'paddingRight'=>5]),
        ];

        $data = $this->listBuilder($columns,$lists,$pagination,$searchs,[],$headerButtons,null,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function layoutForm($data = [])
    {
        $this->pageTitle = '详情版式';

        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/layoutSave';
        } else {
            $action = 'admin/'.$this->controllerName().'/layoutStore';
        }

        $radioList = [
            [
                'name'=>'详情顶部',
                'value'=>'1',
            ],
            [
                'name'=>'详情底部',
                'value'=>'2',
            ],
            [
                'name'=>'包装清单',
                'value'=>'3',
            ],
            [
                'name'=>'售后保障',
                'value'=>'4',
            ],
        ];

        $controls = [
            ID::make('ID','id'),
            Input::make('版式名称','layout_name')->style(['width'=>200]),
            Radio::make('模板位置','position')->list($radioList)->value('1'),
            Editor::make('内容','content'),
        ];

        $controls[] = SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true);
        $controls[] = Button::make('提交')
        ->type('primary')
        ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
        ->onClick('submit',null,$action);

        $result = $this->formBuilder($controls,$data);

        return $result;
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function layoutCreate(Request $request)
    {
        $data = $this->layoutForm();

        if(!empty($data)) {
            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 保存方法
     * 
     * @param  Request  $request
     * @return Response
     */
    public function layoutStore(Request $request)
    {
        $layoutName     =   $request->json('layout_name');
        $position       =   $request->json('position');
        $content        =   $request->json('content');
        $status         =   $request->json('status');
        
        if (empty($layoutName)) {
            return $this->error('名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['layout_name']    = $layoutName;
        $data['position']       = $position;
        $data['content']        = $content;
        $data['status']         = $status;

        $result = GoodsLayout::create($data);

        if($result) {
            return $this->success('操作成功！','layoutIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 编辑页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function layoutEdit(Request $request)
    {
        $id = $request->get('id');

        if(empty($id)) {
            return $this->error('参数错误！');
        }

        $data = GoodsLayout::find($id)->toArray();

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }

        $data = $this->layoutForm($data);
        
        if(!empty($data)) {
            return $this->success('操作成功！','',$data);
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function layoutSave(Request $request)
    {
        $id             =   $request->json('id');
        $layoutName     =   $request->json('layout_name');
        $position       =   $request->json('position');
        $content        =   $request->json('content');
        $status         =   $request->json('status');
        
        if (empty($layoutName)) {
            return $this->error('名称必须填写！');
        }

        if ($status == true) {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['layout_name']           = $layoutName;
        $data['position']       = $position;
        $data['content']        = $content;
        $data['status']         = $status;

        $result = GoodsLayout::where('id',$id)->update($data);
        if ($result) {
            return $this->success('操作成功！','layoutIndex');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function layoutChangeStatus(Request $request)
    {
        $id = $request->json('id');
        $status = $request->json('status');

        if(empty($id) || empty($status)) {
            return $this->error('参数错误！');
        }

        // 定义对象
        $query = GoodsLayout::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        $result = $query->update(['status'=>$status]);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }
}
