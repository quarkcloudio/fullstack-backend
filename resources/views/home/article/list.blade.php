@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.home')
<!-- 定义标题 -->
@section('title', $category->title)
@section('keywords', $category->description)
@section('description', $category->description)

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
    <div class="col-md-8 blog-main"> 
     <h3 class="pb-4 mb-4 font-italic border-bottom"> {{$category->title}} </h3>
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
        {{ $articles->appends(['name'=>$category->name])->links() }}
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