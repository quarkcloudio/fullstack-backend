@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', $goods->title)
@section('keywords', $goods->keywords)
@section('description', $goods->description)

@section('content')
    <link href="/static/libs/photo/css/style.css" rel="stylesheet">
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" style="padding: 1rem 1rem;">
        <div class="container">
            <h3>{{$category->title}}</h3>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-6">
                <div id="magnifier">
                    <div class="small-box">
                        <img src="{{$goods->cover_paths[0]}}" width="450" height="450" alt="#">
                        <span class="hover"></span>
                    </div>
                    <div class="thumbnail-box">
                    <a href="javascript:;" class="btn btn-prev"></a>
                    <a href="javascript:;" class="btn btn-next"></a>
                    <div class="list">
                        <ul class="wrapper">
                            @foreach($goods->cover_paths as $key => $cover_path)
                                <li class="item @if($key == 0) item-cur @endif" data-src="{{$cover_path}}"><img width="54" height="54" src="{{$cover_path}}" alt="#"></li>
                            @endforeach
                        </ul>
                    </div>
                    </div>
                    <div class="big-box">
                        <img src="{{$goods->cover_paths[0]}}" width="800" height="800" alt="#">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <p><h3>{{$goods->title}}</h3></p>
                <p>上架时间：{{date('Y-m-d',strtotime($goods->created_at))}} &nbsp;&nbsp;浏览：{{$goods->view}}</p>
                <p class="tag">
                    商品标签：
                    @if($goods->tags)
                        @foreach($goods->tags as $tag)
                            <span class="badge badge-secondary">{{$tag}}</span>
                        @endforeach
                    @endif
                </p>
                <p class="price">售价：<span id="nowPrice">¥{{$goods->skus[0]['now_price']}}</span>&nbsp;&nbsp;&nbsp;&nbsp;原价：<span id="prePrice" style="text-decoration:line-through;">¥{{$goods->skus[0]['pre_price']}}</span></p>
                <p class="num">已售：<span id="salesNum">{{$goods->skus[0]['sales_num']}}</span></p>

                @foreach($skuAttributes as $skuAttribute)
                    <p class="choose">
                        <label>{{$skuAttribute->name}}：</label>
                        @foreach($skuAttribute->option as $option)
                            <button data-sku="{{$skuAttribute->name}}:{{$option}}" type="button" class="btn btn-outline-info">{{$option}}</button>
                        @endforeach
                    </p>
                @endforeach
                <p>
                    <span style="float:left; margin-top:5px;">购买数量：</span>
                    <div class="input-group" style="width:120px; float:left;">
                        <span class="input-group-btn">
                            <button class="btn btn-secondary add" type="button">+</button>
                        </span>
                        <input type="text" class="form-control" style="text-align:center;" value=1 placeholder="1" aria-label="1">
                        <span class="input-group-btn">
                            <button class="btn btn-secondary minus" type="button">-</button>
                        </span>
                    </div>
                </p>
                <div style="clear:both;"></div>
                <br>
                <p>
                    <button type="button" class="btn btn-danger">加入购物车</button>
                    <button type="button" class="btn btn-success">一键购买</button>
                </p>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-md-12">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">商品介绍</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">规格与包装</a>
                        <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">商品评论</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <p>
                            {!!$goods->content!!}
                        </p>
                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <p>
                            @foreach($goods->spu_data as $key => $value)
                                <p class="choose">
                                    <label>{{$key}}：</label>{{$value}}
                                </p>
                            @endforeach
                        </p>
                    </div>
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                        <p>
                            {!!$goods->content!!}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    <hr>

    </div> <!-- /container -->
@endsection
<!-- 自定义脚本 -->
@section('script')
<script src="/static/libs/photo/js/magnifier.js"></script>
<script>
$(function () {
    $('#magnifier').magnifier();
});

$( function() {
    // 全局设置ajax同步提交
    $.ajaxSetup({
        async : false
    });
    $(".choose span").click( function() {
        if ( $(this).hasClass("current") ) return;
        $(this).nextAll().removeClass("current");
        $(this).prevAll().removeClass("current");
        $(this).addClass("current");

        // 检查商品
        checkGoods();                
    } );

    // 提交订单
    $('#buy').click(function() {

        // 提交前检查商品
        checkGoods();
    })

    // 添加到购物车
    $('#addCart').click(function() {
        // 获取skuid
        skuId = $('#skuId').val();
        // 获取要购买的数量
        buyNum = $('#buyNum').html();
        // 获取sku信息
        $.post("/pc/cart/store",{skuId:skuId,id:{{$goods->id}},num:buyNum},function(result) {
            if(result.status=='success') {
                alert(result.msg);
            } else {
                alert(result.msg);
            }
        });
    })

    function checkGoods()
    {
        // 遍历选中的属性
        var skuArray = new Array();
        $(".choose .current").each(function() {
            skuArray.push($(this).attr('data-sku'));
        });

        skuData = JSON.stringify(skuArray);

        // 当属性都选上的情况下
        if(skuArray.length == {{count($skuAttributes)}}) {
            // 获取sku信息
            $.get("/pc/goods/skuInfo",{skuData:skuData,id:{{$goods->id}}},function(result) {
                if(result.status=='success') {
                    if(!result.data) {
                        $('#buy').html('暂无货');
                        $('#buy').attr('href','#');
                        $('#skuId').val('');
                        return false;
                    }
                    if(result.data.stock_num<=0) {
                        $('#buy').html('暂无货');
                        $('#buy').attr('href','#');
                        $('#skuId').val('');
                    } else {
                        $('#buy').html('立即购买');
                        $('#nowPrice').html('¥'+result.data.now_price);
                        $('#salesNum').html(result.data.sales_num);
                        $('#skuId').val(result.data.id);
                        // 获取要购买的数量
                        buyNum = $('#buyNum').html();

                        data = new Array();
                        goods = new Array();

                        goods[0] = {{$goods->id}};
                        goods[1] = result.data.id;
                        goods[2] = parseInt(buyNum);

                        data.push(goods);
                        $('#buy').attr('href','/pc/order/info?data='+JSON.stringify(data));
                    }
                } else {
                    alert(result.msg);
                }
            });
        }
    }
    
} );
</script>
@endsection