@inject('helper', 'App\Services\Helper')
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{{$helper::getConfig('WEB_SITE_DESCRIPTION')}} - @yield('description')">
    <meta name="keyword" content="{{$helper::getConfig('WEB_SITE_KEYWORDS')}} - @yield('keyword')">
    <meta name="author" content="tangtanglove">
    <link rel="icon" href="/favicon.ico">

    <title>{{$helper::getConfig('WEB_SITE_NAME')}} - @yield('title')</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/libs/bootstrap-4.0.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/home/css/style.css" rel="stylesheet">
  </head>

  <body>
    @section('header')
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">{{$helper::getConfig('WEB_SITE_NAME')}}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                @navs(nav,0)
                    @if (isset($nav['_child']))
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{!! $nav['title'] !!}</a>
                        <div class="dropdown-m
                        enu" aria-labelledby="dropdown01">
                            @foreach($nav['_child'] as $childKey=>$childValue)
                                <a class="dropdown-item" href="{{ $childValue['url'] }}">{{ $childValue['title'] }}</a>
                            @endforeach
                        </div>
                    </li>
                    @else
                    <li class="nav-item {{ $helper::active($nav['url'],'active') }}">
                        <a class="nav-link" href="{{ $nav['url'] }}">{!! $nav['title'] !!} <span class="sr-only">{{ $helper::active($nav['url'],'(current)') }}</span></a>
                    </li>
                    @endif
                @endnavs
            </ul>
            <form method="get" action="/home/search/index" class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" name="query" placeholder="Search" @if(isset($_GET['query']))value="{{$_GET['query']}}"@endif aria-label="Search">
                <input class="form-control mr-sm-2" type="hidden" name="module" value="article" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
            </form>

            <ul class="navbar-nav" style="margin-left:20px;">
            <li class="nav-item dropdown" style="width:130px;">
                <a class="nav-link dropdown-toggle menu-cart-dropdown" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">我的购物车</a>
                <div class="dropdown-menu">
                    <div class="menu-cart-list"></div>
                    <div class="dropdown-divider"></div>
                    <div style="width:360px;">
                        <span style="float:left;margin-left:10px;font-size:12px;">合计：￥<span id="menu-cart-total-money"></span></span><a style="float:right;margin-right:10px;font-size:12px;" href="/home/cart/index">去购物车</a>
                    </div>
                </div>
            </li>

            @if($username)
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">{{$username}}</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/home/user/index">个人中心</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/logout">退出</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/home/page/index?name=help">我的订单</a>
                </li>
            @else
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loginJump();">请登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:registerJump();">免费注册</a>
                </li>
            @endif
                <li class="nav-item">
                    <a class="nav-link" href="/home/page/index?name=help">帮助中心</a>
                </li>
            </ul>
        </div>
        </nav>
    @show
    <main role="main">
        @yield('content')
    </main>
    @section('footer')
        <footer class="container">
            <p>{{$helper::getConfig('WEB_SITE_COPYRIGHT')}}</p>
            {!!$helper::getConfig('WEB_SITE_SCRIPT')!!}
        </footer>
    @show
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/libs/jquery/jquery.min.js"></script>
    <script src="/static/libs/popper/popper.min.js"></script>
    <script src="/static/libs/bootstrap-4.0.0/js/bootstrap.min.js"></script>
    <script src="/static/libs/layer/layer.js"></script>
    <script>

    // 登录跳转
    function loginJump(alertbox = 'no') {
        if(alertbox == 'yes') {
            layer.open({
                title: '登录',
                type: 2,
                area: ['360px', '500px'],
                skin: 'layui-layer-rim', //
                content: ['/loginBox', 'no']
            });
        } else {
            window.location.href="/login?returnUrl="+window.location.href;
        }
    }

    // 注册跳转
    function registerJump(alertbox = 'no') {
        if(alertbox == 'yes') {
            layer.open({
                title: '注册',
                type: 2,
                area: ['360px', '500px'],
                skin: 'layui-layer-rim', //
                content: ['/registerBox', 'no']
            });
        } else {
            window.location.href="/register?returnUrl="+window.location.href;
        }
    }

    $('.menu-cart-list').on('click','.menu-cart-item',function(event){
        event.stopPropagation();
    });

    $('.menu-cart-list').on('click','.menu-cart-delete',function(event){
        event.stopPropagation();
    });

    function cartDelete(id) {
        // ajax请求
        $.post("{{ route('home/cart/destroy') }}",{id:id},function(result) {
            if(result.status=='success') {
                getCartList();
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        });

        return false;
    }

    $('.menu-cart-dropdown').click(function() {
        getCartList()
    })

    // 获取购物车列表
    function getCartList() {
        // ajax请求
        $.ajax({
            url:'{{ route('home/cart/index') }}',
            type:'POST', //GET
            async:true,    //或false,是否异步
            timeout:5000,    //超时时间
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success:function(result,textStatus,jqXHR){
                if(result.status=='success') {

                    html = '';
                    html1 = '<div class=\"menu-cart-box\"><a href=\"';
                    html2 = '\"><img class=\"menu-cart-img\" src=\"';
                    html3 = '\" /><span class=\"menu-cart-item menu-cart-title\">';
                    html4 = '</span></a><span class=\"menu-cart-item\">￥';
                    html5 = '</span><span class=\"menu-cart-item\">×</span>\<span class=\"menu-cart-item\">';
                    html6 = '</span><a class=\"menu-cart-delete\" id=\"';
                    html7 = '\" href=\"javascript:cartDelete(';
                    html8 = ');\">删除</a></div>';

                    if(result.data.shoppingCarts != '') {
                        jQuery.each(result.data.shoppingCarts, function(i, val) {
                            url = '/home/goods/detail?id='+val.info.id;
                            img = val.info.cover_path;
                            title = val.info.title;
                            price = val.sku.now_price;
                            num = val.num;

                            html = html + html1 + url + html2 + img + html3 + title + html4 + price + html5 + num + html6 +val.id + html7 +val.id + html8;
                        });
                    } else {
                        html = '<div class=\"menu-cart-box\"><span class=\"menu-cart-empty\">购物车，啥也没有！</span></div>';
                    }

                    $('.menu-cart-list').html(html);

                    $('#menu-cart-total-money').html(result.data.totalMoney);
                } else {
                    layer.msg(result.msg);
                }
            },
            error:function(xhr,textStatus){
                html = '';
                if(xhr.status == 401) {
                    html = '<div class=\"menu-cart-box\"><span class=\"menu-cart-empty\">您还未登录，请先登录！</span></div>';
                }
                $('.menu-cart-list').html(html);
                $('#menu-cart-total-money').html(0.00);
            }
        })
    }

    </script>
    @section('script')

    @show
  </body>
</html>
