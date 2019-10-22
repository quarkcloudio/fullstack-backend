<?php

use Illuminate\Database\Seeder;
use App\Services\Helper;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert([
            [
                'id' => 1,
                'pid' => 0,
                'title' => '默认分类',
                'sort' => 0,
                'cover_id' =>0,
                'name' =>'default',
                'description' =>'默认分类',
                'count' =>0,
                'index_tpl' =>'article/index',
                'lists_tpl' =>'article/lists',
                'detail_tpl' =>'article/detail',
                'page_num' =>10,
                'status' =>1,
                'type' =>'ARTICLE',
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time())
            ]
       ]);
    }
}
