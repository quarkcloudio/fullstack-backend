<?php

namespace App\Excels;

use Maatwebsite\Excel\Concerns\ToArray;

class Import implements ToArray
{
    // 重新父类实现
    public function array(array $array){
 
        return $array;
    }
}