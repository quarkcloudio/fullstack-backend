<?php

use Illuminate\Database\Seeder;

class AdminsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory('App\Models\Admin',1)->create([
            'username' => 'administrator',
            'nickname' => '超级管理员',
            'email' => 'admin@yourweb.com',
            'phone' => '10086',
            'sex' => '1',
            'password' => bcrypt('123456')
        ]);
    }
}
