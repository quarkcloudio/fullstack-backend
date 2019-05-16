@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', '搜索“'.$query.'”的结果')
@section('keywords', '搜索“'.$query.'”的结果')
@section('description', '搜索“'.$query.'”的结果')

@section('content')
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
    <div class="container">
        <h1 class="display-3">搜索“{{ $query }}”的结果</h1>
    </div>
    </div>

    <div class="container">
    <!-- Example row of columns -->
    @foreach($lists as $key => $list)
    <div class="row">
        <div class="col-md-12">
        <h2>{{$list->title}}</h2>
        <p>{{$list->description}}</p>
        <p><a class="btn btn-secondary" href="/pc/{{ $_GET['module'] }}/detail?id={{$list->id}}" role="button">查看详情 &raquo;</a></p>
        </div>
    </div>
    <hr>
    @endforeach
    <nav aria-label="Page navigation example">
     {{ $lists->appends(['query'=>$query,'module'=>$_GET['module']])->links() }}
    </nav>
    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')

</script>
@endsection