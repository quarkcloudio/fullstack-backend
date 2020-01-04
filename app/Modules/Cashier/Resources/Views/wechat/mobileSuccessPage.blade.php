<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <title>支付成功</title>
    <link rel="stylesheet" type="text/css" href="/mobile/css/aui.css" />
    <link rel="stylesheet" type="text/css" href="/mobile/css/api.css" />
    <!--购买系统样式表-->
    <link rel="stylesheet" type="text/css" href="/mobile/css/groupon.css" />
    <script type="text/javascript" src="/mobile/js/api.js"></script>
    <script type="text/javascript" src="/mobile/js/base.js"></script>
    <script type="text/javascript" src="/mobile/js/jquery.min.js"></script>
</head>
<body>
  <article class="aui-content">
      <div class="pay-status">
          <img src="/mobile/images/groupon/pay_ok.png" class="pay-status-img">
          <h2 class="aui-text-danger">支付成功</h2>
          <p class="aui-font-size-12 aui-padded-t-15 aui-margin-t-15">您已成功支付（元）</p>
          <h1 style="font-size:34px;">{{$order['buyer_pay_amount']}}</h1>
      </div>
      <div class="aui-content-padded">
        <div class="aui-btn aui-btn-danger aui-btn-block aui-btn-sm">
            <a href="{{$url}}" style="color:#fff">完成</a>
        </div>
      </div>
  </article>
    <script>
        setTimeout(function(){ 
            window.location.href="{{$url}}";
        }, 2000);
    </script>
</body>
</html>