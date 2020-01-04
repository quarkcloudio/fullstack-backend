@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', '支付成功')
@section('keywords', '支付成功')
@section('description', '支付成功')

@section('content')
<link rel="stylesheet" type="text/css" href="/pc/css/groupon.css" />
<link rel="stylesheet" type="text/css" href="/pc/css/common.css" />
<link rel="stylesheet" type="text/css" href="/pc/css/lovestore.css" />
<!--网站定位-->

<div class="box1200 bg-white box-shadow">
    <div class="common-local"><a href="/" target="_blank">商城首页</a>  >  订单支付</div>
</div>
<div style="width:100%" align=center>
      <div class="pay-status">
          <img src="/pc/images/groupon/pay_ok.png" class="pay-status-img">
          <h2 class="aui-text-danger">支付成功</h2>
          <p class="aui-font-size-12 aui-padded-t-15 aui-margin-t-15">您已成功支付（元）</p>
          <h1 style="font-size:34px;">{{$order['buyer_pay_amount']}}</h1>
      </div>
      <div class="aui-content-padded">
        <div class="aui-btn aui-btn-danger aui-btn-block aui-btn-sm">
            <a href="{{$url}}" style="color:#fff">完成</a>
        </div>
      </div>
</div>
@endsection

<!-- 自定义脚本 -->
@section('script')
  <script>
        setTimeout(function(){
            window.location.href="{{$url}}";
        }, 2000);
</script>
@endsection