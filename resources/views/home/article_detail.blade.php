@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', $article->title)
@section('keywords', $article->keywords)
@section('description', $article->description)

@section('content')
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" style="padding: 1rem 1rem;">
    <div class="container">
        <h3>{{$article->title}}</h3>
        <p>时间：{{date('Y-m-d',strtotime($article->created_at))}} &nbsp;&nbsp;浏览：{{$article->view}}</p>
    </div>
    </div>

    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-12">
            {!!$article->content!!}
        </div>
    </div>

    <hr>

    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')

</script>
@endsection