<?php

use Illuminate\Database\Seeder;

class ConfigsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('configs')->insert([
            ['id' => 1,'title' => '网站名称','type' => 'text','name' => 'WEB_SITE_NAME','group_name' => '基本','value' => 'Admin CMF','remark' => '','status' => 1],
            ['id' => 2,'title' => '关键字','type' => 'text','name' => 'WEB_SITE_KEYWORDS','group_name' => '基本','value' => 'Admin CMF','remark' => '','status' => 1],
            ['id' => 3,'title' => '描述','type' => 'textarea','name' => 'WEB_SITE_DESCRIPTION','group_name' => '基本','value' => 'Admin CMF','remark' => '','status' => 1],
            ['id' => 4,'title' => 'Logo','type' => 'picture','name' => 'WEB_SITE_LOGO','group_name' => '基本','value' => '','remark' => '','status' => 1],
            ['id' => 5,'title' => '统计代码','type' => 'textarea','name' => 'WEB_SITE_SCRIPT','group_name' => '基本','value' => '','remark' => '','status' => 1],
            ['id' => 6,'title' => '网站版权','type' => 'text','name' => 'WEB_SITE_COPYRIGHT','group_name' => '基本','value' => '© Company 2018','remark' => '','status' => 1],
            ['id' => 7,'title' => '开启网站','type' => 'switch','name' => 'WEB_SITE_OPEN','group_name' => '基本','value' => '1','remark' => '','status' => 1],

            ['id' => 8,'title' => '服务器地址','type' => 'text','name' => 'EMAIL_HOST','group_name' => '邮件','value' => '','remark' => '','status' => 1],
            ['id' => 9,'title' => '服务器端口','type' => 'text','name' => 'EMAIL_PORT','group_name' => '邮件','value' => '','remark' => '','status' => 1],
            ['id' => 10,'title' => '发件人邮箱','type' => 'text','name' => 'EMAIL_USERNAME','group_name' => '邮件','value' => '','remark' => '','status' => 1],
            ['id' => 11,'title' => '发件人密码','type' => 'text','name' => 'EMAIL_PASSWORD','group_name' => '邮件','value' => '','remark' => '','status' => 1],

            ['id' => 12,'title' => 'app_key','type' => 'text','name' => 'ALIDAYU_APP_KEY','group_name' => '阿里云通信','value' => '','remark' => '','status' => 1],
            ['id' => 13,'title' => 'app_secret','type' => 'text','name' => 'ALIDAYU_APP_SECRET','group_name' => '阿里云通信','value' => '','remark' => '','status' => 1],
            ['id' => 14,'title' => '签名','type' => 'text','name' => 'ALIDAYU_SIGNNAME','group_name' => '阿里云通信','value' => '','remark' => '','status' => 1],
            ['id' => 15,'title' => '模板代码','type' => 'text','name' => 'ALIDAYU_TEMPLATE_CODE','group_name' => '阿里云通信','value' => '','remark' => '','status' => 1],

            ['id' => 16,'title' => 'key_id','type' => 'text','name' => 'OSS_ACCESS_KEY_ID','group_name' => '阿里云OSS','value' => '','remark' => '你的AccessKeyId','status' => 1],
            ['id' => 17,'title' => 'key_secret','type' => 'text','name' => 'OSS_ACCESS_KEY_SECRET','group_name' => '阿里云OSS','value' => '','remark' => '你的AccessKeySecret','status' => 1],
            ['id' => 18,'title' => 'endpoint','type' => 'text','name' => 'OSS_ENDPOINT','group_name' => '阿里云OSS','value' => '','remark' => '','status' => 1],
            ['id' => 19,'title' => 'bucket','type' => 'text','name' => 'OSS_BUCKET','group_name' => '阿里云OSS','value' => '','remark' => '','status' => 1],
            ['id' => 20,'title' => '自定义域名','type' => 'text','name' => 'OSS_MYDOMAIN','group_name' => '阿里云OSS','value' => '','remark' => '例如：oss.web.com','status' => 1],
            ['id' => 21,'title' => '开启云存储','type' => 'switch','name' => 'OSS_OPEN','group_name' => '阿里云OSS','value' => '1','remark' => '','status' => 1],

            ['id' => 22,'title' => '用户ID','type' => 'text','name' => 'SIOO_UID','group_name' => '希奥短信','value' => '','remark' => '','status' => 1],
            ['id' => 23,'title' => '企业代码','type' => 'text','name' => 'SIOO_CODE','group_name' => '希奥短信','value' => '','remark' => '','status' => 1],
            ['id' => 24,'title' => '用户密码','type' => 'text','name' => 'SIOO_PASSWORD','group_name' => '希奥短信','value' => '','remark' => '','status' => 1],

            ['id' => 25,'title' => 'app_id','type' => 'text','name' => 'WECHAT_PAY_APP_ID','group_name' => '微信支付','value' => '','remark' => 'JSAPI支付授权目录，例如：http://www.web.com/wechat/wechat/','status' => 1],
            ['id' => 26,'title' => 'merchant_id','type' => 'text','name' => 'WECHAT_PAY_MERCHANTID','group_name' => '微信支付','value' => '','remark' => '','status' => 1],
            ['id' => 27,'title' => 'key','type' => 'text','name' => 'WECHAT_PAY_KEY','group_name' => '微信支付','value' => '','remark' => '','status' => 1],
            ['id' => 28,'title' => 'apiclient_cert','type' => 'file','name' => 'WECHAT_PAY_APICLIENT_CERT','group_name' => '微信支付','value' => '','remark' => '','status' => 1],
            ['id' => 29,'title' => 'apiclient_key','type' => 'file','name' => 'WECHAT_PAY_APICLIENT_KEY','group_name' => '微信支付','value' => '','remark' => '','status' => 1],

            ['id' => 30,'title' => 'app_id','type' => 'text','name' => 'WECHAT_APP_PAY_APP_ID','group_name' => '微信APP支付','value' => '','remark' => '需要在开放平台申请','status' => 1],
            ['id' => 31,'title' => 'merchant_id','type' => 'text','name' => 'WECHAT_APP_PAY_MERCHANTID','group_name' => '微信APP支付','value' => '','remark' => '','status' => 1],
            ['id' => 32,'title' => 'key','type' => 'text','name' => 'WECHAT_APP_PAY_KEY','group_name' => '微信APP支付','value' => '','remark' => '','status' => 1],
            ['id' => 33,'title' => 'apiclient_cert','type' => 'file','name' => 'WECHAT_APP_PAY_APICLIENT_CERT','group_name' => '微信APP支付','value' => '','remark' => '','status' => 1],
            ['id' => 34,'title' => 'apiclient_key','type' => 'file','name' => 'WECHAT_APP_PAY_APICLIENT_KEY','group_name' => '微信APP支付','value' => '','remark' => '','status' => 1],

            ['id' => 35,'title' => 'sign_type','type' => 'text','name' => 'ALIPAY_SIGN_TYPE','group_name' => '支付宝','value' => 'RSA2','remark' => '','status' => 1],
            ['id' => 36,'title' => 'app_id','type' => 'text','name' => 'ALIPAY_APP_ID','group_name' => '支付宝','value' => '','remark' => '','status' => 1],
            ['id' => 37,'title' => 'private_key','type' => 'textarea','name' => 'ALIPAY_PRIVATE_KEY','group_name' => '支付宝','value' => '','remark' => '','status' => 1],
            ['id' => 38,'title' => 'ali_public_key','type' => 'textarea','name' => 'ALIPAY_PUBLIC_KEY','group_name' => '支付宝','value' => '','remark' => '','status' => 1],

            ['id' => 39,'title' => 'QQ Key','type' => 'text','name' => 'QQ_APP_KEY','group_name' => '社交登录','value' => '','remark' => '','status' => 1],
            ['id' => 40,'title' => 'QQ Secret','type' => 'text','name' => 'QQ_APP_SECRET','group_name' => '社交登录','value' => '','remark' => '','status' => 1],

            ['id' => 41,'title' => '微博 Key','type' => 'text','name' => 'WEIBO_APP_KEY','group_name' => '社交登录','value' => '','remark' => '','status' => 1],
            ['id' => 42,'title' => '微博 Secret','type' => 'text','name' => 'WEIBO_APP_SECRET','group_name' => '社交登录','value' => '','remark' => '','status' => 1],

            ['id' => 43,'title' => '微信 Key','type' => 'text','name' => 'WECHAT_APP_KEY','group_name' => '社交登录','value' => '','remark' => '','status' => 1],
            ['id' => 44,'title' => '微信 Secret','type' => 'text','name' => 'WECHAT_APP_SECRET','group_name' => '社交登录','value' => '','remark' => '','status' => 1],

            ['id' => 45,'title' => '开发者模式','type' => 'switch','name' => 'APP_DEBUG','group_name' => '基本','value' => '1','remark' => '','status' => 1],
        ]);
    }
}
