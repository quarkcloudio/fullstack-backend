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
use App\Builder\Forms\Controls\Area;
use App\Builder\Forms\Controls\Map;
use App\Builder\Forms\Controls\SearchInput;
use App\Builder\Forms\FormBuilder;
use App\Builder\Lists\Tables\Table;
use App\Builder\Lists\Tables\Column;
use App\Builder\Lists\ListBuilder;
use App\Builder\Tabs;
use App\Builder\TabPane;
use Illuminate\Validation\Rule;
use App\Services\Helper;
use App\Models\Shop;
use App\Models\Merchant;
use App\Models\ShopCategory;
use App\User;
use Validator;
use DB;

class ShopController extends BuilderController
{
    public function __construct()
    {
        $this->pageTitle = '商家';
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
        $query = Shop::query();

        // 查询
        if(!empty($search)) {

            // 用户名
            if(isset($search['title'])) {
                $query->where('title','like','%'.$search['title'].'%');
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
            Input::make('搜索内容','title'),
            Button::make('搜索')->onClick('search'),
        ];

        $columns = [
            Column::make('ID','id'),
            Column::make('logo','logo')->isImage(),
            Column::make('商家名称','title')->withA('admin/mall/'.$this->controllerName().'/edit'),
            Column::make('店铺联系人','username'),
            Column::make('店铺电话','phone'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('创建时间','created_at'),
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
            $lists[$key]['logo'] = Helper::getPicture($value['logo']);
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
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function form($data = [])
    {
        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/save';
        } else {
            $action = 'admin/'.$this->controllerName().'/store';
        }

        $categorys         = ShopCategory::where('status',1)->get()->toArray();
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

        $checkboxList = [
            [
                'name'=>'首页推荐',
                'value'=>1,
            ],
            [
                'name'=>'频道推荐',
                'value'=>2,
            ],
            [
                'name'=>'列表推荐',
                'value'=>4,
            ],
            [
                'name'=>'详情推荐',
                'value'=>8,
            ],
        ];

        $openDays = [
            [
                'name'=>'周一',
                'value'=>1,
            ],
            [
                'name'=>'周二',
                'value'=>2,
            ],
            [
                'name'=>'周三',
                'value'=>3,
            ],
            [
                'name'=>'周四',
                'value'=>4,
            ],
            [
                'name'=>'周五',
                'value'=>5,
            ],
            [
                'name'=>'周六',
                'value'=>6,
            ],
            [
                'name'=>'周日',
                'value'=>7,
            ],
        ];

        if($data) {

            // 定义对象
            $options = User::where('users.id',$data['uid'])
            ->select('users.username as name','users.id as value')
            ->get()
            ->toArray();
            $bindUser = SearchInput::make('绑定用户','uid')
            ->style(['width'=>200])
            ->option($options)
            ->dataSource('admin/user/suggest');

            // 商家地域
            $data['area'] = [$data['province'],$data['city'],$data['county']];

            // 地图坐标
            $map = Map::make('商家坐标','map')
            ->style(['width'=>'100%','height'=>400])
            ->position($data['longitude'],$data['latitude']);

        } else {
            $bindUser = SearchInput::make('绑定用户','uid')
            ->style(['width'=>200])
            ->dataSource('admin/user/suggest');

            // 地图坐标
            $map = Map::make('商家坐标','map')
            ->style(['width'=>'100%','height'=>400]);
        }


        $oneControls = [
            ID::make('ID','id'),
            Input::make('商家名称','title')->style(['width'=>400]),
            Image::make('Logo','logo'),
            Select::make('分类','category_id')->style(['width'=>200])->option($getCategorys)->value('0'),
            $bindUser,
            Input::make('标签','tags')->style(['width'=>400]),
            TextArea::make('描述','description')->style(['width'=>400]),
            Image::make('封面图','cover_ids')->mode('multiple'),
            Editor::make('内容','content'),
            Input::make('联系人','username')->style(['width'=>200]),
            Input::make('商家电话','phone')->style(['width'=>200]),
            Checkbox::make('营业日期','open_days')->list($openDays)->value([1,2,3,4,5,6,7]),
            RangePicker::make('营业时间','open_times')->format('H:mm')->value(['00:00','23:59']),
            SwitchButton::make('营业状态','comment_status')->checkedText('营业')->unCheckedText('打烊')->value(true),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action),
        ];

        $twoControls = [
            InputNumber::make('排序','level')->extra('越大越靠前')->max(10000)->value(1),
            Checkbox::make('推荐位','position')->list($checkboxList),
            SwitchButton::make('自营','is_self')->checkedText('是')->unCheckedText('否')->value(false),
            SwitchButton::make('允许评论','comment_status')->checkedText('是')->unCheckedText('否')->value(true),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action)
        ];

        $threeControls = [
            Area::make('商家地域','area')->style(['width'=>400]),
            Input::make('详细地址','address')->style(['width'=>400]),
            $map,
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action)
        ];

        $fourControls = [
            Input::make('法人姓名','corporate_name')->style(['width'=>200]),
            Input::make('身份证号','corporate_idcard')->style(['width'=>200]),
            Image::make('身份证照片','corporate_idcard_cover_id'),
            Image::make('营业执照','business_license_cover_id'),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action)
        ];

