<?php

use Illuminate\Database\Seeder;

class NavigationsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('navigations')->insert([
            ['id' => 1,'pid' => '0','uid' => '0','title' => '首页','url' => '/home/index/index','sort' => 0,'status' => 1,'created_at' => date('Y-m-d H:i:s',time()),'updated_at' => date('Y-m-d H:i:s',time())],
            ['id' => 2,'pid' => '0','uid' => '0','title' => '新闻','url' => '/home/article/list?name=news','sort' => 0,'status' => 1,'created_at' => date('Y-m-d H:i:s',time()),'updated_at' => date('Y-m-d H:i:s',time())],
            ['id' => 3,'pid' => '0','uid' => '0','title' => '商城','url' => '/home/goods/list?name=mall','sort' => 0,'status' => 1,'created_at' => date('Y-m-d H:i:s',time()),'updated_at' => date('Y-m-d H:i:s',time())],
            ['id' => 4,'pid' => '0','uid' => '0','title' => '关于','url' => '/home/page/index?name=aboutus','sort' => 0,'status' => 1,'created_at' => date('Y-m-d H:i:s',time()),'updated_at' => date('Y-m-d H:i:s',time())],
       ]);
    }
}
