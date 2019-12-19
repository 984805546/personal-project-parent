<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>后台管理</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/static/zui/css/zui.min.css" rel="stylesheet">
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="/static/js/jquery-3.3.1.min.js"></script>
	<script src="/static/zui/js/zui.min.js"></script>
	<script src="/static/js/vue.min.js"></script>
	<script src="/static/js/axios.min.js"></script>
	<script src="/static/js/vue-router.js"></script>
</head>
<body>
<div class="container" id="container">
	<div class="row /static/customer/img/product">
		<div class="col-md-4 column">
			<h1>
				招宝商城
			</h1>
		</div>
		<div class="col-md-8 column">
			<h1 class="pull-right username">
				当前用户：${username}
			</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
			<nav class="menu" data-ride="menu" style="width: 190px">
				<ul id="treeMenu" class="tree tree-menu" data-ride="tree">
					<li class="active"><router-link to="/home"><i class="icon icon-th"></i>主页</router-link></li>
					<li><a href="/be/customer"><i class="icon icon-user"></i>用户资料</a></li>
					<li>
						<a href="#"><i class="icon icon-sitemap"></i>品类管理</a>
						<ul>
							<li><a href="/be/brand"><i class="icon icon-area-chart"></i>品牌管理</a></li>
							<li><a href="/be/category"><i class="icon icon-pie-chart"></i>分类管理</a></li>
						</ul>
					</li>
					<li>
						<a href="#"><i class="icon icon-shopping-cart"></i>商品管理</a>
						<ul>
							<li><a href="/be/product"><i class="icon icon-spin icon-spinner"></i>商品信息</a></li>
							<li><a href="/be/picture"><i class="icon icon-picture"></i>商品图片</a></li>
						</ul>
					</li>
					<li><a href="/be/comment"><i class="icon icon-comments"></i>评论管理</a></li>
					<li><a href="/be/announcement"><i class="icon icon-chat-line"></i>公告管理</a></li>
					<li>
						<a href="#"><i class="icon icon-tasks"></i>订单管理</a>
						<ul>
							<li>
								<a href="/be/order/ready"><i class="icon icon-circle-blank"></i>已就绪</a>
								<ul>
									<li><a href="/be/order/nopay">未支付</a></li>
									<li><a href="/be/order/noship">未发货</a></li>
								</ul>
							</li>
							<li><a href="/be/order/processing"><i class="icon icon-play-sign"></i>进行中</a></li>
							<li><a href="/be/order/complete"><i class="icon icon-ok-sign"></i>已完成</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		<div class="col-md-10 column" id="content">
			<div class="jumbotron">
				<router-view></router-view>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="center-block" style="width:400px;max-width:100%;background-color:#ccc;">
				<h3>无版权</h3>
			</div>
		</div>
	</div>
</div>

<script src="/static/admin/js/brand.js"></script>
<script>
	var home = {
		template:"<h1>home</h1>"
	}
	var my = {
		template:"<h1>my</h1>"
	}

	var routes = [
		{path:"/home",component:home },
		{path:"/my",component:my},
		{path:"/",redirect:"/home"}
	]
	var router = new VueRouter({
		// mode:'history',
		routes
	})
	var vm = new Vue({
		el: "#container",
		router
	});
	$('#treeMenu').on('click', 'a', function() {
		$('#treeMenu li.active').removeClass('active');
		$(this).closest('li').addClass('active');
	});
</script>
</body>
</html>