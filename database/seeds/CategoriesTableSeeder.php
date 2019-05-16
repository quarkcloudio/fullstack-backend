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
                'title' => '新闻',
                'sort' => 0,
                'cover_id' =>0,
                'name' =>'news',
                'description' =>'新闻中心,包含有时政新闻、国内新闻、国际新闻、社会新闻、时事评论、新闻图片、新闻专题、新闻论坛、军事、历史、的专业时事报道门户网站。',
                'count' =>0,
                'index_tpl' =>'article/index',
                'lists_tpl' =>'article/lists',
                'detail_tpl' =>'article/detail',
                'page_num' =>10,
                'status' =>1,
                'type' =>'ARTICLE',
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time())
            ],
            [
                'id' => 2,
                'pid' => 0,
                'title' => '商城',
                'sort' => 0,
                'cover_id' =>0,
                'name' =>'mall',
                'description' =>'商品中心',
                'count' =>0,
                'index_tpl' =>'goods/index',
                'lists_tpl' =>'goods/lists',
                'detail_tpl' =>'goods/detail',
                'page_num' =>10,
                'status' =>1,
                'type' =>'GOODS',
                'created_at' => date('Y-m-d H:i:s',time()),
                'updated_at' => date('Y-m-d H:i:s',time())
            ],
       ]);
    }
}
