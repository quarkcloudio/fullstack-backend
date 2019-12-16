<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
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
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use App\Services\Helper;
use EasyWeChat\Factory;
use App\Models\Goods;
use App\Models\Category;
use App\Models\Order;
use App\Models\GoodsOrder;
use App\Models\GoodsOrderDetail;
use App\Models\GoodsOrderStatusRecord;
use App\Models\GoodsOrderDelivery;
use App\Models\GoodsOrderDeliveryDetail;
use App\Models\GoodsExpress;
use App\User;
use DB;

class GoodsOrderController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '订单列表';
    }

    /**
     * 订单列表页
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
        $query = Order::join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('users', 'users.id', '=', 'orders.uid')
        ->where('goods_mode',1);

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $title = "%{$search['title']}%";
                $query->whereRaw('(users.username like ? or users.phone like ? or orders.order_no like ?)', [$title, $title, $title]);
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status']) && $search['status'] != 'ALL') {
                    $query->where('goods_orders.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('orders.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }

            // 付款方式
            if(isset($search['payType'])) {
                if(!empty($search['payType'])) {
                    $query->where('orders.pay_type',$search['payType']);
                }
            }

            // 订单类型
            if(isset($search['type'])) {
                if(!empty($search['type'])) {
                    $query->where('orders.type',$search['type']);
                }
            }

            // 收货人姓名
            if(isset($search['consignee'])) {
                if(!empty($search['consignee'])) {
                    $query->where('goods_orders.consignee',$search['consignee']);
                }
            }

            // 收货人手机号
            if(isset($search['phone'])) {
                if(!empty($search['phone'])) {
                    $query->where('goods_orders.phone',$search['phone']);
                }
            }

            // 收货人地址
            if(isset($search['address'])) {
                if(!empty($search['address'])) {
                    $query->where('goods_orders.address','like','%'.$search['address'].'%');;
                }
            }
        }

        // 查询数量
        $total = $query->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('orders.id', 'desc')
        ->select(
            'orders.*',
            'goods_orders.total_amount',
            'goods_orders.buyer_pay_amount',
            'goods_orders.point_amount',
            'goods_orders.mdiscount_amount',
            'goods_orders.discount_amount',
            'goods_orders.freight_amount',
            'goods_orders.consignee_name',
            'goods_orders.consignee_address',
            'goods_orders.consignee_phone',
            'goods_orders.status as goods_order_status',
            'users.username',
            'users.nickname',
            'users.phone'
        )
        ->get();

        foreach ($lists as $key => $value) {

            $goodsOrderDetail = [];
            foreach ($value->goodsOrderDetail as $key1 => $value1) {
                $goodsOrderDetail[$key1]['cover_id'] = Helper::getPicture($value1['cover_id']);
                $goodsOrderDetail[$key1]['goods_id'] = $value1['goods_id'];
                $goodsOrderDetail[$key1]['goods_name'] = $value1['goods_name'];
                $goodsOrderDetail[$key1]['goods_price'] = $value1['goods_price'];
                $goodsOrderDetail[$key1]['num'] = $value1['num'];
                $goodsOrderDetail[$key1]['goods_property_names'] = $value1['goods_property_names'];
                $goodsOrderDetail[$key1]['description'] = $value1['description'];
            }

            $lists[$key]['goods_order_details'] = $goodsOrderDetail;

            // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
            switch ($value['goods_order_status']) {
                case 'NOT_PAID':
                    $lists[$key]['goods_order_status'] = '等待付款';
                    break;

                case 'PAID':
                    $lists[$key]['goods_order_status'] = '待发货';
                    break;

                case 'SEND':
                    $lists[$key]['goods_order_status'] = '已发货';
                    break;

                case 'SUCCESS':
                    $lists[$key]['goods_order_status'] = '交易成功';
                    break;

                case 'REFUND':
                    $lists[$key]['goods_order_status'] = '转入退款';
                    break;

                case 'CLOSED':
                    $lists[$key]['goods_order_status'] = '交易关闭';
                    break;

                default:
                    $lists[$key]['goods_order_status'] = '未知';
                    break;
            }

            // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
            switch ($value['status']) {
                case 'NOT_PAID':
                    $lists[$key]['status'] = '未支付';
                    break;

                case 'SUCCESS':
                    $lists[$key]['status'] = '支付成功';
                    break;

                case 'REFUND':
                    $lists[$key]['status'] = '转入退款';
                    break;

                case 'CLOSED':
                    $lists[$key]['status'] = '交易关闭';
                    break;

                case 'PAY_ERROR':
                    $lists[$key]['status'] = '支付失败';
                    break;

                default:
                    $lists[$key]['status'] = '未知';
                    break;
            }

            // WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI
            switch ($value['pay_type']) {
                case 'WECHAT_APP':
                    $lists[$key]['pay_type'] = '微信APP支付，';
                    break;
                case 'WECHAT_JSAPI':
                    $lists[$key]['pay_type'] = '微信公众号支付';
                    break;
                case 'WECHAT_NATIVE':
                    $lists[$key]['pay_type'] = '微信电脑网站支付';
                    break;
                case 'ALIPAY_PAGE':
                    $lists[$key]['pay_type'] = '支付宝电脑网站支付';
                    break;
                case 'ALIPAY_APP':
                    $lists[$key]['pay_type'] = '支付宝APP支付';
                    break;
                case 'ALIPAY_WAP':
                    $lists[$key]['pay_type'] = '支付宝手机网站支付';
                    break;
                case 'ALIPAY_F2F':
                    $lists[$key]['pay_type'] = '支付宝当面付';
                    break;
                case 'ALIPAY_JS':
                    $lists[$key]['pay_type'] = '支付宝JSAPI';
                    break;
                default:
                    $lists[$key]['pay_type'] = '暂无';
                    break;
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        // NOT_PAID:等待买家付款;PAY_PENDING:付款确认中;PAID:买家已付款;SEND:卖家已发货;SUCCESS:交易成功;CLOSED:交易关闭;REFUND:退款中的订单
        $totalNum = GoodsOrder::where('goods_mode',1)->count();
        $notPaidNum = GoodsOrder::where('goods_mode',1)->where('status','NOT_PAID')->count();
        $paidNum = GoodsOrder::where('goods_mode',1)->where('status','PAID')->count();
        $sendNum = GoodsOrder::where('goods_mode',1)->where('status','SEND')->count();
        $successNum = GoodsOrder::where('goods_mode',1)->where('status','SUCCESS')->count();
        $closeNum = GoodsOrder::where('goods_mode',1)->where('status','CLOSE')->count();
        $refundNum = GoodsOrder::where('goods_mode',1)->where('status','REFUND')->count();

        $data['totalNum'] = $totalNum ? $totalNum : 0;
        $data['notPaidNum'] = $notPaidNum ? $notPaidNum : 0;
        $data['paidNum'] = $paidNum ? $paidNum : 0;
        $data['sendNum'] = $sendNum ? $sendNum : 0;
        $data['successNum'] = $successNum ? $successNum : 0;
        $data['closeNum'] = $closeNum ? $closeNum : 0;
        $data['refundNum'] = $refundNum ? $refundNum : 0;

        $data['totalMoney'] = GoodsOrder::where('goods_mode',1)->where('status','SUCCESS')->sum('total_amount');

        $data['search'] = $search;

        $q['search'] = $search;
        $q['token'] = Helper::token($request);

        $exportUrl = url('api/admin/'.$this->controllerName().'/export?'.http_build_query($q));
        $data['exportUrl'] = $exportUrl;

        if(!empty($lists)) {

            $data['lists'] = $lists;
            $data['pagination'] = $pagination;

            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }   
    }

    /**
     * 订单详情
     *
     * @param  Request  $request
     * @return Response
     */
    public function info(Request $request)
    {
        $id = $request->input('id');

        // 定义对象
        $order = Order::join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('shops', 'goods_orders.shop_id', '=', 'shops.id')
        ->join('users', 'users.id', '=', 'orders.uid')
        ->where('goods_mode',1)
        ->where('orders.id',$id)
        ->select(
            'orders.*',
            'goods_orders.total_amount',
            'goods_orders.buyer_pay_amount',
            'goods_orders.point_amount',
            'goods_orders.mdiscount_amount',
            'goods_orders.discount_amount',
            'goods_orders.freight_amount',
            'goods_orders.consignee_name',
            'goods_orders.consignee_address',
            'goods_orders.consignee_phone',
            'goods_orders.status as goods_order_status',
            'goods_orders.remark',
            'goods_orders.timeout_receipt',
            'goods_orders.close_type',
            'goods_orders.close_reason',
            'users.username',
            'users.nickname',
            'users.phone',
            'shops.title as shop_title'
        )->first();

        // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
        switch ($order['goods_order_status']) {
            case 'NOT_PAID':
                $order['goods_order_status_title'] = '等待付款';
                break;

            case 'PAID':
                $order['goods_order_status_title'] = '待发货';
                break;

            case 'SEND':
                $order['goods_order_status_title'] = '已发货';
                break;

            case 'SUCCESS':
                $order['goods_order_status_title'] = '交易成功';
                break;

            case 'REFUND':
                $order['goods_order_status_title'] = '转入退款';
                break;

            case 'CLOSED':
                $order['goods_order_status_title'] = '交易关闭';
                break;

            default:
                $order['goods_order_status_title'] = '未知';
                break;
        }

        // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
        switch ($order['status']) {
            case 'NOT_PAID':
                $order['status'] = '未支付';
                break;

            case 'SUCCESS':
                $order['status'] = '支付成功';
                break;

            case 'REFUND':
                $order['status'] = '转入退款';
                break;

            case 'CLOSED':
                $order['status'] = '交易关闭';
                break;

            case 'PAY_ERROR':
                $order['status'] = '支付失败';
                break;

            default:
                $order['status'] = '未知';
                break;
        }

        // WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI
        switch ($order['pay_type']) {
            case 'WECHAT_APP':
                $order['pay_type'] = '微信APP支付，';
                break;
            case 'WECHAT_JSAPI':
                $order['pay_type'] = '微信公众号支付';
                break;
            case 'WECHAT_NATIVE':
                $order['pay_type'] = '微信电脑网站支付';
                break;
            case 'ALIPAY_PAGE':
                $order['pay_type'] = '支付宝电脑网站支付';
                break;
            case 'ALIPAY_APP':
                $order['pay_type'] = '支付宝APP支付';
                break;
            case 'ALIPAY_WAP':
                $order['pay_type'] = '支付宝手机网站支付';
                break;
            case 'ALIPAY_F2F':
                $order['pay_type'] = '支付宝当面付';
                break;
            case 'ALIPAY_JS':
                $order['pay_type'] = '支付宝JSAPI';
                break;
            default:
                $order['pay_type'] = '暂无';
                break;
        }
        
        switch ($order['close_type']) {
            case '1':
                $order['close_type'] = '买家取消订单';
                break;

            case '2':
                $order['close_type'] = '卖家取消订单';
                break;

            case '3':
                $order['close_type'] = '订单超时未支付';
                break;
            default:
                $order['close_type'] = '未知';
                break;
        }

        $goodsOrderDetail = [];
        foreach ($order->goodsOrderDetail as $key => $value) {
            $goodsOrderDetail[$key]['cover_id'] = Helper::getPicture($value['cover_id']);
            $goodsOrderDetail[$key]['goods_id'] = $value['goods_id'];
            $goodsOrderDetail[$key]['goods_name'] = $value['goods_name'];
            $goodsOrderDetail[$key]['goods_price'] = $value['goods_price'];
            $goodsOrderDetail[$key]['num'] = $value['num'];
            $goodsOrderDetail[$key]['goods_property_names'] = $value['goods_property_names'];
            $goodsOrderDetail[$key]['description'] = $value['description'];
            $goodsInfo = Goods::where('id',$value['goods_id'])->first();
            $goodsOrderDetail[$key]['stock_num'] = $goodsInfo['stock_num'];
            $goodsOrderDetail[$key]['service_status'] = '正常';
            $goodsOrderDetail[$key]['status'] = $order['goods_order_status_title'];
        }

        $order['goods_order_details'] = $goodsOrderDetail;

        $order['goodsOrderStatusRecords'] = GoodsOrderStatusRecord::where('order_id',$order['id'])->orderBy('created_at','asc')->get()->toArray();

        $order['goodsOrderStatusRecordCount'] = count($order['goodsOrderStatusRecords']);

        $goodsOrderStatusRecordInfo = GoodsOrderStatusRecord::where('order_id',$order['id'])
        ->where('status','NOT_PAID')
        ->first();

        if($goodsOrderStatusRecordInfo) {
            $goodsOrderStatusRecordInfo = $goodsOrderStatusRecordInfo->toArray();
            $order['create_time'] = $goodsOrderStatusRecordInfo['created_at'];
        } else {
            $order['create_time'] = '';
        }

        $goodsOrderStatusRecordInfo1 = GoodsOrderStatusRecord::where('order_id',$order['id'])
        ->where('status','PAID')
        ->first();

        if($goodsOrderStatusRecordInfo1) {
            $goodsOrderStatusRecordInfo1 = $goodsOrderStatusRecordInfo1->toArray();
            $order['pay_time'] = $goodsOrderStatusRecordInfo1['created_at'];
        } else {
            $order['pay_time'] = '';
        }

        $goodsOrderStatusRecordInfo2 = GoodsOrderStatusRecord::where('order_id',$order['id'])
        ->where('status','SEND')
        ->first();

        if($goodsOrderStatusRecordInfo2) {
            $goodsOrderStatusRecordInfo2 = $goodsOrderStatusRecordInfo2->toArray();
            $order['send_time'] = $goodsOrderStatusRecordInfo2['created_at'];
        } else {
            $order['send_time'] = '';
        }

        $goodsOrderStatusRecordInfo3 = GoodsOrderStatusRecord::where('order_id',$order['id'])
        ->where('status','SUCCESS')
        ->first();

        if($goodsOrderStatusRecordInfo3) {
            $goodsOrderStatusRecordInfo3 = $goodsOrderStatusRecordInfo3->toArray();
            $order['finish_time'] = $goodsOrderStatusRecordInfo3['created_at'];
        } else {
            $order['finish_time'] = '';
        }

        // 自动确认收货截止时间
        $order['timeout_receipt'] = date($order['paid_at'],strtotime($order['timeout_receipt']));

        // 发货单信息
        $goodsOrderDeliveries = GoodsOrderDelivery::where('order_id',$order['id'])
        ->get()
        ->toArray();

        foreach ($goodsOrderDeliveries as $key => $value) {

            $goodsExpress = GoodsExpress::where('id',$value['goods_express_id'])->where('status',1)->first();

            $goodsOrderDeliveries[$key]['express_name'] = $goodsExpress['name'];

            $goodsOrderDetailIds = GoodsOrderDeliveryDetail::where('goods_order_delivery_id',$value['id'])
            ->pluck('goods_order_detail_id')
            ->toArray();

            $goodsOrderDeliveries[$key]['goodsOrderDetails'] = GoodsOrderDetail::whereIn('id',$goodsOrderDetailIds)
            ->get()
            ->toArray();
        }

        $order['goodsOrderDeliveries'] = $goodsOrderDeliveries;

        return $this->success('获取成功！','',$order);
    }

    /**
     * 一键发货
     *
     * @param  Request  $request
     * @return Response
     */
    public function quickDelivery(Request $request)
    {
        $id = $request->input('id');

        // 定义对象
        $order = Order::join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('shops', 'goods_orders.shop_id', '=', 'shops.id')
        ->join('users', 'users.id', '=', 'orders.uid')
        ->where('goods_mode',1)
        ->where('orders.id',$id)
        ->select(
            'orders.*',
            'goods_orders.total_amount',
            'goods_orders.buyer_pay_amount',
            'goods_orders.point_amount',
            'goods_orders.mdiscount_amount',
            'goods_orders.discount_amount',
            'goods_orders.freight_amount',
            'goods_orders.consignee_name',
            'goods_orders.consignee_address',
            'goods_orders.consignee_phone',
            'goods_orders.status as goods_order_status',
            'goods_orders.remark',
            'goods_orders.timeout_receipt',
            'goods_orders.close_type',
            'goods_orders.close_reason',
            'users.username',
            'users.nickname',
            'users.phone',
            'shops.title as shop_title'
        )->first();

        // WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI
        switch ($order['pay_type']) {
            case 'WECHAT_APP':
                $order['pay_type'] = '微信APP支付';
                break;
            case 'WECHAT_JSAPI':
                $order['pay_type'] = '微信公众号支付';
                break;
            case 'WECHAT_NATIVE':
                $order['pay_type'] = '微信电脑网站支付';
                break;
            case 'ALIPAY_PAGE':
                $order['pay_type'] = '支付宝电脑网站支付';
                break;
            case 'ALIPAY_APP':
                $order['pay_type'] = '支付宝APP支付';
                break;
            case 'ALIPAY_WAP':
                $order['pay_type'] = '支付宝手机网站支付';
                break;
            case 'ALIPAY_F2F':
                $order['pay_type'] = '支付宝当面付';
                break;
            case 'ALIPAY_JS':
                $order['pay_type'] = '支付宝JSAPI';
                break;
            default:
                $order['pay_type'] = '暂无';
                break;
        }

        $goodsOrderDetail = [];
        foreach ($order->goodsOrderDetail as $key => $value) {
            $goodsOrderDetail[$key]['cover_id'] = Helper::getPicture($value['cover_id']);
            $goodsOrderDetail[$key]['goods_id'] = $value['goods_id'];
            $goodsOrderDetail[$key]['goods_name'] = $value['goods_name'];
            $goodsOrderDetail[$key]['goods_price'] = $value['goods_price'];
            $goodsOrderDetail[$key]['num'] = $value['num'];
            $goodsOrderDetail[$key]['goods_property_names'] = $value['goods_property_names'];
            $goodsOrderDetail[$key]['description'] = $value['description'];
            $goodsInfo = Goods::where('id',$value['goods_id'])->first();
            $goodsOrderDetail[$key]['stock_num'] = $goodsInfo['stock_num'];
            $goodsOrderDetail[$key]['service_status'] = '正常';
            $goodsOrderDetail[$key]['status'] = $order['goods_order_status_title'];
        }

        $order['goods_order_details'] = $goodsOrderDetail;

        $order['goodsExpresses'] = GoodsExpress::where('status',1)
        ->get()
        ->toArray();

        return $this->success('获取成功！','',$order);
    }

    /**
     * 执行发货
     *
     * @param  Request  $request
     * @return Response
     */
    public function send(Request $request)
    {
        $orderId = $request->input('order_id');
        $expressType = $request->input('express_type');
        $expressId = $request->input('express_id');
        $expressNo = $request->input('express_no');

        if(empty($orderId)) {
            return $this->error('参数错误');
        }

        if($expressType == 2) {
            if(empty($expressId)) {
                return $this->error('请选择快递公司');
            }

            if(empty($expressNo)) {
                return $this->error('请填写快递单号');
            }
        }

        // 定义对象
        $order = Order::join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('shops', 'goods_orders.shop_id', '=', 'shops.id')
        ->join('users', 'users.id', '=', 'orders.uid')
        ->where('goods_mode',1)
        ->where('orders.id',$orderId)
        ->select(
            'orders.*',
            'goods_orders.id as goods_order_id',
            'goods_orders.total_amount',
            'goods_orders.buyer_pay_amount',
            'goods_orders.point_amount',
            'goods_orders.mdiscount_amount',
            'goods_orders.discount_amount',
            'goods_orders.freight_amount',
            'goods_orders.consignee_name',
            'goods_orders.consignee_address',
            'goods_orders.consignee_phone',
            'goods_orders.status as goods_order_status',
            'goods_orders.remark',
            'goods_orders.timeout_receipt',
            'goods_orders.close_type',
            'goods_orders.close_reason',
            'users.username',
            'users.nickname',
            'users.phone',
            'shops.title as shop_title'
        )->first();

        $goodsOrderDetails = GoodsOrderDetail::where('goods_order_id',$order['goods_order_id'])
        ->get()
        ->toArray();

        $data['order_id'] = $orderId;
        $data['goods_order_id'] = $order['goods_order_id'];
        $data['delivery_no'] = Helper::createOrderNo();
        $data['express_type'] = $expressType;
        $data['goods_express_id'] = $expressId;
        $data['express_no'] = $expressNo;
        $data['express_send_at'] = date('Y-m-d H:i:s');
        $data['status'] = 2;

        // 创建发货单
        $result = GoodsOrderDelivery::create($data);

        if($result) {
            foreach ($goodsOrderDetails as $key => $value) {
                $data1['order_id'] = $orderId;
                $data1['goods_order_id'] = $order['goods_order_id'];
                $data1['goods_order_delivery_id'] = $result['id'];
                $data1['goods_order_detail_id'] = $value['id'];
                $data1['num'] = $value['num'];
                GoodsOrderDeliveryDetail::create($data1);
            }

            GoodsOrder::where('id',$order['goods_order_id'])->update(['status'=>'SEND']);

            $data2['order_id'] = $orderId;
            $data2['goods_order_id'] = $order['goods_order_id'];
            $data2['status'] = 'SEND';

            GoodsOrderStatusRecord::create($data2);
        }

        return $this->success('获取成功！','',$order);
    }

    /**
     * 虚拟订单列表页
     * @param  Request  $request
     * @return Response
     */
    public function virtualOrderIndex(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');

        // 定义对象
        $query = Order::join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('users', 'users.id', '=', 'orders.uid')
        ->where('goods_mode',2);

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $title = "%{$search['title']}%";
                $query->whereRaw('(users.username like ? or users.phone like ? or orders.order_no like ?)', [$title, $title, $title]);
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status']) && $search['status'] != 'ALL') {
                    $query->where('goods_orders.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('orders.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }

            // 付款方式
            if(isset($search['payType'])) {
                if(!empty($search['payType'])) {
                    $query->where('orders.pay_type',$search['payType']);
                }
            }

            // 订单类型
            if(isset($search['type'])) {
                if(!empty($search['type'])) {
                    $query->where('orders.type',$search['type']);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('orders.id', 'desc')
        ->select(
            'orders.*',
            'goods_orders.total_amount',
            'goods_orders.buyer_pay_amount',
            'goods_orders.point_amount',
            'goods_orders.mdiscount_amount',
            'goods_orders.discount_amount',
            'goods_orders.freight_amount',
            'goods_orders.status as goods_order_status',
            'users.username',
            'users.nickname',
            'users.phone'
        )
        ->get();

        foreach ($lists as $key => $value) {

            $goodsOrderDetail = [];
            foreach ($value->goodsOrderDetail as $key1 => $value1) {
                $goodsOrderDetail[$key1]['cover_id'] = Helper::getPicture($value1['cover_id']);
                $goodsOrderDetail[$key1]['goods_id'] = $value1['goods_id'];
                $goodsOrderDetail[$key1]['goods_name'] = $value1['goods_name'];
                $goodsOrderDetail[$key1]['goods_price'] = $value1['goods_price'];
                $goodsOrderDetail[$key1]['num'] = $value1['num'];
                $goodsOrderDetail[$key1]['goods_property_names'] = $value1['goods_property_names'];
                $goodsOrderDetail[$key1]['description'] = $value1['description'];
            }

            $lists[$key]['goods_order_details'] = $goodsOrderDetail;

            // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
            switch ($value['goods_order_status']) {
                case 'NOT_PAID':
                    $lists[$key]['goods_order_status'] = '等待付款';
                    break;

                case 'PAID':
                    $lists[$key]['goods_order_status'] = '待核验';
                    break;

                case 'SUCCESS':
                    $lists[$key]['goods_order_status'] = '交易成功';
                    break;

                case 'REFUND':
                    $lists[$key]['goods_order_status'] = '转入退款';
                    break;

                case 'CLOSED':
                    $lists[$key]['goods_order_status'] = '交易关闭';
                    break;

                default:
                    $lists[$key]['goods_order_status'] = '未知';
                    break;
            }

            // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
            switch ($value['status']) {
                case 'NOT_PAID':
                    $lists[$key]['status'] = '未支付';
                    break;

                case 'SUCCESS':
                    $lists[$key]['status'] = '支付成功';
                    break;

                case 'REFUND':
                    $lists[$key]['status'] = '转入退款';
                    break;

                case 'CLOSED':
                    $lists[$key]['status'] = '交易关闭';
                    break;

                case 'PAY_ERROR':
                    $lists[$key]['status'] = '支付失败';
                    break;

                default:
                    $lists[$key]['status'] = '未知';
                    break;
            }

            // WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI
            switch ($value['pay_type']) {
                case 'WECHAT_APP':
                    $lists[$key]['pay_type'] = '微信APP支付，';
                    break;
                case 'WECHAT_JSAPI':
                    $lists[$key]['pay_type'] = '微信公众号支付';
                    break;
                case 'WECHAT_NATIVE':
                    $lists[$key]['pay_type'] = '微信电脑网站支付';
                    break;
                case 'ALIPAY_PAGE':
                    $lists[$key]['pay_type'] = '支付宝电脑网站支付';
                    break;
                case 'ALIPAY_APP':
                    $lists[$key]['pay_type'] = '支付宝APP支付';
                    break;
                case 'ALIPAY_WAP':
                    $lists[$key]['pay_type'] = '支付宝手机网站支付';
                    break;
                case 'ALIPAY_F2F':
                    $lists[$key]['pay_type'] = '支付宝当面付';
                    break;
                case 'ALIPAY_JS':
                    $lists[$key]['pay_type'] = '支付宝JSAPI';
                    break;
                default:
                    $lists[$key]['pay_type'] = '暂无';
                    break;
            }
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        // NOT_PAID:等待买家付款;PAY_PENDING:付款确认中;PAID:买家已付款;SEND:卖家已发货;SUCCESS:交易成功;CLOSED:交易关闭;REFUND:退款中的订单
        $totalNum = GoodsOrder::where('goods_mode',2)->count();
        $notPaidNum = GoodsOrder::where('goods_mode',2)->where('status','NOT_PAID')->count();
        $paidNum = GoodsOrder::where('goods_mode',2)->where('status','PAID')->count();
        $sendNum = GoodsOrder::where('goods_mode',2)->where('status','SEND')->count();
        $successNum = GoodsOrder::where('goods_mode',2)->where('status','SUCCESS')->count();
        $closeNum = GoodsOrder::where('goods_mode',2)->where('status','CLOSE')->count();
        $refundNum = GoodsOrder::where('goods_mode',2)->where('status','REFUND')->count();

        $data['totalNum'] = $totalNum ? $totalNum : 0;
        $data['notPaidNum'] = $notPaidNum ? $notPaidNum : 0;
        $data['paidNum'] = $paidNum ? $paidNum : 0;
        $data['sendNum'] = $sendNum ? $sendNum : 0;
        $data['successNum'] = $successNum ? $successNum : 0;
        $data['closeNum'] = $closeNum ? $closeNum : 0;
        $data['refundNum'] = $refundNum ? $refundNum : 0;

        $data['totalMoney'] = GoodsOrder::where('goods_mode',2)->where('status','SUCCESS')->sum('total_amount');

        $data['search'] = $search;

        $q['search'] = $search;
        $q['token'] = Helper::token($request);

        $exportUrl = url('api/admin/'.$this->controllerName().'/export?'.http_build_query($q));
        $data['exportUrl'] = $exportUrl;

        if(!empty($lists)) {

            $data['lists'] = $lists;
            $data['pagination'] = $pagination;

            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 发货单列表
     *
     * @param  Request  $request
     * @return Response
     */
    public function deliveryIndex(Request $request)
    {
        // 获取参数
        $current   = intval($request->get('current',1));
        $pageSize  = intval($request->get('pageSize',10));
        $search    = $request->get('search');

        // 定义对象
        $query = GoodsOrderDelivery::join('orders', 'orders.id', '=', 'goods_order_deliveries.order_id')
        ->join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('users', 'users.id', '=', 'orders.uid');

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $title = "%{$search['title']}%";
                $query->whereRaw('(users.username like ? or goods_order_deliveries.delivery_no like ? or orders.order_no like ?)', [$title, $title, $title]);
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status']) && $search['status'] != 'ALL') {
                    $query->where('goods_order_deliveries.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('goods_order_deliveries.express_send_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }

            // 物流类型
            if(isset($search['expressType'])) {
                if(!empty($search['expressType'])) {
                    $query->where('goods_order_deliveries.express_type',$search['expressType']);
                }
            }
        }

        // 查询数量
        $total = $query->count();

        // 查询列表
        $lists = $query
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->orderBy('id', 'desc')
        ->select(
            'goods_order_deliveries.*',
            'orders.order_no',
            'orders.paid_at',
            'goods_orders.consignee_name',
            'goods_orders.consignee_phone',
            'goods_orders.consignee_province',
            'goods_orders.consignee_city',
            'goods_orders.consignee_county',
            'goods_orders.consignee_address',
            'users.username',
            'users.nickname',
            'users.phone'
        )->get();

        foreach ($lists as $key => $value) {

            $goodsOrderDetailIds = GoodsOrderDeliveryDetail::where('goods_order_delivery_id',$value['id'])
            ->pluck('goods_order_detail_id')
            ->toArray();

            $lists[$key]['goods_order_details'] = GoodsOrderDetail::whereIn('id',$goodsOrderDetailIds)
            ->get()
            ->toArray();
        }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $totalNum = GoodsOrderDelivery::count();
        $waitSendNum = GoodsOrderDelivery::where('status',1)->count();
        $sendNum = GoodsOrder::where('status',2)->count();

        $data['totalNum'] = $totalNum ? $totalNum : 0;
        $data['waitSendNum'] = $waitSendNum ? $waitSendNum : 0;
        $data['sendNum'] = $sendNum ? $sendNum : 0;


        $data['search'] = $search;

        $q['search'] = $search;
        $q['token'] = Helper::token($request);

        $exportUrl = url('api/admin/'.$this->controllerName().'/deliveryExport?'.http_build_query($q));
        $data['exportUrl'] = $exportUrl;

        if(!empty($lists)) {

            $data['lists'] = $lists;
            $data['pagination'] = $pagination;

            return $this->success('获取成功！','',$data);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 编辑运货单
     *
     * @param  Request  $request
     * @return Response
     */
    public function deliveryEdit(Request $request)
    {
        $id = $request->input('id');

        // 定义对象
        $order = Order::join('goods_orders', 'goods_orders.order_id', '=', 'orders.id')
        ->join('shops', 'goods_orders.shop_id', '=', 'shops.id')
        ->join('users', 'users.id', '=', 'orders.uid')
        ->where('goods_mode',1)
        ->where('orders.id',$id)
        ->select(
            'orders.*',
            'goods_orders.total_amount',
            'goods_orders.buyer_pay_amount',
            'goods_orders.point_amount',
            'goods_orders.mdiscount_amount',
            'goods_orders.discount_amount',
            'goods_orders.freight_amount',
            'goods_orders.consignee_name',
            'goods_orders.consignee_address',
            'goods_orders.consignee_phone',
            'goods_orders.status as goods_order_status',
            'goods_orders.remark',
            'goods_orders.timeout_receipt',
            'goods_orders.close_type',
            'goods_orders.close_reason',
            'users.username',
            'users.nickname',
            'users.phone',
            'shops.title as shop_title'
        )->first();

        // WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI
        switch ($order['pay_type']) {
            case 'WECHAT_APP':
                $order['pay_type'] = '微信APP支付';
                break;
            case 'WECHAT_JSAPI':
                $order['pay_type'] = '微信公众号支付';
                break;
            case 'WECHAT_NATIVE':
                $order['pay_type'] = '微信电脑网站支付';
                break;
            case 'ALIPAY_PAGE':
                $order['pay_type'] = '支付宝电脑网站支付';
                break;
            case 'ALIPAY_APP':
                $order['pay_type'] = '支付宝APP支付';
                break;
            case 'ALIPAY_WAP':
                $order['pay_type'] = '支付宝手机网站支付';
                break;
            case 'ALIPAY_F2F':
                $order['pay_type'] = '支付宝当面付';
                break;
            case 'ALIPAY_JS':
                $order['pay_type'] = '支付宝JSAPI';
                break;
            default:
                $order['pay_type'] = '暂无';
                break;
        }

        $goodsOrderDetail = [];
        foreach ($order->goodsOrderDetail as $key => $value) {
            $goodsOrderDetail[$key]['cover_id'] = Helper::getPicture($value['cover_id']);
            $goodsOrderDetail[$key]['goods_id'] = $value['goods_id'];
            $goodsOrderDetail[$key]['goods_name'] = $value['goods_name'];
            $goodsOrderDetail[$key]['goods_price'] = $value['goods_price'];
            $goodsOrderDetail[$key]['num'] = $value['num'];
            $goodsOrderDetail[$key]['goods_property_names'] = $value['goods_property_names'];
            $goodsOrderDetail[$key]['description'] = $value['description'];
            $goodsInfo = Goods::where('id',$value['goods_id'])->first();
            $goodsOrderDetail[$key]['stock_num'] = $goodsInfo['stock_num'];
            $goodsOrderDetail[$key]['service_status'] = '正常';
            $goodsOrderDetail[$key]['status'] = $order['goods_order_status_title'];
        }

        $order['goods_order_details'] = $goodsOrderDetail;

        $order['goodsExpresses'] = GoodsExpress::where('status',1)
        ->get()
        ->toArray();

        return $this->success('获取成功！','',$order);
    }

    /**
     * 导出数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function export(Request $request)
    {
        // 获取参数
        $search    = $request->get('search');

        // 定义对象
        $query = GoodsOrderDetail::join('orders', 'goods_order_details.order_id', '=', 'orders.id')
        ->join('goods_orders', 'goods_order_details.goods_order_id', '=', 'goods_orders.id')
        ->join('users', 'users.id', '=', 'orders.uid');

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $title = "%{$search['title']}%";
                $query->whereRaw('(users.username like ? or users.phone like ? or orders.order_no like ?)', [$title, $title, $title]);
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status']) && $search['status'] != 'ALL') {
                    $query->where('goods_orders.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('orders.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }

            // 付款方式
            if(isset($search['payType'])) {
                if(!empty($search['payType'])) {
                    $query->where('orders.pay_type',$search['payType']);
                }
            }

            // 订单类型
            if(isset($search['type'])) {
                if(!empty($search['type'])) {
                    $query->where('orders.type',$search['type']);
                }
            }

            // 收货人姓名
            if(isset($search['consignee'])) {
                if(!empty($search['consignee'])) {
                    $query->where('goods_orders.consignee',$search['consignee']);
                }
            }

            // 收货人手机号
            if(isset($search['phone'])) {
                if(!empty($search['phone'])) {
                    $query->where('goods_orders.phone',$search['phone']);
                }
            }

            // 收货人地址
            if(isset($search['address'])) {
                if(!empty($search['address'])) {
                    $query->where('goods_orders.address','like','%'.$search['address'].'%');;
                }
            }
        }

        // 查询列表
        $lists = $query
        ->orderBy('orders.id', 'desc')
        ->select(
            'orders.id',
            'orders.order_no',
            'orders.thirdparty_order_no',
            'goods_order_details.goods_name',
            'goods_order_details.goods_property_names',
            'goods_order_details.goods_price',
            'goods_order_details.num',
            'users.username',
            'users.phone as userphone',
            'goods_orders.consignee',
            'goods_orders.phone',
            'goods_orders.address',
            'goods_orders.status as goods_order_status',
            'goods_orders.total_amount',
            'goods_orders.pay_amount',
            'orders.pay_type',
            'orders.paid_at',
            'orders.type',
            'orders.created_at'
        )->get()
        ->toArray();

        foreach ($lists as $key => $value) {

            // NOT_PAID:未支付;SUCCESS:支付成功;REFUND:转入退款的订单（由订单退款表记录详情）;CLOSED:交易关闭，不可退款;PAY_ERROR:支付失败
            switch ($value['goods_order_status']) {
                case 'NOT_PAID':
                    $lists[$key]['goods_order_status'] = '未支付';
                    break;

                case 'PAID':
                    $lists[$key]['goods_order_status'] = '待发货';
                    break;

                case 'SEND':
                    $lists[$key]['goods_order_status'] = '已发货';
                    break;

                case 'SUCCESS':
                    $lists[$key]['goods_order_status'] = '支付成功';
                    break;

                case 'REFUND':
                    $lists[$key]['goods_order_status'] = '转入退款';
                    break;

                case 'CLOSED':
                    $lists[$key]['goods_order_status'] = '交易关闭';
                    break;

                case 'PAY_ERROR':
                    $lists[$key]['goods_order_status'] = '支付失败';
                    break;

                default:
                    $lists[$key]['goods_order_status'] = '未知';
                    break;
            }

            // WECHAT_APP 微信APP支付， WECHAT_JSAPI 微信公众号支付， WECHAT_NATIVE 微信电脑网站支付， ALIPAY_PAGE 支付宝电脑网站支付， ALIPAY_APP 支付宝APP支付， ALIPAY_WAP 支付宝手机网站支付， ALIPAY_F2F 支付宝当面付， ALIPAY_JS 支付宝JSAPI
            switch ($value['pay_type']) {
                case 'WECHAT_APP':
                    $lists[$key]['pay_type'] = '微信APP支付，';
                    break;
                case 'WECHAT_JSAPI':
                    $lists[$key]['pay_type'] = '微信公众号支付';
                    break;
                case 'WECHAT_NATIVE':
                    $lists[$key]['pay_type'] = '微信电脑网站支付';
                    break;
                case 'ALIPAY_PAGE':
                    $lists[$key]['pay_type'] = '支付宝电脑网站支付';
                    break;
                case 'ALIPAY_APP':
                    $lists[$key]['pay_type'] = '支付宝APP支付';
                    break;
                case 'ALIPAY_WAP':
                    $lists[$key]['pay_type'] = '支付宝手机网站支付';
                    break;
                case 'ALIPAY_F2F':
                    $lists[$key]['pay_type'] = '支付宝当面付';
                    break;
                case 'ALIPAY_JS':
                    $lists[$key]['pay_type'] = '支付宝JSAPI';
                    break;
                default:
                    $lists[$key]['pay_type'] = '暂无';
                    break;
            }

            switch ($value['type']) {
                case 'MALL':
                    $lists[$key]['type'] = '普通订单';
                    break;

                default:
                    $lists[$key]['goods_order_status'] = '未知';
                    break;
            }
        }

        $fileName = 'data';

        $title = [
            'ID',
            '订单号',
            '第三方单号',
            '商品名称',
            '商品规格',
            '商品单价',
            '购买数量',
            '购买账号',
            '账号手机号',
            '收货人',
            '收货联系方式',
            '收货地址',
            '订单状态',
            '订单总金额',
            '支付金额',
            '支付方式',
            '付款时间',
            '订单类型',
            '拍下订单时间'
        ];

        $columnFormats = [
            'B' => 'FORMAT_TEXT', //字符串
            'C' => 'FORMAT_TEXT', //字符串
            'L' => 'FORMAT_TEXT', //字符串
            'K' => 'FORMAT_TEXT', //字符串
        ];

        return Helper::export($fileName,$title,$lists,$columnFormats);
    }
}
