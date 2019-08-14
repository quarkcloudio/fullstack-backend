<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <title>支付失败</title>
    <link rel="stylesheet" type="text/css" href="/mobile/css/aui.css" />
    <link rel="stylesheet" type="text/css" href="/mobile/css/api.css" />
    <!--购买系统样式表-->
    <link rel="stylesheet" type="text/css" href="/mobile/css/groupon.css" />

    <script type="text/javascript" src="/mobile/js/api.js"></script>
    <script type="text/javascript" src="/mobile/js/base.js"></script>
    <script type="text/javascript" src="/mobile/js/jquery.min.js"></script>
</head>
<body>
  <header class="aui-bar aui-bar-nav aui-bar-light groupon-header">
      <div class="aui-pull-left aui-btn" onClick="javascript :history.back(-1);">
          <span class="aui-iconfont aui-icon-left"></span>
      </div>
      <div class="aui-title">支付失败</div>
  </header>
  <article class="aui-content">
      <div class="pay-status">
          <img src="/mobile/images/groupon/pay_fail.png" class="pay-status-img">
          <h2 class="aui-text-danger">支付失败</h2>
          <p class="aui-font-size-12 aui-padded-t-15 aui-margin-t-15">未完成支付（港币）</p>
          <h1 style="font-size:34px;">{{$order['buyer_pay_amount']}}</h1>
      </div>
      <div class="aui-content-padded">
          <div class="aui-btn aui-btn-danger aui-btn-block aui-btn-sm"><a href="{{$url}}" style="color:#fff">继续完成支付</a></div>
      </div>
  </article>
</body>
</html>
