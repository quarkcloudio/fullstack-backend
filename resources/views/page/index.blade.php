@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.app')
<!-- 定义标题 -->
@section('title', $page->title)
@section('keywords', $page->description)
@section('description', $page->description)

@section('content')
  <div class="banner rounded"> 
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            @banners($banner,'IndexBanner')
                <a href="{{$banner['url']}}">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="{{ $helper::getPicture($banner['cover_id']) }}" alt="First slide">
                    </div>
                </a>
            @endbanners
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">上一个</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">下一个</span>
        </a>
    </div>
  </div> 
  <main role="main" class="container"> 
   <div class="row"> 
    <div class="col-md-12 blog-main"> 
     <h3 class="pb-4 mb-4 font-italic border-bottom"> {{$page->title}}</h3>
     <div class="blog-post">
        {!!$page->content!!}
     </div>
     <!-- /.blog-post -->
    </div>
    <!-- /.blog-main --> 
   </div>
   <!-- /.row --> 
  </main>
  <!-- /.container -->
@endsection

<!-- 自定义脚本 -->
@section('script')
<script>
</script>
@endsection