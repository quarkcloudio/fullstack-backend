@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', $category->title)
@section('keywords', $category->description)
@section('description', $category->description)

@section('content')
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
    <div class="container">
        <h1 class="display-3">{{$category->title}}</h1>
        <p>{{ $category->description }}</p>
    </div>
    </div>
    
    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
        @foreach($goods as $key => $good)
        <div class="col-sm-3">
            <div class="card">
                <a href="/pc/goods/detail?id={{$good->id}}" style="color:#333;text-decoration:none;">
                    <img class="card-img-top" src="{{ $helper::getPicture($good['cover_ids']) }}" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">{{$good->title}}</h4>
                        <p class="card-text">{{$good->description}}</p>
                    </div>
                </a>
                <div class="card-footer">
                    <span style="float:left;color:red;">￥{{$good['sku_data'][0]['now_price']}}</span>
                    <span style="float:left;margin-left:10px;text-decoration:line-through;">{{$good['sku_data'][0]['pre_price']}}</span>
                    <span style="float:right;">
                        <a @if(!empty($helper::getUsername()))
                            href="javascript:addToCart({{$good->id}},{{$good['sku_data'][0]['id']}});"
                            @else
                            href="javascript:loginJump('yes');"
                        @endif >
                            <small class="text-muted">加入购物车</small>
                        </a>
                    </span>
                </div>
            </div>
        </div>
        @endforeach
    </div>

    <nav aria-label="Page navigation example">
     {{ $goods->appends(['name'=>$category->name])->links() }}
    </nav>
    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')
<script>
    // 商品加入到购物车
    function addToCart(goodId,skuId) {
        // ajax请求
        $.post("{{ route('pc/cart/store') }}",{id:goodId,skuId:skuId,num:1},function(result) {
            if(result.status=='success') {
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        });
    }
</script>
@endsection