<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['1', '0', 'api/admin/login', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['2', '0', 'api/admin/logout', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['3', '0', 'api/admin/loginErrorTimes', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['4', '0', 'api/admin/dashboard/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['5', '0', 'api/admin/account/info', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['6', '0', 'api/admin/account/profile', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['7', '0', 'api/admin/account/password', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['8', '0', 'api/admin/account/menus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['9', '0', 'api/admin/article/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['10', '0', 'api/admin/article/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['11', '0', 'api/admin/article/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['12', '0', 'api/admin/article/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['13', '0', 'api/admin/article/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['14', '0', 'api/admin/article/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['15', '0', 'api/admin/article/myPublished', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['16', '0', 'api/admin/page/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['17', '0', 'api/admin/page/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['18', '0', 'api/admin/page/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['19', '0', 'api/admin/page/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['20', '0', 'api/admin/page/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['21', '0', 'api/admin/page/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['22', '0', 'api/admin/user/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['23', '0', 'api/admin/user/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['24', '0', 'api/admin/user/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['25', '0', 'api/admin/user/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['26', '0', 'api/admin/user/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['27', '0', 'api/admin/user/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['28', '0', 'api/admin/user/recharge', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['29', '0', 'api/admin/admin/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['30', '0', 'api/admin/admin/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['31', '0', 'api/admin/admin/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['32', '0', 'api/admin/admin/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['33', '0', 'api/admin/admin/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['34', '0', 'api/admin/admin/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['35', '0', 'api/admin/permission/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['36', '0', 'api/admin/permission/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['37', '0', 'api/admin/permission/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['38', '0', 'api/admin/permission/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['39', '0', 'api/admin/permission/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['40', '0', 'api/admin/permission/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['41', '0', 'api/admin/role/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['42', '0', 'api/admin/role/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['43', '0', 'api/admin/role/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['44', '0', 'api/admin/role/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['45', '0', 'api/admin/role/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['46', '0', 'api/admin/role/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['47', '0', 'api/admin/banner/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['48', '0', 'api/admin/banner/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['49', '0', 'api/admin/banner/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['50', '0', 'api/admin/banner/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['51', '0', 'api/admin/banner/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['52', '0', 'api/admin/banner/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['53', '0', 'api/admin/bannerCategory/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['54', '0', 'api/admin/bannerCategory/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['55', '0', 'api/admin/bannerCategory/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['56', '0', 'api/admin/bannerCategory/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['57', '0', 'api/admin/bannerCategory/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['58', '0', 'api/admin/bannerCategory/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['59', '0', 'api/admin/comment/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['60', '0', 'api/admin/comment/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['61', '0', 'api/admin/comment/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['62', '0', 'api/admin/comment/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['63', '0', 'api/admin/link/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['64', '0', 'api/admin/link/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['65', '0', 'api/admin/link/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['66', '0', 'api/admin/link/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['67', '0', 'api/admin/link/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['68', '0', 'api/admin/link/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['69', '0', 'api/admin/printer/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['70', '0', 'api/admin/printer/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['71', '0', 'api/admin/printer/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['72', '0', 'api/admin/printer/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['73', '0', 'api/admin/printer/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['74', '0', 'api/admin/printer/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['75', '0', 'api/admin/config/website', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['76', '0', 'api/admin/config/saveWebsite', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['77', '0', 'api/admin/config/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['78', '0', 'api/admin/config/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['79', '0', 'api/admin/config/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['80', '0', 'api/admin/config/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['81', '0', 'api/admin/config/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['82', '0', 'api/admin/config/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['83', '0', 'api/admin/menu/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['84', '0', 'api/admin/menu/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['85', '0', 'api/admin/menu/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['86', '0', 'api/admin/menu/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['87', '0', 'api/admin/menu/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['88', '0', 'api/admin/menu/destroy', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['89', '0', 'api/admin/menu/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['90', '0', 'api/admin/navigation/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['91', '0', 'api/admin/navigation/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['92', '0', 'api/admin/navigation/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['93', '0', 'api/admin/navigation/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['94', '0', 'api/admin/navigation/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['95', '0', 'api/admin/navigation/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['96', '0', 'api/admin/category/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['97', '0', 'api/admin/category/create', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['98', '0', 'api/admin/category/store', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['99', '0', 'api/admin/category/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['100', '0', 'api/admin/category/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['101', '0', 'api/admin/category/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['102', '0', 'api/admin/sms/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['103', '0', 'api/admin/sms/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['104', '0', 'api/admin/sms/send', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['105', '0', 'api/admin/actionLog/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['106', '0', 'api/admin/actionLog/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['107', '0', 'api/admin/actionLog/export', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['108', '0', 'api/admin/picture/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['109', '0', 'api/admin/picture/upload', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['110', '0', 'api/admin/picture/download', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['111', '0', 'api/admin/picture/update', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['112', '0', 'api/admin/picture/edit', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['113', '0', 'api/admin/picture/save', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['114', '0', 'api/admin/picture/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['115', '0', 'api/admin/file/index', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['116', '0', 'api/admin/file/upload', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['117', '0', 'api/admin/file/download', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['118', '0', 'api/admin/file/update', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['119', '0', 'api/admin/file/changeStatus', 'admin']);
        DB::insert('INSERT INTO permissions (id,menu_id,name,guard_name) VALUES (?,?,?,?)', ['120', '0', 'api/admin/test/index', 'admin']);
    }
}
