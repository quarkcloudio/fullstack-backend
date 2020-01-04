<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta name="renderer" content="webkit">
<meta name="Generator">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信支付</title>
</head>
<body>
<div class="msg_box">
	<p style="padding: 20px 0pt; text-align: center;">
		总计支付 ：<span class="red"style="color:red">{{$order['buyer_pay_amount']}}元</span>
	</p>
	<div style="text-align:center">
		<img src="/static/images/pay.jpg" />
	</div>
</div>
<script type="text/javascript">
	function onBridgeReady() {
		//调用微信JS api 支付
		WeixinJSBridge.invoke('getBrandWCPayRequest',
			{!!$jspay!!},
			function(res){
				WeixinJSBridge.log(res.err_msg);
				if(res.err_msg == "get_brand_wcpay_request:ok" ) {
					window.location.href="{{$targetUrl}}";
				} else {
					window.location.href="/cashier/wechat/errorPage?orderNo={{$order['order_no']}}";
				}
			}
		);
	}
	if (typeof WeixinJSBridge == "undefined") {
		if( document.addEventListener ) {
			document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
		} else if (document.attachEvent) {
			document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
			document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
		}
	} else {
		onBridgeReady();
	}
</script>
</body>
</html>

