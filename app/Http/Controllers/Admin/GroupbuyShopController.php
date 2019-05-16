<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\Models\GroupbuyShopCategory;
use App\Models\GroupbuyShop;
use App\Models\Merchant;
use App\Models\Picture;
use App\User;
use DB;

class GroupbuyShopController extends Controller
{
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
        $query = GroupbuyShop::query();

        // 查询
        if(!empty($search)) {
            // 标题
            if(isset($search['title'])) {
                $query->where('groupbuy_shops.title','like','%'.$search['title'].'%');
            }

            // 分类
            if(isset($search['category_id'])) {
                if(!empty($search['category_id'])) {
                    $query->where('groupbuy_shops.category_id',$search['category_id']);
                }
            }

            // 状态
            if(isset($search['status'])) {
                if(!empty($search['status'])) {
                    $query->where('groupbuy_shops.status',$search['status']);
                }
            }

            // 时间范围
            if(isset($search['dateRange'])) {
                if(!empty($search['dateRange'][0]) || !empty($search['dateRange'][1])) {
                    $query->whereBetween('posts.created_at', [$search['dateRange'][0], $search['dateRange'][1]]);
                }
            }
        }

        // 查询数量
        $total = $query
        ->where('groupbuy_shops.status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->join('groupbuy_shop_categories', 'groupbuy_shops.category_id', '=', 'groupbuy_shop_categories.id')
        ->join('merchants','groupbuy_shops.mch_id', '=','merchants.id')
        ->join('users','merchants.uid', '=','users.id')
        ->skip(($current-1)*$pageSize)
        ->take($pageSize)
        ->where('groupbuy_shops.status', '>', 0)
        ->orderBy('groupbuy_shops.id', 'desc')
        ->select('groupbuy_shops.*','groupbuy_shop_categories.name as category_name','groupbuy_shop_categories.title as category_title','users.name as shop_name','users.id as uid')
        ->get()
        ->toArray();

        // foreach ($lists as $key => $value) {
        //     if(empty($value['name'])) {
        //         $lists[$key]['name'] = '暂无';
        //     }
        // }

        // 默认页码
        $pagination['defaultCurrent'] = 1;
        // 当前页码
        $pagination['current'] = $current;
        // 分页数量
        $pagination['pageSize'] = $pageSize;
        // 总数量
        $pagination['total'] = $total;

        $categorys = GroupbuyShopCategory::where('status', '>',0)->get()->toArray();
        $categoryTrees = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees);

        // 模板数据
        $data['categorys'] = $categoryTreeLists;
        $data['lists'] = Helper::listsFormat($lists);

