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
    @foreach($articles as $key => $article)
    <div class="row">
        <div class="col-md-12">
        <h2>{{$article->title}}</h2>
        <p>{{$article->description}}</p>
        <p><a class="btn btn-secondary" href="/pc/article/detail?id={{$article->id}}" role="button">查看详情 &raquo;</a></p>
        </div>
    </div>
    <hr>
    @endforeach
    <nav aria-label="Page navigation example">
     {{ $articles->appends(['name'=>$category->name])->links() }}
    </nav>
    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')

</script>
@endsection