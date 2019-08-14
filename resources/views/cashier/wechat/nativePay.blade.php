@inject('helper', 'App\Services\Helper')

<div class="money" align=center>
    <div><span>支付金额：<font style="color:red">{{$totalFee}}</font>元</span></div>
</div>
<div class="container" align=center>
    <div class="page-header" style="float:center;width:33%;">
    <h1>请打开微信扫码支付</h1>
    </div>
    <div class="qrcode">
    
        <img src="/tool/qrcode?text={{$codeUrl}}" onload="getPayStatus()" />
    </div>
    <div class="info"></div>
</div>
<script type="text/javascript" src="/pc/js/jquery.min.js"></script>
<script>
    var orderNo = "{{$order['order_no']}}";
    // 定时检测是否已经支付
    function getPayStatus() {
        setInterval(function(){
            $.get("{{ route('cashier/wechat/getPayStatus') }}",{orderNo:orderNo},function(result) {
                if(result.status=='success') {
                    $('.info').html(result.msg);
                    window.location.href='/cashier/wechat/successPage?orderNo='+orderNo;
                } else {
                    $('.info').html(result.msg);
                }
            });
        }, 1000);
    }
</script>