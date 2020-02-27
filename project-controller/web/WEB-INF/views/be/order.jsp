<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-09
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单列表</title>

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
                            <a id="user" href="javascript:;" data-toggle="dropdown" data="${user.id}"><i class="icon icon-user"></i> ${user.username} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">资料设置</a></li>
                                <li><a href="#">清除缓存</a></li>
                                <li class="divider"></li>
                                <li><a href="/user/logout">注销</a></li>
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
                <li><a href="#">订单管理</a></li>
                <li class="active">订单列表</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">订单列表</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="col-md-8 column">
                                <p>
                                    <button type="button" class="btn" data-toggle="collapse" data-target="#filterSelect">筛选</button>
                                </p>
                                <form class="form-horizontal collapse" id="filterSelect">
                                    <div class="form-group">
                                        <label for="orderSn" class="col-sm-2">订单编号</label>
                                        <div class="col-md-6 col-sm-10">
                                            <input type="text" class="form-control" id="orderSn" name="orderSn"
                                                   placeholder="请输入订单编号" v-model="orderSn">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="col-sm-2">用户名称</label>
                                        <div class="col-md-6 col-sm-10">
                                            <input type="text" class="form-control" id="username" name="loginUsername"
                                                   placeholder="请输入用户名称" v-model="loginUsername">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-3">
                                            <button type="button" class="btn btn-default" @click="search()">查询</button>
                                        </div>
                                        <div>
                                            <button type="reset" class="btn btn-default">重置</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-4 column">
                                <a href="#" @click="searchStatus(0)" class="btn btn-primary"><i class="icon icon-check-circle"></i> 已完成</a>
                                <a href="#" @click="searchStatus(1)" class="btn btn-success"><i class="icon icon-plus-sign"></i> 进行中</a>
                                <a href="#" @click="searchStatus(2)" class="btn btn-warning"><i class="icon icon-ban-circle"></i> 未发货</a>
                                <a href="#" @click="searchStatus(3)" class="btn btn-danger"><i class="icon icon-remove-sign"></i> 未付款</a>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>用户</th>
                                <th>收货人</th>
                                <th>收货地址</th>
                                <th>订单编号</th>
                                <th>快递单号</th>
                                <th>支付金额</th>
                                <th>订单状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(value,index) in info.list'>
                                <td>{{++index}}</td>
                                <td>{{value.customer.loginUsername}}</td>
                                <td>{{value.addr.consignee}}</td>
                                <td>{{value.addr.province}}{{value.addr.city}}{{value.addr.district}}-{{value.addr.address}}</td>
                                <td>
                                    <a @click="selectDetail(value.orderId)">{{value.orderSn}}</a>
                                </td>
                                <td>{{value.shippingSn}}</td>
                                <td>{{value.paymentMoney}}</td>
                                <td v-if="value.orderStatus === 0">已完成</td>
                                <td v-else-if="value.orderStatus === 1">进行中</td>
                                <td v-else-if="value.orderStatus === 2">未发货</td>
                                <td v-else>未支付</td>
                                <td>
                                    <a href='#' class='delete btn btn-xs btn-danger' @click="deleteRow(value.orderId)">删除</a>
                                    <a v-if="value.orderStatus === 2" href='#' class='ship btn btn-xs btn-primary' @click="ship(value.orderId)">发货</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div>
                            <ul class="pager">
                                <li class="previous" v-if="info.prePage != 0">
                                    <a href="#" @click="pageNum=info.prePage"> << </a>
                                </li>
                                <li v-for="n in info.navigatepageNums">
                                    <a href="#" @click="pageNum=n">{{n}}</a>
                                </li>
                                <li class="next" v-if="info.nextPage != 0">
                                    <a href="#"  @click="pageNum=info.nextPage"> >> </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
<script src="/static/admin/js/order.js"></script>
</body>
</html>