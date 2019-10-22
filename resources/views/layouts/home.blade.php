@inject('helper', 'App\Services\Helper')
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{{$helper::config('WEB_SITE_DESCRIPTION')}} - @yield('description')">
    <meta name="keyword" content="{{$helper::config('WEB_SITE_KEYWORDS')}} - @yield('keyword')">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="tangtanglove">
    <title>{{$helper::config('WEB_SITE_NAME')}} - @yield('title')</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/app.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    
    </style>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/css/style.css" rel="stylesheet">
  </head>
  <body>
<div class="container">
    @section('header')
    <header class="blog-header py-3">
        <nav class="navbar navbar-expand-md fixed-top bg-white border-bottom box-shadow">
            <a class="navbar-brand text-dark" href="#">{{$helper::config('WEB_SITE_NAME')}}</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    @navs($nav,0)
                        @if (isset($nav['_child']))
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-dark" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{!! $nav['title'] !!}</a>
                            <div class="dropdown-m
                            enu" aria-labelledby="dropdown01">
                                @foreach($nav['_child'] as $childKey=>$childValue)
                                    <a class="dropdown-item text-dark" href="{{ $childValue['url'] }}">{{ $childValue['title'] }}</a>
                                @endforeach
                            </div>
                        </li>
                        @else
                        <li class="nav-item {{ $helper::urlSelected($nav['url'],'active') }}">
                            <a class="nav-link text-dark" href="{{ $nav['url'] }}">{!! $nav['title'] !!} <span class="sr-only">{{ $helper::urlSelected($nav['url'],'(current)') }}</span></a>
                        </li>
                        @endif
                    @endnavs
                </ul>
                <form method="get" action="/pc/search/index" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" name="query" placeholder="Search" @if(isset($_GET['query']))value="{{$_GET['query']}}"@endif aria-label="Search">
                    <input class="form-control mr-sm-2" type="hidden" name="module" value="article" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
                </form>
                <ul class="navbar-nav" style="margin-left:20px;">
                @if(USERNAME)
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-dark" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">{{USERNAME}}</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item text-dark" href="/pc/user/index">个人中心</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-dark" href="/logout">退出</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="/pc/page/index?name=help">我的订单</a>
                    </li>
                @else
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="javascript:loginJump();">请登录</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="javascript:registerJump();">免费注册</a>
                    </li>
                @endif
                </ul>
            </div>
        </nav>
    </header>
    @show
    <main role="main">
        @yield('content')
    </main>
    @section('footer')
    <footer class="blog-footer">
        <p>{{$helper::config('WEB_SITE_COPYRIGHT')}} {!!$helper::config('WEB_SITE_SCRIPT')!!}</p>
    </footer>
    @show
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    @section('script')

    @show
  </body>
</html>