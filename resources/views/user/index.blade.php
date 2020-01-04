@inject('helper', 'App\Services\Helper')
<!-- 引入模板布局 -->
@extends('layouts.app')
<!-- 定义标题 -->
@section('title', '用户中心')
@section('keywords', '用户中心')
@section('description', '用户中心')

@section('content')
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" style="padding: 1rem 1rem;">
    <div class="container">
        <h3>用户中心</h3>
    </div>
    </div>

    <div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-3">
            <div class="list-group">
                <a href="/pc/user/index" class="list-group-item list-group-item-action active">用户中心</a>
                <a href="/pc/user/profile" class="list-group-item list-group-item-action">个人资料</a>
                <a href="/pc/order/index" class="list-group-item list-group-item-action">我的订单</a>
                <a href="/pc/message/index" class="list-group-item list-group-item-action">我的消息</a>
                <a href="/pc/comment/index" class="list-group-item list-group-item-action">我的评论</a>
                <a href="/pc/user/safety" class="list-group-item list-group-item-action">账户安全</a>
                <a href="/pc/user/bind" class="list-group-item list-group-item-action">账号绑定</a>
                <a href="/pc/address/index" class="list-group-item list-group-item-action">收货地址</a>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            你好，<span style="color:#818182">{{ $user->name }}</span> 欢迎回来！
                            <span style="float:right">
                                余额：<span style="color:#dc3545">{{ $user->money }}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                积分：<span style="color:#28a745">{{ $user->point }}</span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
            <div class="col-sm-6">
                <div class="card">
                <div class="card-body">
                    <h4 class="card-title">个人资料</h4>
                    <a href="/pc/user/profile" class="btn btn-primary">查看详情</a>
                </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                <div class="card-body">
                    <h4 class="card-title">我的消息</h4>
                    <a href="/pc/message/index" class="btn btn-primary">查看详情</a>
                </div>
                </div>
            </div>
            </div>
        </div>
    </div>

    <hr>

    </div> <!-- /container -->
@endsection

<!-- 自定义脚本 -->
@section('script')

</script>
@endsection