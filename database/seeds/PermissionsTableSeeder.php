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
        Permission::insert([
            ['id' => 1,'name' => 'admin/index/index','guard_name' => 'admin'],
            ['id' => 2,'name' => 'admin/content/article/index','guard_name' => 'admin'],
            ['id' => 3,'name' => 'admin/content/article/create','guard_name' => 'admin'],

            ['id' => 4,'name' => 'admin/content/article/store','guard_name' => 'admin'],
            ['id' => 5,'name' => 'admin/content/article/edit','guard_name' => 'admin'],
            ['id' => 6,'name' => 'admin/content/article/save','guard_name' => 'admin'],

            ['id' => 7,'name' => 'admin/content/article/changeStatus','guard_name' => 'admin'],
            ['id' => 8,'name' => 'admin/content/article/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 9,'name' => 'admin/content/article/categoryIndex','guard_name' => 'admin'],
            ['id' => 10,'name' => 'admin/content/article/categoryCreate','guard_name' => 'admin'],
            ['id' => 11,'name' => 'admin/content/article/categoryStore','guard_name' => 'admin'],
            ['id' => 12,'name' => 'admin/content/article/categoryEdit','guard_name' => 'admin'],
            ['id' => 13,'name' => 'admin/content/article/categorySave','guard_name' => 'admin'],
            ['id' => 14,'name' => 'admin/content/article/categoryChangeStatus','guard_name' => 'admin'],

            ['id' => 15,'name' => 'admin/content/article/categoryChangeMultiStatus','guard_name' => 'admin'],
            ['id' => 16,'name' => 'admin/content/page/index','guard_name' => 'admin'],
            ['id' => 17,'name' => 'admin/content/page/create','guard_name' => 'admin'],
            ['id' => 18,'name' => 'admin/content/page/store','guard_name' => 'admin'],
            ['id' => 19,'name' => 'admin/content/page/edit','guard_name' => 'admin'],
            ['id' => 20,'name' => 'admin/content/page/save','guard_name' => 'admin'],
            ['id' => 21,'name' => 'admin/content/page/changeStatus','guard_name' => 'admin'],
            ['id' => 22,'name' => 'admin/content/page/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 62,'name' => 'admin/user/user/index','guard_name' => 'admin'],
            ['id' => 63,'name' => 'admin/user/user/store','guard_name' => 'admin'],
            ['id' => 64,'name' => 'admin/user/user/edit','guard_name' => 'admin'],
            ['id' => 65,'name' => 'admin/user/user/changeStatus','guard_name' => 'admin'],
            ['id' => 66,'name' => 'admin/user/user/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 67,'name' => 'admin/user/user/recharge','guard_name' => 'admin'],
            ['id' => 68,'name' => 'admin/user/admin/index','guard_name' => 'admin'],
            ['id' => 69,'name' => 'admin/user/admin/store','guard_name' => 'admin'],
            ['id' => 70,'name' => 'admin/user/admin/edit','guard_name' => 'admin'],
            ['id' => 71,'name' => 'admin/user/admin/save','guard_name' => 'admin'],
            ['id' => 72,'name' => 'admin/user/admin/changeStatus','guard_name' => 'admin'],
            ['id' => 73,'name' => 'admin/user/admin/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 74,'name' => 'admin/user/admin/givePermissionTo','guard_name' => 'admin'],
            ['id' => 75,'name' => 'admin/user/admin/revokePermissionTo','guard_name' => 'admin'],
            ['id' => 76,'name' => 'admin/user/admin/syncPermissions','guard_name' => 'admin'],
            ['id' => 77,'name' => 'admin/user/admin/assignRole','guard_name' => 'admin'],
            ['id' => 78,'name' => 'admin/user/admin/removeRole','guard_name' => 'admin'],
            ['id' => 79,'name' => 'admin/user/admin/syncRoles','guard_name' => 'admin'],
            ['id' => 80,'name' => 'admin/user/admin/profile','guard_name' => 'admin'],

            ['id' => 81,'name' => 'admin/user/admin/saveProfile','guard_name' => 'admin'],
            ['id' => 82,'name' => 'admin/user/admin/permissionIndex','guard_name' => 'admin'],
            ['id' => 83,'name' => 'admin/user/admin/permissionCreate','guard_name' => 'admin'],
            ['id' => 84,'name' => 'admin/user/admin/permissionStore','guard_name' => 'admin'],
            ['id' => 85,'name' => 'admin/user/admin/permissionEdit','guard_name' => 'admin'],
            ['id' => 86,'name' => 'admin/user/admin/permissionSave','guard_name' => 'admin'],
            ['id' => 87,'name' => 'admin/user/admin/permissionChangeStatus','guard_name' => 'admin'],
            
            ['id' => 88,'name' => 'admin/user/admin/permissionChangeMultiStatus','guard_name' => 'admin'],
            ['id' => 89,'name' => 'admin/user/admin/roleIndex','guard_name' => 'admin'],
            ['id' => 90,'name' => 'admin/user/admin/roleCreate','guard_name' => 'admin'],
            ['id' => 91,'name' => 'admin/user/admin/roleStore','guard_name' => 'admin'],
            ['id' => 92,'name' => 'admin/user/admin/roleEdit','guard_name' => 'admin'],
            ['id' => 93,'name' => 'admin/user/admin/roleSave','guard_name' => 'admin'],
            ['id' => 94,'name' => 'admin/user/admin/roleChangeStatus','guard_name' => 'admin'],
            ['id' => 95,'name' => 'admin/user/admin/roleChangeMultiStatus','guard_name' => 'admin'],
            ['id' => 96,'name' => 'admin/user/admin/givePermissionToRole','guard_name' => 'admin'],

            ['id' => 97,'name' => 'admin/user/admin/revokePermissionToRole','guard_name' => 'admin'],
            ['id' => 98,'name' => 'admin/log/user/index','guard_name' => 'admin'],
            ['id' => 99,'name' => 'admin/log/user/changeStatus','guard_name' => 'admin'],
            ['id' => 100,'name' => 'admin/log/user/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 101,'name' => 'admin/plugin/banner/index','guard_name' => 'admin'],
            ['id' => 102,'name' => 'admin/plugin/banner/create','guard_name' => 'admin'],
            ['id' => 103,'name' => 'admin/plugin/banner/store','guard_name' => 'admin'],
            ['id' => 104,'name' => 'admin/plugin/banner/edit','guard_name' => 'admin'],
            ['id' => 105,'name' => 'admin/plugin/banner/save','guard_name' => 'admin'],
            
            ['id' => 106,'name' => 'admin/plugin/banner/changeStatus','guard_name' => 'admin'],
            ['id' => 107,'name' => 'admin/plugin/banner/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 108,'name' => 'admin/plugin/banner/categoryIndex','guard_name' => 'admin'],
            ['id' => 109,'name' => 'admin/plugin/banner/categoryCreate','guard_name' => 'admin'],
            ['id' => 110,'name' => 'admin/plugin/banner/categoryStore','guard_name' => 'admin'],
            ['id' => 111,'name' => 'admin/plugin/banner/categoryEdit','guard_name' => 'admin'],
            ['id' => 112,'name' => 'admin/plugin/banner/categorySave','guard_name' => 'admin'],

            ['id' => 113,'name' => 'admin/plugin/banner/categoryChangeStatus','guard_name' => 'admin'],
            ['id' => 114,'name' => 'admin/plugin/banner/categoryChangeMultiStatus','guard_name' => 'admin'],
            ['id' => 115,'name' => 'admin/plugin/link/index','guard_name' => 'admin'],
            ['id' => 116,'name' => 'admin/plugin/link/create','guard_name' => 'admin'],
            ['id' => 117,'name' => 'admin/plugin/link/store','guard_name' => 'admin'],
            ['id' => 118,'name' => 'admin/plugin/link/edit','guard_name' => 'admin'],
            ['id' => 119,'name' => 'admin/plugin/link/save','guard_name' => 'admin'],
            ['id' => 120,'name' => 'admin/plugin/link/changeStatus','guard_name' => 'admin'],
            ['id' => 121,'name' => 'admin/plugin/link/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 122,'name' => 'admin/plugin/file/index','guard_name' => 'admin'],
            ['id' => 123,'name' => 'admin/plugin/file/upload','guard_name' => 'admin'],
            ['id' => 124,'name' => 'admin/plugin/file/update','guard_name' => 'admin'],
            ['id' => 125,'name' => 'admin/plugin/file/changeStatus','guard_name' => 'admin'],
            ['id' => 126,'name' => 'admin/plugin/file/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 127,'name' => 'admin/plugin/picture/index','guard_name' => 'admin'],
            ['id' => 128,'name' => 'admin/plugin/picture/dialog','guard_name' => 'admin'],
            ['id' => 129,'name' => 'admin/plugin/picture/upload','guard_name' => 'admin'],
            ['id' => 130,'name' => 'admin/plugin/picture/update','guard_name' => 'admin'],
            ['id' => 131,'name' => 'admin/plugin/picture/edit','guard_name' => 'admin'],
            ['id' => 132,'name' => 'admin/plugin/picture/save','guard_name' => 'admin'],
            ['id' => 133,'name' => 'admin/plugin/picture/changeStatus','guard_name' => 'admin'],

            ['id' => 134,'name' => 'admin/data/user/index','guard_name' => 'admin'],
            ['id' => 135,'name' => 'admin/data/trade/index','guard_name' => 'admin'],
            ['id' => 136,'name' => 'admin/system/config/website','guard_name' => 'admin'],
            ['id' => 137,'name' => 'admin/system/config/index','guard_name' => 'admin'],
            ['id' => 138,'name' => 'admin/system/config/create','guard_name' => 'admin'],
            ['id' => 139,'name' => 'admin/system/config/store','guard_name' => 'admin'],
            ['id' => 140,'name' => 'admin/system/config/edit','guard_name' => 'admin'],
            
            ['id' => 141,'name' => 'admin/system/config/save','guard_name' => 'admin'],
            ['id' => 142,'name' => 'admin/system/config/changeStatus','guard_name' => 'admin'],
            ['id' => 143,'name' => 'admin/system/config/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 144,'name' => 'admin/system/menu/index','guard_name' => 'admin'],
            ['id' => 145,'name' => 'admin/system/menu/create','guard_name' => 'admin'],
            ['id' => 146,'name' => 'admin/system/menu/store','guard_name' => 'admin'],
            ['id' => 147,'name' => 'admin/system/menu/edit','guard_name' => 'admin'],
            ['id' => 148,'name' => 'admin/system/menu/save','guard_name' => 'admin'],
            ['id' => 149,'name' => 'admin/system/menu/changeStatus','guard_name' => 'admin'],
            ['id' => 150,'name' => 'admin/system/menu/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 151,'name' => 'admin/system/menu/getMenus','guard_name' => 'admin'],

            ['id' => 152,'name' => 'admin/system/navigation/index','guard_name' => 'admin'],
            ['id' => 153,'name' => 'admin/system/navigation/create','guard_name' => 'admin'],
            ['id' => 154,'name' => 'admin/system/navigation/store','guard_name' => 'admin'],

            ['id' => 155,'name' => 'admin/system/navigation/edit','guard_name' => 'admin'],
            ['id' => 156,'name' => 'admin/system/navigation/save','guard_name' => 'admin'],
            ['id' => 157,'name' => 'admin/system/navigation/changeStatus','guard_name' => 'admin'],
            ['id' => 158,'name' => 'admin/system/navigation/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 159,'name' => 'admin/system/sms/index','guard_name' => 'admin'],
            ['id' => 160,'name' => 'admin/system/sms/send','guard_name' => 'admin'],
            ['id' => 161,'name' => 'admin/system/sms/create','guard_name' => 'admin'],

            ['id' => 162,'name' => 'admin/system/sms/store','guard_name' => 'admin'],
            ['id' => 163,'name' => 'admin/system/sms/edit','guard_name' => 'admin'],
            ['id' => 164,'name' => 'admin/system/sms/save','guard_name' => 'admin'],
            ['id' => 165,'name' => 'admin/system/sms/changeStatus','guard_name' => 'admin'],
            ['id' => 166,'name' => 'admin/system/sms/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 167,'name' => 'admin/system/category/index','guard_name' => 'admin'],
            ['id' => 168,'name' => 'admin/system/category/create','guard_name' => 'admin'],
            ['id' => 169,'name' => 'admin/system/category/store','guard_name' => 'admin'],

            ['id' => 170,'name' => 'admin/system/category/edit','guard_name' => 'admin'],
            ['id' => 171,'name' => 'admin/system/category/save','guard_name' => 'admin'],
            ['id' => 172,'name' => 'admin/system/category/changeStatus','guard_name' => 'admin'],
            ['id' => 173,'name' => 'admin/system/category/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 174,'name' => 'admin/index/getMenus','guard_name' => 'admin'],
            ['id' => 175,'name' => 'admin/index/profile','guard_name' => 'admin'],
            ['id' => 176,'name' => 'admin/index/console','guard_name' => 'admin'],

            ['id' => 179,'name' => 'admin/plugin/picture/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 180,'name' => 'admin/plugin/picture/dialog','guard_name' => 'admin'],

            ['id' => 211,'name' => 'admin/plugin/printer/index','guard_name' => 'admin'],
            ['id' => 212,'name' => 'admin/plugin/printer/create','guard_name' => 'admin'],
            ['id' => 213,'name' => 'admin/plugin/printer/store','guard_name' => 'admin'],
            ['id' => 214,'name' => 'admin/plugin/printer/edit','guard_name' => 'admin'],
            ['id' => 215,'name' => 'admin/plugin/printer/save','guard_name' => 'admin'],
            ['id' => 216,'name' => 'admin/plugin/printer/changeStatus','guard_name' => 'admin'],
            ['id' => 217,'name' => 'admin/plugin/printer/changeMultiStatus','guard_name' => 'admin'],
            ['id' => 219,'name' => 'admin/plugin/printer/test','guard_name' => 'admin'],

            ['id' => 220,'name' => 'admin/financial/order/index','guard_name' => 'admin'],
            ['id' => 221,'name' => 'admin/financial/order/edit','guard_name' => 'admin'],
            ['id' => 222,'name' => 'admin/financial/order/save','guard_name' => 'admin'],
            ['id' => 223,'name' => 'admin/financial/order/changeStatus','guard_name' => 'admin'],
            ['id' => 224,'name' => 'admin/financial/order/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 225,'name' => 'admin/financial/settlement/unsettled','guard_name' => 'admin'],
            ['id' => 226,'name' => 'admin/financial/settlement/settled','guard_name' => 'admin'],
            ['id' => 227,'name' => 'admin/financial/settlement/detailList','guard_name' => 'admin'],
            ['id' => 228,'name' => 'admin/financial/settlement/changeStatus','guard_name' => 'admin'],
            ['id' => 229,'name' => 'admin/financial/settlement/changeMultiStatus','guard_name' => 'admin'],

            ['id' => 230,'name' => 'admin/user/user/suggest','guard_name' => 'admin'],
            ['id' => 231,'name' => 'admin/user/user/givePermissionTo','guard_name' => 'admin'],
            ['id' => 232,'name' => 'admin/user/user/revokePermissionTo','guard_name' => 'admin'],
            ['id' => 233,'name' => 'admin/user/user/syncPermissions','guard_name' => 'admin'],
            ['id' => 234,'name' => 'admin/user/user/assignRole','guard_name' => 'admin'],
            ['id' => 235,'name' => 'admin/user/user/removeRole','guard_name' => 'admin'],
            ['id' => 236,'name' => 'admin/user/user/syncRoles','guard_name' => 'admin'],

            ['id' => 237,'name' => 'admin/user/user/permissionIndex','guard_name' => 'admin'],
            ['id' => 238,'name' => 'admin/user/user/permissionCreate','guard_name' => 'admin'],
            ['id' => 239,'name' => 'admin/user/user/permissionStore','guard_name' => 'admin'],
            ['id' => 240,'name' => 'admin/user/user/permissionEdit','guard_name' => 'admin'],
            ['id' => 241,'name' => 'admin/user/user/permissionSave','guard_name' => 'admin'],
            ['id' => 242,'name' => 'admin/user/user/permissionChangeStatus','guard_name' => 'admin'],
            ['id' => 243,'name' => 'admin/user/user/permissionChangeMultiStatus','guard_name' => 'admin'],

            ['id' => 244,'name' => 'admin/user/user/roleIndex','guard_name' => 'admin'],
            ['id' => 245,'name' => 'admin/user/user/roleCreate','guard_name' => 'admin'],
            ['id' => 246,'name' => 'admin/user/user/roleStore','guard_name' => 'admin'],
            ['id' => 247,'name' => 'admin/user/user/roleEdit','guard_name' => 'admin'],
            ['id' => 248,'name' => 'admin/user/user/roleSave','guard_name' => 'admin'],
            ['id' => 249,'name' => 'admin/user/user/roleChangeStatus','guard_name' => 'admin'],
            ['id' => 250,'name' => 'admin/user/user/roleChangeMultiStatus','guard_name' => 'admin'],
            ['id' => 251,'name' => 'admin/user/user/givePermissionToRole','guard_name' => 'admin'],
            ['id' => 252,'name' => 'admin/user/user/revokePermissionToRole','guard_name' => 'admin'],

            ['id' => 281,'name' => 'admin/system/config/siteSave','guard_name' => 'admin'],

            ['id' => 282,'name' => 'admin/plugin/comment/index','guard_name' => 'admin'],
            ['id' => 283,'name' => 'admin/plugin/comment/edit','guard_name' => 'admin'],
            ['id' => 284,'name' => 'admin/plugin/comment/save','guard_name' => 'admin'],
            ['id' => 285,'name' => 'admin/plugin/comment/changeStatus','guard_name' => 'admin'],
            ['id' => 286,'name' => 'admin/plugin/comment/changeMultiStatus','guard_name' => 'admin'],
       ]);
    }
}
