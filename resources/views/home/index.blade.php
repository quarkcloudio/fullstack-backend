@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.home')
<!-- 定义标题 -->
@section('title', '官网')
@section('keywords', '官网')
@section('description', '官网')

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
  <div class="row mb-2">
    @articles($article,'default',2,0,1)
    <div class="col-md-6"> 
        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"> 
            <div class="col p-4 d-flex flex-column position-static"> 
                <strong class="d-inline-block mb-2 text-primary">{{ $helper::getCategory($article['category_id']) }}</strong> 
                <h3 class="mb-0">{{ $helper::msubstr($article['title'],0,30) }}</h3> 
                <div class="mb-1 text-muted">
                    {{date('Y-m-d',strtotime($article['created_at']))}}
                </div> 
                <p class="card-text mb-auto">{{ $helper::msubstr($article['description'],0,50) }}</p> 
                <a href="/home/article/detail?id={{$article['id']}}" class="stretched-link">查看更多</a> 
            </div>
            <div class="col-auto d-none d-lg-block">
                <img class="bd-placeholder-img" width="200" height="246" src="{{ $helper::getPicture($article['cover_id']) }}" alt="First slide">
            </div>
        </div>
    </div>
    @endarticles
  </div>  
  <main role="main" class="container"> 
   <div class="row"> 
    <div class="col-md-8 blog-main"> 
     <h3 class="pb-4 mb-4 font-italic border-bottom"> 所有文章 </h3>
     @foreach($articles as $key => $article)
     <div class="blog-post"> 
      <h2 class="blog-post-title"><a href="/home/article/detail?id={{$article['id']}}">{{ $helper::msubstr($article['title'],0,30) }}</a></h2> 
      <p class="blog-post-meta">{{date('Y-m-d',strtotime($article['created_at']))}}</p> 
        <p>
            {!!strip_tags($article['description'])!!}
        </p>
     </div>
     <!-- /.blog-post -->
     @endforeach
     <nav class="blog-pagination">
         @if($category)
            {{ $articles->appends(['name'=>$category->name])->links() }}
         @else
            {{ $articles->links() }}
         @endif
     </nav>
    </div>
    <!-- /.blog-main --> 
    <aside class="col-md-4 blog-sidebar"> 
     <div class="p-4 mb-3 bg-light rounded"> 
      <h4 class="font-italic">关于我们</h4> 
      <p class="mb-0">
        @page($page,'aboutus')
            {!!strip_tags($page['content'])!!}
        @endpage
       </p> 
     </div> 
     <div class="p-4"> 
      <h4 class="font-italic">文章归档</h4> 
      <ol class="list-unstyled mb-0">
            @archives($archive,'posts')
                <li><a href="#">{{$archive['created_date']}}</a></li> 
            @endarchives
      </ol> 
     </div> 
     <div class="p-4"> 
      <h4 class="font-italic">友情链接</h4> 
      <ol class="list-unstyled">
        @links($link)
            <li><a href="{{$link['url']}}">{{$link['title']}}</a></li> 
        @endlinks
      </ol> 
     </div> 
    </aside>
    <!-- /.blog-sidebar --> 
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