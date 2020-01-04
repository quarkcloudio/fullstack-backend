@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.app')
<!-- 定义标题 -->
@section('title', '用户登录')
@section('keywords', '用户登录')
@section('description', '用户登录')

@section('content')
  <main role="main" class="container" style="margin-top:40px;"> 
   <div class="row"> 
    <div class="col-md-12 blog-main"> 
     <div class="blog-post">
        <div class="card">
            <div class="card-header">用户登录</div>
            <div class="card-body">
                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="form-group row">
                        <label for="username" class="col-md-4 col-form-label text-md-right">账号</label>
                        <div class="col-md-6">
                            <input id="username" type="text" placeholder="邮箱/用户名/登录手机" class="form-control" name="username" value="{{ old('username') }}" required autofocus>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="password" class="col-md-4 col-form-label text-md-right">密码</label>
                        <div class="col-md-6">
                            <input id="password" type="password" placeholder="密码" class="form-control" name="password" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="captcha" class="col-md-4 col-form-label text-md-right">验证码</label>
                        <div class="col-md-4">
                            <input id="captcha" type="text" placeholder="验证码" class="form-control" name="captcha">
                        </div>
                        <div class="col-md-2">
                            <img src="{{ route('tools/captcha/getImage') }}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6 offset-md-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="form-check-label" for="remember">
                                    记住密码
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-0">
                        <div class="col-md-8 offset-md-4">
                            <button type="submit" class="btn btn-primary">
                                登录
                            </button>
                            <a class="btn btn-link">
                                忘记密码？
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
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