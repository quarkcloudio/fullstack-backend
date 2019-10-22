<?php

use Illuminate\Database\Seeder;

class InstallSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('banner_categories')->insert([
            [
                'id' => 1,
                'title' => '首页轮播图',
                'name' =>'indexBanner',
                'width' =>1100,
                'height' =>300,
                'status' =>1,
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time())
            ]
       ]);

        DB::table('banners')->insert([
            [
                'id' => 1,
                'category_id' => 1,
                'title' => '首页轮播图',
                'url_type' =>1,
                'url' =>'#',
                'cover_id' =>'http://img6.bdstatic.com/img/image/public/shiyaocheng.jpg',
                'sort' =>0,
                'status' =>1,
                'deadline'=>null,
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time())
            ]
       ]);


        DB::table('links')->insert([
            [
                'id' => 1,
                'sort' => 0,
                'title' => '百度',
                'url' =>'http://www.baidu.com',
                'cover_id' =>1,
                'status' =>1,
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time())
            ]
       ]);
    }
}
