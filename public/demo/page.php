<?php
header('Content-type:text/html;charset=utf-8');
   $returnArray = array( // 返回字段
            "memberid" => $_REQUEST["memberid"], // 商户ID
            "orderid" =>  $_REQUEST["orderid"], // 订单号
            "amount" =>  $_REQUEST["amount"], // 交易金额
            "datetime" =>  $_REQUEST["datetime"], // 交易时间
            "transaction_id" =>  $_REQUEST["transaction_id"], // 流水号
            "returncode" => $_REQUEST["returncode"]
        );
        $md5key = "商户APIKEY"; //商户APIKEY,商户后台API管理获取
        ksort($returnArray);
        reset($returnArray);
        $md5str = "";
        foreach ($returnArray as $key => $val) {
            $md5str = $md5str . $key . "=" . $val . "&";
        }
        $sign = strtoupper(md5($md5str . "key=" . $md5key)); 
        if ($sign == $_REQUEST["sign"]) {
            if ($_REQUEST["returncode"] == "00") {
                   $str = "交易成功！订单号：".$_REQUEST["orderid"];
                   exit($str);
            }
        }
?>