        if(!empty($data)) {
            return $this->success('获取成功！','',$data,$pagination,$search);
        } else {
            return $this->success('获取失败！');
        }
    }

    /**
     * 创建页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function create()
    {
        $categorys = GroupbuyShopCategory::where('status', '>',0)->get()->toArray();
        $categoryTrees = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees);

        // 模板数据
        $data['categoryTreeLists'] = $categoryTreeLists;

        return view('admin/groupbuy/shop/create',$data);
    }

    /**
     * 保存创建数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $mchId          =   $request->input('mchId');
        $title          =   $request->input('title');
        $logo           =   $request->input('logo');
        $categoryId     =   $request->input('categoryId',0);
        $tags           =   $request->input('tags');
        $description    =   $request->input('description');
        $content        =   $request->input('content');
        $coverIds       =   $request->input('coverIds');
        $name           =   $request->input('name');
        $phone          =   $request->input('phone');
        $province       =   $request->input('province');
        $city           =   $request->input('city');
        $county         =   $request->input('county');
        $town           =   $request->input('town');
        $address        =   $request->input('address');
        $openDays       =   $request->input('openDays');
        $openTimes      =   $request->input('openTimes');
        $level          =   $request->input('level');
        $position       =   $request->input('position');
        $comment        =   $request->input('comment');
        $view           =   $request->input('view');
        $commentStatus  =   $request->input('commentStatus');
        $businessLicenseCoverId  =   $request->input('businessLicenseCoverId');
        $corporateName  =   $request->input('corporateName');
        $corporateIdcard=   $request->input('corporateIdcard');
        $corporateIdcardCoverId  =   $request->input('corporateIdcardCoverId');
        $openStatus     =   $request->input('openStatus');
        $isSelf         =   $request->input('isSelf');
        $status         =   $request->input('status');


        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($logo)) {
            return $this->error('logo必须上传！');
        }

        if (empty($mchId)) {
            return $this->error('请选择所属商户！');
        }

        //判断该商户已经存在
        $resultJudgeMerchantExist = GroupbuyShop::where('mch_id',$mchId)->first();
        if ($resultJudgeMerchantExist) {
           return $this->error("您所选的商户已注册商铺");
        }

        if (empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if (empty($name)) {
            return $this->error('联系人必须填写！');
        }

        if (empty($phone)) {
            return $this->error('店铺电话必须填写！');
        }

        if (empty($province)) {
            return $this->error('请选择店铺省份！');
        }

        if (empty($city)) {
            return $this->error('请选择店铺市区！');
        }

        if (empty($county)) {
            return $this->error('请选择店铺县区！');
        }

        if (empty($address)) {
            return $this->error('填写店铺详细地址！');
        }

        if (empty($businessLicenseCoverId)) {
            return $this->error('请上传营业执照！');
        }

        if (empty($corporateName)) {
            return $this->error('法人姓名必须填写！');
        }

        if (empty($corporateIdcard)) {
            return $this->error('法人身份证必须填写！');
        }

        if (empty($corporateIdcardCoverId)) {
            return $this->error('请上传身份证照片！');
        }

        if ($commentStatus == 'on') {
            $commentStatus = 1;
        } else {
            $commentStatus = 2; //禁用
        }

        if ($openStatus == 'on') {
            $openStatus = 1;
        } else {
            $openStatus = 2; //打烊 
        }

        if ($isSelf == 'on') {
            $isSelf = 1;
        } else {
            $isSelf = 2; //禁用
        }

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['mch_id'] = $mchId;
        $data['title'] = $title;
        $data['logo'] = $logo;
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['description'] = $description;
        $data['content'] = $content;
        $data['cover_ids'] = $coverIds;
        $data['level'] = $level;
        $data['position'] = collect($position)->sum();
        $data['name'] = $name;
        $data['phone'] = $phone;
        $data['province'] = $province;
        $data['city'] = $city;
        $data['county'] = $county;
        $data['town'] = $county;
        $data['address'] = $address;
        $data['business_license_cover_id'] = $businessLicenseCoverId;
        $data['corporate_name'] = $corporateName;
        $data['corporate_idcard'] = $corporateIdcard;
        $data['corporate_idcard_cover_id'] = $corporateIdcardCoverId;
        $data['comment'] = $comment;
        $data['view'] = $view;
        $data['comment_status'] = $commentStatus;
        $data['open_days'] = $openDays;
        $data['open_times'] = $openTimes;
        $data['open_status'] = $openStatus;
        $data['is_self'] = $isSelf;
        $data['status'] = $status;
        $rate = 0;

        $result = GroupbuyShop::create($data);
        
        if ($result) {
            return $this->success('操作成功！');
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
        $id = $request->input('id');

        $shop = GroupbuyShop::find($id);

        $categorys = GroupbuyShopCategory::where('status', '>',0)->get()->toArray();
        $categoryTrees = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees);

        $merchant = Merchant::where('id',$shop['mch_id'])->where('status',1)->first();
        $user = User::where('id',$merchant['uid'])->where('status',1)->first();

        $data['shop'] = $shop;
        $data['user'] = $user;
        $data['categoryTreeLists'] = $categoryTreeLists;

        return view('admin/groupbuy/shop/edit',$data);
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function save(Request $request)
    {
        $id             =   $request->input('id');
        $mchId          =   $request->input('mchId');
        $title          =   $request->input('title');
        $logo           =   $request->input('logo');
        $categoryId     =   $request->input('categoryId',0);
        $tags           =   $request->input('tags');
        $description    =   $request->input('description');
        $content        =   $request->input('content');
        $coverIds       =   $request->input('coverIds');
        $name           =   $request->input('name');
        $phone          =   $request->input('phone');
        $province       =   $request->input('province');
        $city           =   $request->input('city');
        $county         =   $request->input('county');
        $town           =   $request->input('town');
        $address        =   $request->input('address');
        $openDays       =   $request->input('openDays');
        $openTimes      =   $request->input('openTimes');
        $level          =   $request->input('level');
        $position       =   $request->input('position');
        $comment        =   $request->input('comment');
        $view           =   $request->input('view');
        $commentStatus  =   $request->input('commentStatus');
        $businessLicenseCoverId  =   $request->input('businessLicenseCoverId');
        $corporateName  =   $request->input('corporateName');
        $corporateIdcard=   $request->input('corporateIdcard');
        $corporateIdcardCoverId  =   $request->input('corporateIdcardCoverId');
        $openStatus     =   $request->input('openStatus');
        $isSelf         =   $request->input('isSelf');
        $status         =   $request->input('status');

        if (empty($title)) {
            return $this->error('标题必须填写！');
        }

        if (empty($logo)) {
            return $this->error('logo必须上传！');
        }

        if (empty($mchId)) {
            return $this->error('请选择所属商户！');
        }

        if (empty($categoryId)) {
            return $this->error('请选择分类！');
        }

        if (empty($name)) {
            return $this->error('联系人必须填写！');
        }

        if (empty($phone)) {
            return $this->error('店铺电话必须填写！');
        }

        if (empty($province)) {
            return $this->error('请选择店铺省份！');
        }

        if (empty($city)) {
            return $this->error('请选择店铺市区！');
        }

        if (empty($county)) {
            return $this->error('请选择店铺县区！');
        }

        if (empty($address)) {
            return $this->error('填写店铺详细地址！');
        }

        if (empty($businessLicenseCoverId)) {
            return $this->error('请上传营业执照！');
        }

        if (empty($corporateName)) {
            return $this->error('法人姓名必须填写！');
        }

        if (empty($corporateIdcard)) {
            return $this->error('法人身份证必须填写！');
        }

        if (empty($corporateIdcardCoverId)) {
            return $this->error('请上传身份证照片！');
        }

        if ($commentStatus == 'on') {
            $commentStatus = 1;
        } else {
            $commentStatus = 2; //禁用
        }

        if ($openStatus == 'on') {
            $openStatus = 1;
        } else {
            $openStatus = 2; //打烊 
        }

        if ($isSelf == 'on') {
            $isSelf = 1; //自营
        } else {
            $isSelf = 2; //非自营
        }

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['mch_id'] = $mchId;
        $data['title'] = $title;
        $data['logo'] = $logo;
        $data['category_id'] = $categoryId;
        $data['tags'] = $tags;
        $data['description'] = $description;
        $data['content'] = $content;
        $data['cover_ids'] = $coverIds;
        $data['level'] = $level;
        $data['position'] = collect($position)->sum();
        $data['name'] = $name;
        $data['phone'] = $phone;
        $data['province'] = $province;
        $data['city'] = $city;
        $data['county'] = $county;
        $data['town'] = $county;
        $data['address'] = $address;
        $data['business_license_cover_id'] = $businessLicenseCoverId;
        $data['corporate_name'] = $corporateName;
        $data['corporate_idcard'] = $corporateIdcard;
        $data['corporate_idcard_cover_id'] = $corporateIdcardCoverId;
        $data['comment'] = $comment;
        $data['view'] = $view;
        $data['comment_status'] = $commentStatus;
        $data['open_days'] = $openDays;
        $data['open_times'] = $openTimes;
        $data['open_status'] = $openStatus;
        $data['is_self'] = $isSelf;
        $data['status'] = $status;
        $rate = 0;

        $result = GroupbuyShop::where('id',$id)->update($data);

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 建议搜索列表
     *
     * @param  Request  $request
     * @return Response
     */
    public function suggest(Request $request)
    {
        // 获取参数
        $page      = $request->input('page');
        $limit     = $request->input('limit','10');
        $search    = $request->input('search');
        
        // 定义对象
        $query = GroupbuyShop::query()
        ->join('merchants','groupbuy_shops.mch_id','merchants.id')
        ->join('users','merchants.uid','users.id');

        // 查询用户名
        if(!empty($search)) {
            $query->where('groupbuy_shops.title','like','%'.$search.'%');
        }

        // 查询数量
        $count = $query
        ->where('groupbuy_shops.status', '>', 0)
        ->count();

        // 查询列表
        $lists = $query
        ->skip(($page-1)*$limit)
        ->take($limit)
        ->where('groupbuy_shops.status', '>', 0)
        ->orderBy('id', 'desc')
        ->select('groupbuy_shops.title as text','groupbuy_shops.id')
        ->get()
        ->toArray();

        if(!empty($lists)) {
            return $this->success('获取成功！','',$lists,$count);
        } else {
            return $this->success('获取失败！');
        }
    }






    /**
     * 改变单个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeStatus(Request $request)
    {
        $id = $request->input('id');
        $status = $request->input('status');

        if($status == -1) {
            $result = GroupbuyShop::destroy($id);
        } else {
            $result = GroupbuyShop::where('id',$id)->update(['status'=>$status]);
        }

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变多个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function changeMultiStatus(Request $request)
    {
        $data = $request->input('data');
        $status = $request->input('status');

        foreach (json_decode($data,true) as $key => $value) {
            $ids[] = $value['id'];
        }

        if($status == -1) {
            $result = GroupbuyShop::destroy($ids);
        } else {
            $result = GroupbuyShop::whereIn('id',$ids)->update(['status'=>$status]);
        }

        if ($result) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 相册列表
     *
     * @param  Request  $request
     * @return Response
     */
    public function getPictures(Request $request)
    {
        // 查询列表
        $lists = Picture::query()
        ->where('status', '>', 0)
        ->orderBy('sort', 'asc')
        ->get()
        ->toArray();

        if(!empty($lists)) {
            return $this->success('获取成功！','',Helper::listsFormat($lists),$count);
        } else {
            return $this->success('获取失败！');
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
        if($request->isMethod('post')) {
            // 获取参数
            $page      = $request->input('page');
            $limit     = $request->input('limit');
            $search    = $request->input('search');
            $status    = $request->input('status');
            
            // 定义对象
            $query = GroupbuyShopCategory::query();

            // 查询用户名
            if(!empty($search)) {
                $query->where('title','like','%'.$search.'%');
            }

            // 查询状态
            if(!empty($status)) {
                $query->where('status',$status);
            }

            // 查询数量
            $count = $query
            ->where('status', '>', 0)
            ->count();

            // 查询列表
            $lists = $query->skip(($page-1)*$limit)
            ->take($limit)
            ->where('status', '>', 0)
            ->orderBy('id', 'desc')
            ->get()
            ->toArray();

            if($search || $status) {
                $categoryTreeLists = $lists;
            } else {
                $categoryTrees = Helper::listToTree(Helper::listsFormat($lists));
                $categoryTreeLists = Helper::treeToOrderList($categoryTrees);
            }

            if(!empty($categoryTreeLists)) {
                return $this->success('获取成功！','',$categoryTreeLists,$count);
            } else {
                return $this->success('获取失败！');
            }

        } else {
            return view('admin/groupbuy/shop/categoryIndex');
        }
    }

    /**
     * 创建页面
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryCreate()
    {
        $categorys = GroupbuyShopCategory::where('status', 1)->get()->toArray();
        $categoryTrees = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees);

        // 模板数据
        $data['categoryTreeLists'] = $categoryTreeLists;

        return view('admin/groupbuy/shop/categoryCreate',$data);
    }

    /**
     * 保存创建数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryStore(Request $request)
    {
        $title          =   $request->input('title');
        $uuid           =   Helper::createUuid();
        $pid            =   $request->input('pid',0);
        $sort           =   $request->input('sort',0);
        $coverId        =   $request->input('coverId',0);
        $name           =   $request->input('name');
        $description    =   $request->input('description');
        $indexTpl       =   $request->input('indexTpl');
        $listsTpl       =   $request->input('listsTpl');
        $detailTpl      =   $request->input('detailTpl');
        $pageNum        =   $request->input('pageNum',10);
        $status         =   $request->input('status');
        
        if (empty($title)) {
            return $this->error('分类名称必须填写！');
        }

        if (empty($name)) {
            return $this->error('缩略名必须填写！');
        }

        $hasName = GroupbuyShopCategory::where('status', 1)->where('name',$name)->first();

        if (!empty($hasName)) {
            return $this->error('缩略名已经存在！');
        }

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['uuid'] = $uuid;
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['cover_id'] = $coverId;
        $data['name'] = $name;
        $data['description'] = $description;
        $data['index_tpl'] = $indexTpl;
        $data['lists_tpl'] = $listsTpl;
        $data['detail_tpl'] = $detailTpl;
        $data['page_num'] = $pageNum;
        $data['status'] = $status;

        $result = GroupbuyShopCategory::create($data);
        
        if ($result) {
            // 清除缓存
            Helper::clearCache();
            return $this->success('操作成功！');
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
        $id = $request->input('id');

        $category = GroupbuyShopCategory::where('status', 1)->where('id',$id)->first();

        $categorys = GroupbuyShopCategory::where('status', 1)->get()->toArray();
        $categoryTrees = Helper::listToTree($categorys);
        $categoryTreeLists = Helper::treeToOrderList($categoryTrees);
        
        // 获取封面图
        $category['cover_path'] = Helper::getPicture($category['cover_id']);

        $data['category'] = $category;
        $data['categoryTreeLists'] = $categoryTreeLists;

        return view('admin/groupbuy/shop/categoryEdit',$data);
    }

    /**
     * 保存编辑数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function categorySave(Request $request)
    {
        $id             =   $request->input('id');
        $title          =   $request->input('title');
        $pid            =   $request->input('pid',0);
        $sort           =   $request->input('sort',0);
        $coverId        =   $request->input('coverId',0);
        $name           =   $request->input('name');
        $description    =   $request->input('description');
        $indexTpl       =   $request->input('indexTpl');
        $listsTpl       =   $request->input('listsTpl');
        $detailTpl      =   $request->input('detailTpl');
        $pageNum        =   $request->input('pageNum',10);
        $status         =   $request->input('status');
        
        if (empty($title)) {
            return $this->error('分类名称必须填写！');
        }

        if ($id == $pid) {
            return $this->error('不可以选择自己为父节点！');
        }

        if (empty($name)) {
            return $this->error('缩略名必须填写！');
        }

        $hasName = GroupbuyShopCategory::where('status', 1)->where('name',$name)->where('id','<>',$id)->first();

        if (!empty($hasName)) {
            return $this->error('缩略名已经存在！');
        }

        if ($status == 'on') {
            $status = 1;
        } else {
            $status = 2; //禁用
        }

        $data['title'] = $title;
        $data['pid'] = $pid;
        $data['sort'] = $sort;
        $data['cover_id'] = $coverId;
        $data['name'] = $name;
        $data['description'] = $description;
        $data['index_tpl'] = $indexTpl;
        $data['lists_tpl'] = $listsTpl;
        $data['detail_tpl'] = $detailTpl;
        $data['page_num'] = $pageNum;
        $data['status'] = $status;

        $result = GroupbuyShopCategory::where('status', 1)->where('id',$id)->update($data);
        if ($result) {
            // 清除缓存
            Helper::clearCache();
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 更新单个字段数据
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryUpdateField(Request $request)
    {
        $id             =   $request->input('id');
        $field          =   $request->input('field');
        $value          =   $request->input('value');
        
        if (empty($id)) {
            return $this->error('请选择要编辑的数据！');
        }

        if (empty($field)) {
            return $this->error('请选择要编辑的字段！');
        }

        if ($field == 'name') {
            $hasName = GroupbuyShopCategory::where('status',1)->where('name',$value)->where('id','<>',$id)->first();
            if (!empty($hasName)) {
                return $this->error('缩略名已经存在！');
            }
        }

        $data[$field] = $value;

        $result = GroupbuyShopCategory::where('status',1)->where('id',$id)->update($data);
        if ($result) {
            // 清除缓存
            Helper::clearCache();
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变单个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryChangeStatus(Request $request)
    {
        $id = $request->input('id');
        $status = $request->input('status');

        if($status == -1) {
            $hasArticle = GroupbuyShop::where('category_id',$id)->first();
            if ($hasArticle) {
                return $this->error('请先删除该分类下的内容！');
            }
    
            $hasSubCategory = GroupbuyShopCategory::where('pid',$id)->first();
            if ($hasSubCategory) {
                return $this->error('请先删除该分类下的子分类！');
            }
        }

        $result = GroupbuyShopCategory::where('id',$id)->update(['status'=>$status]);

        if ($result) {
            // 清除缓存
            Helper::clearCache();
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 改变多个数据状态
     *
     * @param  Request  $request
     * @return Response
     */
    public function categoryChangeMultiStatus(Request $request)
    {
        $data = $request->input('data');
        $status = $request->input('status');

        foreach (json_decode($data,true) as $key => $value) {
            if($status == -1) {
                // 判断分类下是否有商家
                $hasArticle = GroupbuyShop::where('category_id',$value['id'])->first();
                if ($hasArticle) {
                    return $this->error('请先删除该分类下的内容！');
                }

                // 判断分类下是否有子分类
                $hasSubCategory = GroupbuyShopCategory::where('pid',$value['id'])->first();
                if ($hasSubCategory) {
                    return $this->error('请先删除该分类下的子分类！');
                }
            }
            $ids[] = $value['id'];
        }

        $result = GroupbuyShopCategory::whereIn('id',$ids)->update(['status'=>$status]);

        if ($result) {
            // 清除缓存
            Helper::clearCache();
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

}