        $fiveControls = [
            Input::make('开户行','bank_name')->style(['width'=>200]),
            Input::make('收款人','bank_payee')->style(['width'=>200]),
            Input::make('银行账号','bank_number')->style(['width'=>200]),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action)
        ];

        $tabPane = [
            TabPane::make('基本信息',1)->controls($oneControls),
            TabPane::make('扩展信息',2)->controls($twoControls),
            TabPane::make('商铺位置',3)->controls($threeControls),
            TabPane::make('资质证件',4)->controls($fourControls),
            TabPane::make('打款信息',5)->controls($fiveControls)
        ];

        $tabs = Tabs::make('tab')->defaultActiveKey(1)->tabPanes($tabPane);

        $result = $this->formBuilder($tabs,$data);

        return $result;
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function create(Request $request)
    {
        $data = $this->form();
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
        if($position) {
            $data['position'] = collect($position)->sum();
        }
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

        $result = Shop::create($data);

        if ($result) {
            return $this->success('操作成功！','/mall/shop/index');
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

        $data = Shop::find($id)->toArray();

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
        if($position) {
            $data['position'] = collect($position)->sum();
        }
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

        $result = Shop::where('id',$id)->update($data);

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
        $query = Shop::query();

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
        $query = ShopCategory::query();

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
        ->select('shop_categories.*')
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
            Column::make('标题','title')->withA('admin/system/'.$this->controllerName().'/edit'),
            Column::make('排序','sort'),
            Column::make('名称','name'),
            Column::make('类型','type'),
            Column::make('分页数量','page_num'),
            Column::make('状态','status')->withTag("text === '已禁用' ? 'red' : 'blue'"),
            Column::make('时间','created_at'),
        ];

        $headerButtons = [
            Button::make('新增'.$this->pageTitle)->icon('plus-circle')->type('primary')->href('admin/mall/shop/categoryCreate'),
        ];

        $toolbarButtons = [
            Button::make('启用')->type('primary')->onClick('multiChangeStatus','1','admin/'.$this->controllerName().'/categoryChangeStatus'),
            Button::make('禁用')->onClick('multiChangeStatus','2','admin/'.$this->controllerName().'/categoryChangeStatus'),
            Button::make('删除')->type('danger')->onClick('multiChangeStatus','-1','admin/'.$this->controllerName().'/categoryChangeStatus'),
        ];

        $actions = [
            Button::make('启用|禁用')->type('link')->onClick('changeStatus','1|2','admin/'.$this->controllerName().'/categoryChangeStatus'),
            Button::make('编辑')->type('link')->href('admin/mall/shop/categoryEdit'),
            Popconfirm::make('删除')->type('link')->title('确定删除吗？')->onConfirm('changeStatus','-1','admin/'.$this->controllerName().'/categoryChangeStatus'),
        ];

        $data = $this->listBuilder($columns,$categoryTrees,$pagination,$searchs,[],$headerButtons,$toolbarButtons,$actions);

        return $this->success('获取成功！','',$data);
    }

    /**
     * Form页面模板
     * 
     * @param  Request  $request
     * @return Response
     */
    public function categoryForm($data = [])
    {
        $categorys         = ShopCategory::all()->toArray();
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

        if(isset($data['id'])) {
            $action = 'admin/'.$this->controllerName().'/categorySave';
        } else {
            $action = 'admin/'.$this->controllerName().'/categoryStore';
        }

        $baseControls = [
            ID::make('ID','id'),
            Input::make('标题','title')->style(['width'=>400]),
            Input::make('名称','name')->style(['width'=>200]),
            Select::make('父节点','pid')->style(['width'=>200])->option($getCategorys)->value('0'),
            TextArea::make('描述','description')->style(['width'=>400]),
            InputNumber::make('排序','sort')->style(['width'=>200])->value(0),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action),
        ];

        $extendControls = [
            Image::make('封面图','cover_id'),
            Input::make('频道模板','index_tpl')->style(['width'=>200]),
            Input::make('列表模板','lists_tpl')->style(['width'=>200]),
            Input::make('详情模板','detail_tpl')->style(['width'=>200]),
            InputNumber::make('分页数量','page_num')->style(['width'=>200])->value(10),
            SwitchButton::make('状态','status')->checkedText('正常')->unCheckedText('禁用')->value(true),
            Button::make('提交')
            ->type('primary')
            ->style(['width'=>100,'float'=>'left','marginLeft'=>200])
            ->onClick('submit',null,$action),
        ];

        $tabPane = [
            TabPane::make('基本',1)->controls($baseControls),
            TabPane::make('扩展',2)->controls($extendControls)
        ];

        $tabs = Tabs::make('tab')->defaultActiveKey(1)->tabPanes($tabPane);

        $result = $this->formBuilder($tabs,$data);

        return $result;
    }

    /**
     * 添加页面
     * 
     * @param  Request  $request
     * @return Response
     */
    public function categoryCreate(Request $request)
    {
        $data = $this->categoryForm();

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
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }
        if (empty($pageNum)) {
            return $this->error('分页数量必须填写！');
        }
        $hasTitle = ShopCategory::where('title',$title)->first();
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

        $result = ShopCategory::create($data);

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

        $data = ShopCategory::find($id)->toArray();

        $cover_id = $data['cover_id'];

        unset($data['cover_id']);

        $data['cover_id'][0]['id'] =$cover_id;
        $data['cover_id'][0]['uid'] =$cover_id;
        $data['cover_id'][0]['name'] = Helper::getPicture($cover_id,'name');
        $data['cover_id'][0]['url'] = Helper::getPicture($cover_id);

        if ($data['status'] == 1) {
            $data['status'] = true;
        } else {
            $data['status'] = false;
        }

        $data = $this->categoryForm($data);
        
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
        $coverId        =   $request->json('cover_id');
        $indexTpl       =   $request->json('index_tpl');
        $listsTpl       =   $request->json('lists_tpl');
        $detailTpl      =   $request->json('detail_tpl');
        $pageNum        =   $request->json('page_num');
        $status         =   $request->json('status');
        
        if (empty($title)) {
            return $this->error('标题必须填写！');
        }
        if (empty($name)) {
            return $this->error('名称必须填写！');
        }
        if (empty($pageNum)) {
            return $this->error('分页数量必须填写！');
        }
        $hasTitle = ShopCategory::where('id','<>',$id)->where('title',$title)->first();
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
        $data['cover_id']       = $coverId;
        $data['index_tpl']      = $indexTpl;
        $data['lists_tpl']      = $listsTpl;
        $data['detail_tpl']     = $detailTpl;
        $data['page_num']       = $pageNum;
        $data['status']         = $status;

        $result = ShopCategory::where('id',$id)->update($data);
        if ($result) {
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
        $query = ShopCategory::query();

        if(is_array($id)) {
            $query->whereIn('id',$id);
        } else {
            $query->where('id',$id);
        }

        if($status == -1) {
            
            // 查询此分类下是否有内容
            $hasShop = Shop::where('category_id',$id)->where('status',1)->first();
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
}
