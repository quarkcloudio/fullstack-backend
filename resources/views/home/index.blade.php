@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', '官网')
@section('keywords', '官网')
@section('description', '官网')

@section('content')
    <!-- Main jumbotron for a primary marketing message or call to action -->
    @articles($article,'news',1,0,1)
    <div class="jumbotron">
    <div class="container">
        <h1 class="display-3">{{ $helper::msubstr($article['title'],0,30) }}</h1>
        <p>{{ $helper::msubstr($article['description'],0,160) }}</p>
        <p><a class="btn btn-primary btn-lg" href="/pc/article/detail?id={{$article['id']}}" role="button">查看更多 &raquo;</a></p>
    </div>
    </div>
    @endarticles
    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
    @articles($article,'news',3,0,0)
        <div class="col-md-4">
        <h2>{{ $helper::msubstr($article['title'],0,30) }}</h2>
        <p>{{ $helper::msubstr($article['description'],0,60) }}</p>
        <p><a class="btn btn-secondary" href="/pc/article/detail?id={{$article['id']}}" role="button">查看详情 &raquo;</a></p>
        </div>
    @endarticles
    </div>

    <hr>

    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')
<script>
</script>
@endsection