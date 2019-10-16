<?php

use Illuminate\Database\Seeder;

class MenusTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('menus')->insert([
            ['id' =>1,'name' => '控制台','guard_name' => 'admin','icon' => 'home','pid' => 0,'sort' => -2,'path' => '/console','show'  => 1,'status' => 1],
            ['id' =>2,'name' => '主页','guard_name' => 'admin','icon' => '','pid' => 1,'sort' => 0,'path' => '/console/index?id=1','show'  => 1,'status' => 1],

            ['id' => 3,'name' => '文章管理','guard_name' => 'admin','icon' => 'file-word','pid' => 0,'sort' => 0,'path' => '/article','show'  => 1,'status' => 1],
            ['id' => 4,'name' => '文章列表','guard_name' => 'admin','icon' => '','pid' => 3,'sort' => 0,'path' => '/article/index','show'  => 1,'status' => 1],
            ['id' => 5,'name' => '发布文章','guard_name' => 'admin','icon' => '','pid' => 3,'sort' => 0,'path' => '/article/create','show'  => 1,'status' => 1],
            ['id' => 6,'name' => '我的文章','guard_name' => 'admin','icon' => '','pid' => 3,'sort' => 0,'path' => '/article/myPublished','show'  => 1,'status' => 1],
            
            ['id' => 7,'name' => '单页管理','guard_name' => 'admin','icon' => 'file-ppt','pid' => 0,'sort' => 0,'path' => '/page','show'  => 1,'status' => 1],
            ['id' => 8,'name' => '单页列表','guard_name' => 'admin','icon' => '','pid' => 7,'sort' => 0,'path' => '/page/index','show'  => 1,'status' => 1],
            ['id' => 9,'name' => '添加单页','guard_name' => 'admin','icon' => '','pid' => 7,'sort' => 0,'path' => '/page/create','show'  => 1,'status' => 1],
            
            ['id' => 10,'name' => '会员管理','guard_name' => 'admin','icon' => 'user-add','pid' => 0,'sort' => 0,'path' => '/user','show'  => 1,'status' => 1],
            ['id' => 11,'name' => '会员列表','guard_name' => 'admin','icon' => '','pid' => 10,'sort' => 0,'path' => '/user/index','show'  => 1,'status' => 1],
            ['id' =>12,'name' => '添加会员','guard_name' => 'admin','icon' => '','pid' => 10,'sort' => 0,'path' => '/user/create','show'  => 1,'status' => 1],
            
            ['id' =>13,'name' => '管理员','guard_name' => 'admin','icon' => 'usergroup-add','pid' => 0,'sort' => 0,'path' => '/admin','show'  => 1,'status' => 1],
            ['id' =>14,'name' => '管理员列表','guard_name' => 'admin','icon' => '','pid' => 13,'sort' => 0,'path' => '/admin/user','show'  => 1,'status' => 1],
            ['id' =>15,'name' => '菜单列表','guard_name' => 'admin','icon' => '','pid' => 13,'sort' => 0,'path' => '/admin/menu/index','show'  => 1,'status' => 1],
            ['id' =>16,'name' => '权限列表','guard_name' => 'admin','icon' => '','pid' => 13,'sort' => 0,'path' => '/admin/permission','show'  => 1,'status' => 1],
            ['id' =>17,'name' => '角色列表','guard_name' => 'admin','icon' => '','pid' => 13,'sort' => 0,'path' => '/admin/role','show'  => 1,'status' => 1],

            ['id' =>18,'name' => '广告管理','guard_name' => 'admin','icon' => 'file-word','pid' => 0,'sort' => 0,'path' => '/banner','show'  => 1,'status' => 1],
            ['id' =>19,'name' => '广告列表','guard_name' => 'admin','icon' => '','pid' => 18,'sort' => 0,'path' => '/banner/banner','show'  => 1,'status' => 1],
            ['id' =>20,'name' => '广告位列表','guard_name' => 'admin','icon' => '','pid' => 18,'sort' => 0,'path' => '/banner/bannerCategory','show'  => 1,'status' => 1],
            
            ['id' =>21,'name' => '应用插件','guard_name' => 'admin','icon' => 'snippets','pid' => 0,'sort' => 0,'path' => '/plugin','show'  => 1,'status' => 1],
            ['id' =>22,'name' => '评论管理','guard_name' => 'admin','icon' => '','pid' => 21,'sort' => 0,'path' => '/plugin/comment','show'  => 1,'status' => 1],
            ['id' =>23,'name' => '友情链接','guard_name' => 'admin','icon' => '','pid' => 21,'sort' => 0,'path' => '/plugin/link','show'  => 1,'status' => 1],
            ['id' =>24,'name' => '打印机管理','guard_name' => 'admin','icon' => '','pid' => 21,'sort' => 0,'path' => '/plugin/printer','show'  => 1,'status' => 1],
            
            ['id' =>25,'name' => '系统配置','guard_name' => 'admin','icon' => 'setting','pid' => 0,'sort' => 0,'path' => '/system','show'  => 1,'status' => 1],
            ['id' =>26,'name' => '设置管理','guard_name' => 'admin','icon' => '','pid' => 25,'sort' => 0,'path' => '/system/config','show'  => 1,'status' => 1],
            ['id' =>27,'name' => '网站设置','guard_name' => 'admin','icon' => '','pid' => 26,'sort' => 0,'path' => '/system/config/website','show'  => 1,'status' => 1],
            ['id' =>28,'name' => '配置管理','guard_name' => 'admin','icon' => '','pid' => 26,'sort' => 0,'path' => '/system/config/index','show'  => 1,'status' => 1],
            ['id' =>29,'name' => '所有导航','guard_name' => 'admin','icon' => '','pid' => 25,'sort' => 0,'path' => '/system/navigation','show'  => 1,'status' => 1],
            ['id' =>30,'name' => '分类列表','guard_name' => 'admin','icon' => '','pid' => 25,'sort' => 0,'path' => '/system/category','show'  => 1,'status' => 1],
            ['id' =>31,'name' => '短信列表','guard_name' => 'admin','icon' => '','pid' => 25,'sort' => 0,'path' => '/system/sms/index','show'  => 1,'status' => 1],
            ['id' =>32,'name' => '操作日志','guard_name' => 'admin','icon' => '','pid' => 25,'sort' => 0,'path' => '/system/actionLog/index','show'  => 1,'status' => 1],
            
            ['id' =>33,'name' => '附件空间','guard_name' => 'admin','icon' => 'paper-clip','pid' => 0,'sort' => 0,'path' => '/attachment','show'  => 1,'status' => 1],
            ['id' =>34,'name' => '文件管理','guard_name' => 'admin','icon' => '','pid' => 33,'sort' => 0,'path' => '/attachment/file','show'  => 1,'status' => 1],
            ['id' =>35,'name' => '图片管理','guard_name' => 'admin','icon' => '','pid' => 33,'sort' => 0,'path' => '/attachment/picture','show'  => 1,'status' => 1],
            
            ['id' =>36,'name' => '我的账号','guard_name' => 'admin','icon' => 'user','pid' => 0,'sort' => 0,'path' => '/account','show'  => 1,'status' => 1],
            ['id' =>37,'name' => '个人设置','guard_name' => 'admin','icon' => '','pid' => 36,'sort' => 0,'path' => '/account/settings','show'  => 1,'status' => 1],

            ['id' =>'38','name' => '商城管理','guard_name' => 'admin','icon' => 'shop','pid' => '0','sort' => '-1','path' => '/mall','show'  => '1','status' => '1'],
            ['id' =>'39','name' => '商家管理','guard_name' => 'admin','icon' => '','pid' => '38','sort' => '0','path' => '/mall/shop','show'  => '1','status' => '1'],
            ['id' =>'40','name' => '商家列表','guard_name' => 'admin','icon' => '','pid' => '39','sort' => '0','path' => '/mall/shop/index','show'  => '1','status' => '1'],
            ['id' =>'41','name' => '添加商家','guard_name' => 'admin','icon' => '','pid' => '40','sort' => '0','path' => '/mall/shop/create','show'  => '0','status' => '1'],
            ['id' =>'42','name' => '编辑商家','guard_name' => 'admin','icon' => '','pid' => '40','sort' => '0','path' => '/mall/shop/edit','show'  => '0','status' => '1'],
            ['id' =>'43','name' => '商家分类','guard_name' => 'admin','icon' => '','pid' => '39','sort' => '0','path' => '/mall/shop/categoryIndex','show'  => '1','status' => '1'],
            ['id' =>'44','name' => '创建分类','guard_name' => 'admin','icon' => '','pid' => '43','sort' => '0','path' => '/mall/shop/categoryCreate','show'  => '0','status' => '1'],
            ['id' =>'45','name' => '编辑分类','guard_name' => 'admin','icon' => '','pid' => '43','sort' => '0','path' => '/mall/shop/categoryEdit','show'  => '0','status' => '1'],
            ['id' =>'46','name' => '商品管理','guard_name' => 'admin','icon' => '','pid' => '38','sort' => '0','path' => '/mall/goods','show'  => '1','status' => '1'],
            ['id' =>'47','name' => '商品列表','guard_name' => 'admin','icon' => '','pid' => '46','sort' => '0','path' => '/mall/goods/index','show'  => '1','status' => '1'],
            ['id' =>'48','name' => '商品分类','guard_name' => 'admin','icon' => '','pid' => '46','sort' => '0','path' => '/mall/goods/categoryIndex','show'  => '1','status' => '1'],
            ['id' =>'49','name' => '品牌管理','guard_name' => 'admin','icon' => '','pid' => '38','sort' => '0','path' => '/mall/goodsBrand','show'  => '1','status' => '1'],
            ['id' =>'50','name' => '品牌列表','guard_name' => 'admin','icon' => '','pid' => '49','sort' => '0','path' => '/mall/goodsBrand/index','show'  => '1','status' => '1'],
            ['id' =>'51','name' => '商品类型','guard_name' => 'admin','icon' => '','pid' => '46','sort' => '0','path' => '/mall/goods/typeIndex','show'  => '1','status' => '1'],
            ['id' =>'52','name' => '商品订单','guard_name' => 'admin','icon' => '','pid' => '38','sort' => '0','path' => '/mall/goodsOrder','show'  => '1','status' => '1'],
            ['id' =>'53','name' => '订单列表','guard_name' => 'admin','icon' => '','pid' => '52','sort' => '0','path' => '/mall/goodsOrder/index','show'  => '1','status' => '1'],
            ['id' =>'54','name' => '退款订单','guard_name' => 'admin','icon' => '','pid' => '52','sort' => '0','path' => '/mall/goodsOrder/refundIndex','show'  => '1','status' => '1'],
            ['id' =>'55','name' => '售后订单','guard_name' => 'admin','icon' => '','pid' => '52','sort' => '0','path' => '/mall/goodsOrder/afterSaleIndex','show'  => '1','status' => '1'],
            ['id' =>'56','name' => '评价管理','guard_name' => 'admin','icon' => '','pid' => '52','sort' => '0','path' => '/mall/goodsOrder/commentIndex','show'  => '1','status' => '1'],
            ['id' =>'57','name' => '商品单位','guard_name' => 'admin','icon' => '','pid' => '46','sort' => '0','path' => '/mall/goods/unitIndex','show'  => '1','status' => '1'],
            ['id' =>'58','name' => '详情版式','guard_name' => 'admin','icon' => '','pid' => '46','sort' => '0','path' => '/mall/goods/layoutIndex','show'  => '1','status' => '1'],
        ]);
    }
}
