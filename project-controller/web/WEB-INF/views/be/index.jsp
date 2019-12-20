<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>后台管理</title>
	<!-- zui css -->
	<link rel="stylesheet" href="/static/zui/css/zui.min.css">
	<link rel="stylesheet" href="/static/zui/theme/blue.css">
	<!-- app css -->
	<link rel="stylesheet" href="/static/admin/css/app.css">
</head>
<body>

<div class="wrapper" id="container">
	<header class="main-header">
		<nav class="navbar navbar-fixed-top bg-primary">
			<div class="navbar-header">
				<a class="navbar-toggle" href="javascript:;" data-toggle="collapse" data-target=".navbar-collapse"><i class="icon icon-th-large"></i></a>
				<a class="sidebar-toggle" href="javascript:;" data-toggle="push-menu"><i class="icon icon-bars"></i></a>
				<a class="navbar-brand" href="#">
					<span class="logo">招宝商城</span>
					<span class="logo-mini">FS</span>
				</a>
			</div>
			<div class="collapse navbar-collapse">
				<div class="container-fluid">
					<ul class="nav navbar-nav">
						<li><a href="javascript:;" data-toggle="push-menu"><i class="icon icon-bars"></i></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="javascript:;">
                                    <span>
                                        <i class="icon icon-bell-alt"></i>
                                        <span class="label label-danger label-pill up">5</span>
                                    </span>
							</a>
						</li>
						<li>
							<a href="javascript:;">
                                    <span>
                                        <i class="icon icon-envelope-alt"></i>
                                        <span class="label label-success label-pill up">2</span>
                                    </span>
							</a>
						</li>
						<li class="dropdown">
							<a href="javascript:;" data-toggle="dropdown"><i class="icon icon-user"></i> 管理员 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">资料设置</a></li>
								<li><a href="#">清除缓存</a></li>
								<li class="divider"></li>
								<li><a href="#">注销</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<aside class="main-sidebar">
		<section class="sidebar">
			<ul id="treeMenu" class="sidebar-menu" data-widget="tree">
				<li class="header">功能菜单</li>
				<li class="treeview" id="menuTemplate">
					<a href="javascript:;">
						<span class="parent">主页</span>
						<span class="pull-right-container">
                            <i class="icon icon-angle-left"></i>
                        </span>
					</a>
					<ul class="treeview-menu child">
						<li><a href="/be/index"><i class="icon icon-circle-blank"></i> 页面演示</a></li>
					</ul>
				</li>
			</ul>
		</section>
	</aside>
	<div class="content-wrapper">
		<div class="content-header">
			<ul class="breadcrumb">
				<li><a href="#"><i class="icon icon-home"></i></a></li>
				<li class="active">主页</li>
			</ul>
		</div>
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box bg-info">
							<div class="info-box-icon">
								<i class="icon icon-file-text"></i>
							</div>
							<div class="info-box-content">
								<span class="info-box-text">文章总量</span>
								<span class="info-box-number">320
                                        <small>篇</small>
                                    </span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box bg-primary">
							<div class="info-box-icon">
								<i class="icon icon-user"></i>
							</div>
							<div class="info-box-content">
								<span class="info-box-text">用户总量</span>
								<span class="info-box-number">90
                                        <small>个</small>
                                    </span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box bg-warning">
							<div class="info-box-icon">
								<i class="icon icon-bars"></i>
							</div>
							<div class="info-box-content">
								<span class="info-box-text">栏目总量</span>
								<span class="info-box-number">8
                                        <small>个</small>
                                    </span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box bg-danger">
							<div class="info-box-icon">
								<i class="icon icon-eye-open"></i>
							</div>
							<div class="info-box-content">
								<span class="info-box-text">PV总量</span>
								<span class="info-box-number">18953
                                        <small>次</small>
                                    </span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<div class="panel-title">产品信息</div>
							</div>
							<div class="panel-body">
								<table class="table table-info">
									<tr>
										<td>产品名称</td>
										<td>zui-admin</td>
									</tr>
									<tr>
										<td>核心框架</td>
										<td>zui v1.7.0</td>
									</tr>
									<tr>
										<td>开发作者</td>
										<td>mofee（莫非）</td>
									</tr>
									<tr>
										<td>联系方式</td>
										<td>QQ：205155513</td>
									</tr>
									<tr>
										<td>交流讨论</td>
										<td><a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=65deab2f8ea1e9d2445c3262d133da48fe9de53bd90a3146c3f7bb6fb9d63ead"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="zui-admin后台模板交流" title="zui-admin后台模板交流"></a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<div class="panel-title">服务器信息</div>
							</div>
							<div class="panel-body">
								<table class="table table-info">
									<tr>
										<td>操作系统</td>
										<td>Windows</td>
									</tr>
									<tr>
										<td>运行环境</td>
										<td>nginx/1.4.6</td>
									</tr>
									<tr>
										<td>PHP版本</td>
										<td>5.5.9-1ubuntu4.21</td>
									</tr>
									<tr>
										<td>MYSQL版本</td>
										<td>10.1.11-MariaDB-log</td>
									</tr>
									<tr>
										<td>上传限制</td>
										<td>20M</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
</body>
</html>