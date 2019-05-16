@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.pc')
<!-- 定义标题 -->
@section('title', $page->title)
@section('keywords', $page->keywords)
@section('description', $page->description)

@section('content')
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" style="padding: 1rem 1rem;">
    <div class="container">
        <h3>{{$page->title}}</h3>
    </div>
    </div>

    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-12">
            {{$page->content}}
        </div>
    </div>

    <hr>

    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')

</script>
@endsection