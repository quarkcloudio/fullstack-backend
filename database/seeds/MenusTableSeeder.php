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
            ['id' => 1,'title'=>'控制台','name' => 'index/index','guard_name' => 'admin','icon' => 0,'pid' => 0,'sort' => 0,'url' => 'admin/index/index','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

            // 内容分组
            ['id' => 2,'title' => '内容','name' => 'content','guard_name' => 'admin','icon' => 'iconfont icon-content','pid' => 0,'sort' => 0,'url' => '','jump' => 1,'spread' => 1,'show'  => 1,'status' => 1],
            
                // 文章管理
                ['id' => 3,'title' => '文章管理','name' => 'article','guard_name' => 'admin','icon' => 0,'pid' => 2,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 4,'title' => '所有文章','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 5,'title' => '添加文章','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/create','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 6,'title' => '保存添加文章','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 7,'title' => '编辑文章','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 8,'title' => '保存更新文章','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 9,'title' => '更改文章状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 10,'title' => '更改多个文章状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                
                // 文章分类管理
                ['id' => 11,'title' => '分类目录','name' => 'categoryIndex','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/categoryIndex','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 12,'title' => '添加分类','name' => 'categoryCreate','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/categoryCreate','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 13,'title' => '保存添加分类','name' => 'categoryStore','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/categoryStore','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 14,'title' => '编辑分类','name' => 'categoryEdit','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/categoryEdit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 15,'title' => '保存编辑分类','name' => 'categorySave','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/categorySave','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 16,'title' => '更改多个分类状态','name' => 'categoryChangeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 3,'sort' => 0,'url' => 'admin/content/article/categoryChangeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                
                // 单页管理
                ['id' => 17,'title' => '单页管理','name' => 'page','guard_name' => 'admin','icon' => 0,'pid' => 2,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 18,'title' => '所有单页','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 19,'title' => '添加单页','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/create','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 20,'title' => '保存添加单页','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 21,'title' => '编辑单页','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 22,'title' => '保存编辑单页','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 23,'title' => '更改单页状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 24,'title' => '更改多个单页状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 17,'sort' => 0,'url' => 'admin/content/page/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

            // 用户分组
            ['id' => 66,'title' => '用户','name' => 'user','guard_name' => 'admin','icon' => 'layui-icon-user','pid' => 0,'sort' => 6,'url' => '','jump' => 1,'spread' => 1,'show'  => 1,'status' => 1,],
                
                // 用户管理
                ['id' => 67,'title' => '用户管理','name' => 'user','guard_name' => 'admin','icon' => 0,'pid' => 66,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 68,'title' => '用户列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 67,'sort' => 0,'url' => 'admin/user/user/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 69,'title' => '保存添加用户','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 67,'sort' => 0,'url' => 'admin/user/user/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 70,'title' => '编辑用户','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 67,'sort' => 0,'url' => 'admin/user/user/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 71,'title' => '更改用户状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 67,'sort' => 0,'url' => 'admin/user/user/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 72,'title' => '更改多个用户状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 67,'sort' => 0,'url' => 'admin/user/user/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 73,'title' => '用户充值','name' => 'recharge','guard_name' => 'admin','icon' => 0,'pid' => 67,'sort' => 0,'url' => 'admin/user/user/recharge','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 后台管理组
                ['id' => 74,'title' => '后台管理组','name' => 'admin','guard_name' => 'admin','icon' => 0,'pid' => 66,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 75,'title' => '管理员列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 76,'title' => '保存添加管理员','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 77,'title' => '编辑管理员','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 78,'title' => '保存编辑管理员','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 79,'title' => '更改管理员状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 80,'title' => '更改多个管理员状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 81,'title' => '将权限授予管理员','name' => 'givePermissionTo','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/givePermissionTo','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 82,'title' => '撤销管理员权限','name' => 'revokePermissionTo','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/revokePermissionTo','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 83,'title' => '同步管理员权限','name' => 'syncPermissions','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/syncPermissions','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 84,'title' => '给管理员分配角色','name' => 'assignRole','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/assignRole','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 85,'title' => '将管理员移出角色','name' => 'removeRole','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/removeRole','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 86,'title' => '同步用户给用户组','name' => 'syncRoles','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/syncRoles','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 87,'title' => '当前登录管理员资料','name' => 'profile','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/profile','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 88,'title' => '更改当前登录管理员资料','name' => 'saveProfile','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/saveProfile','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                ['id' => 89,'title' => '权限列表','name' => 'permissionIndex','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionIndex','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 90,'title' => '添加权限','name' => 'permissionCreate','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionCreate','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 91,'title' => '保存添加权限','name' => 'permissionStore','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionStore','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 92,'title' => '编辑权限','name' => 'permissionEdit','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionEdit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 93,'title' => '保存编辑权限','name' => 'permissionSave','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionSave','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 94,'title' => '更改权限状态','name' => 'permissionChangeStatus','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionChangeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 95,'title' => '更改多个权限状态','name' => 'permissionChangeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/permissionChangeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                
                ['id' => 96,'title' => '角色列表','name' => 'roleIndex','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleIndex','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 97,'title' => '添加角色','name' => 'roleCreate','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleCreate','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 98,'title' => '保存添加角色','name' => 'roleStore','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleStore','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 99,'title' => '编辑角色','name' => 'roleEdit','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleEdit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 100,'title' => '保存编辑角色','name' => 'roleSave','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleSave','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 101,'title' => '更改角色状态','name' => 'roleChangeStatus','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleChangeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 102,'title' => '更改多个角色状态','name' => 'roleChangeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/roleChangeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 103,'title' => '将权限授予角色','name' => 'givePermissionToRole','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/givePermissionToRole','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 104,'title' => '撤销用户组权限','name' => 'revokePermissionToRole','guard_name' => 'admin','icon' => 0,'pid' => 74,'sort' => 0,'url' => 'admin/user/admin/revokePermissionToRole','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

            // 日志分组
            ['id' => 105,'title' => '日志','name' => 'log','guard_name' => 'admin','icon' => 'iconfont icon-log','pid' => 0,'sort' => 7,'url' => '','jump' => 1,'spread' => 1,'show'  => 1,'status' => 1],
                
                // 用户日志
                ['id' => 106,'title' => '用户日志','name' => 'user','guard_name' => 'admin','icon' => 0,'pid' => 105,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 107,'title' => '日志列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 106,'sort' => 0,'url' => 'admin/log/user/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 108,'title' => '更改日志状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 106,'sort' => 0,'url' => 'admin/log/user/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 109,'title' => '更改多个日志状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 106,'sort' => 0,'url' => 'admin/log/user/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

            // 插件分组
            ['id' => 110,'title' => '插件','name' => 'plugin','guard_name' => 'admin','icon' => 'iconfont icon-plugin','pid' => 0,'sort' => 8,'url' => '','jump' => 1,'spread' => 1,'show'  => 1,'status' => 1],
            
                // 广告管理
                ['id' => 111,'title' => '广告管理','name' => 'banner','guard_name' => 'admin','icon' => 0,'pid' => 110,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 112,'title' => '广告列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 113,'title' => '添加广告','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 114,'title' => '保存添加广告','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 115,'title' => '编辑广告','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 116,'title' => '保存编辑广告','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 117,'title' => '更改广告状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 118,'title' => '更改多个广告状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                ['id' => 119,'title' => '广告位置','name' => 'categoryIndex','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categoryIndex','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 120,'title' => '添加广告位置','name' => 'categoryCreate','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categoryCreate','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 121,'title' => '保存添加广告位置','name' => 'categoryStore','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categoryStore','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 122,'title' => '编辑广告位置','name' => 'categoryEdit','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categoryEdit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 123,'title' => '保存编辑广告位置','name' => 'categorySave','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categorySave','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 124,'title' => '更改广告位置状态','name' => 'categoryChangeStatus','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categoryChangeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 125,'title' => '更改多个广告位置状态','name' => 'categoryChangeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 111,'sort' => 0,'url' => 'admin/plugin/banner/categoryChangeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 友情链接
                ['id' => 126,'title' => '友情链接管理','name' => 'link','guard_name' => 'admin','icon' => 0,'pid' => 110,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 127,'title' => '友情链接列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 128,'title' => '添加友情链接','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 129,'title' => '保存添加友情链接','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 130,'title' => '编辑友情链接','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 131,'title' => '保存编辑友情链接','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 132,'title' => '更改友情链接状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 133,'title' => '更改多个友情链接状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 126,'sort' => 0,'url' => 'admin/plugin/link/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 文件管理
                ['id' => 134,'title' => '文件管理','name' => 'file','guard_name' => 'admin','icon' => 0,'pid' => 110,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                
                // 文件列表
                ['id' => 135,'title' => '文件列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 134,'sort' => 0,'url' => 'admin/plugin/file/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 136,'title' => '上传文件','name' => 'upload','guard_name' => 'admin','icon' => 0,'pid' => 134,'sort' => 0,'url' => 'admin/plugin/file/upload','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 137,'title' => '更新文件','name' => 'update','guard_name' => 'admin','icon' => 0,'pid' => 134,'sort' => 0,'url' => 'admin/plugin/file/update','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 138,'title' => '更改文件状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 134,'sort' => 0,'url' => 'admin/plugin/file/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 139,'title' => '更改多个文件状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 134,'sort' => 0,'url' => 'admin/plugin/file/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
               
                // 图片列表
                ['id' => 140,'title' => '图片列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 141,'title' => '上传图片','name' => 'upload','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/upload','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 142,'title' => '更新图片','name' => 'update','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/update','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 143,'title' => '编辑图片','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 144,'title' => '保存编辑图片','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 145,'title' => '更改图片状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 146,'title' => '更改多个图片状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

            // 数据分组
            ['id' => 147,'title' => '数据','name' => 'data','guard_name' => 'admin','icon' => 'iconfont icon-data','pid' => 0,'sort' => 9,'url' => '','jump' => 1,'spread' => 1,'show'  => 1,'status' => 1],
                
                // 用户数据
                ['id' => 148,'title' => '用户数据','name' => 'user','guard_name' => 'admin','icon' => 0,'pid' => 147,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 149,'title' => '注册统计','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 148,'sort' => 0,'url' => 'admin/data/user/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],

                // 交易数据
                ['id' => 150,'title' => '交易数据','name' => 'trade','guard_name' => 'admin','icon' => 0,'pid' => 147,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 151,'title' => '交易统计','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 150,'sort' => 0,'url' => 'admin/data/trade/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],

            // 系统分组
            ['id' => 152,'title' => '系统','name' => 'system','guard_name' => 'admin','icon' => 'layui-icon-set','pid' => 0,'sort' => 10,'url' => '','jump' => 1,'spread' => 1,'show'  => 1,'status' => 1],
                
                // 设置管理
                ['id' => 153,'title' => '系统管理','name' => 'config','guard_name' => 'admin','icon' => 0,'pid' => 152,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 154,'title' => '网站设置','name' => 'website?groupName=基本','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/website','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 155,'title' => '配置管理','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 156,'title' => '添加配置','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 157,'title' => '保存添加配置','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 158,'title' => '编辑配置','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 159,'title' => '保存编辑配置','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 160,'title' => '更改配置状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 161,'title' => '更改多个配置状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 153,'sort' => 0,'url' => 'admin/system/config/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                
                // 菜单管理
                ['id' => 162,'title' => '菜单管理','name' => 'menu','guard_name' => 'admin','icon' => 0,'pid' => 152,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 163,'title' => '所有菜单','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 164,'title' => '添加菜单','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 165,'title' => '保存添加菜单','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 166,'title' => '编辑菜单','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 167,'title' => '保存编辑菜单','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 168,'title' => '更改菜单状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 169,'title' => '更改多个菜单状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 162,'sort' => 0,'url' => 'admin/system/menu/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 导航管理
                ['id' => 171,'title' => '导航管理','name' => 'navigation','guard_name' => 'admin','icon' => 0,'pid' => 152,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 172,'title' => '所有导航','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 173,'title' => '添加导航','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 174,'title' => '保存添加导航','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 175,'title' => '编辑导航','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 176,'title' => '保存编辑导航','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 177,'title' => '更改导航状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 178,'title' => '更改多个导航状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 171,'sort' => 0,'url' => 'admin/system/navigation/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 短信管理
                ['id' => 179,'title' => '短信管理','name' => 'sms','guard_name' => 'admin','icon' => 0,'pid' => 152,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 180,'title' => '短信列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 181,'title' => '发送短信','name' => 'send','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/send','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 182,'title' => '添加短信','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 183,'title' => '保存添加短信','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 184,'title' => '编辑短信','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 185,'title' => '保存编辑短信','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 186,'title' => '更改短信状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 187,'title' => '更改多个短信状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 179,'sort' => 0,'url' => 'admin/system/sms/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 分类管理
                ['id' => 188,'title' => '分类管理','name' => 'category','guard_name' => 'admin','icon' => 0,'pid' => 152,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 189,'title' => '分类列表','name' => 'index','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/index','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 190,'title' => '添加分类','name' => 'create','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/create','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 191,'title' => '保存添加分类','name' => 'store','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/store','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 192,'title' => '编辑分类','name' => 'edit','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/edit','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 193,'title' => '保存编辑分类','name' => 'save','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/save','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 194,'title' => '更改分类状态','name' => 'changeStatus','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/changeStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 195,'title' => '更改多个分类状态','name' => 'changeMultiStatus','guard_name' => 'admin','icon' => 0,'pid' => 188,'sort' => 0,'url' => 'admin/system/category/changeMultiStatus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],

                // 控制台里的菜单
                ['id' => 196,'title' => '基本权限','name' => 'getMenus','guard_name' => 'admin','icon' => 0,'pid' => 1,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 197,'title' => '获取权限内菜单','name' => 'getMenus','guard_name' => 'admin','icon' => 0,'pid' => 196,'sort' => 0,'url' => 'admin/index/getMenus','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 198,'title' => '获取登录管理员资料','name' => 'profile','guard_name' => 'admin','icon' => 0,'pid' => 196,'sort' => 0,'url' => 'admin/index/profile','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                ['id' => 199,'title' => '数据概览','name' => 'console','guard_name' => 'admin','icon' => 0,'pid' => 196,'sort' => 0,'url' => 'admin/index/console','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
                
                // 图片管理
                ['id' => 200,'title' => '图片管理','name' => 'picture','guard_name' => 'admin','icon' => 0,'pid' => 110,'sort' => 0,'url' => '','jump' => 0,'spread' => 1,'show'  => 1,'status' => 1],
                ['id' => 201,'title' => '编辑器图片弹出框','name' => 'dialog','guard_name' => 'admin','icon' => 0,'pid' => 200,'sort' => 0,'url' => 'admin/plugin/picture/dialog','jump' => 0,'spread' => 1,'show'  => 0,'status' => 1],
        ]);
    }
}
