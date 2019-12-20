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
    <title>订单详情</title>

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
                <li><a href="#">订单管理</a></li>
                <li><a href="/be/order">订单列表</a></li>
                <li class="active">订单详情</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">订单详情</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="col-md-12 column">
                                <form class="form-horizontal">
                                    <input id="orderId" type="hidden" value="${orderId}">
                                    <div class="form-group">
                                        <label for="orderSn" class="col-sm-2">订单编号</label>
                                        <div class="col-sm-3">
                                            <p id="orderSn">{{order.orderSn}}</p>
                                        </div>
                                        <label for="shippingSn" class="col-sm-2">快递单号</label>
                                        <div class="col-sm-5">
                                            <p id="shippingSn">{{order.shippingSn}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="loginUsername" class="col-sm-2">用户</label>
                                        <div class="col-sm-3">
                                            <p id="loginUsername">{{customer.loginUsername}}</p>
                                        </div>
                                        <label for="consignee" class="col-sm-2">收货人</label>
                                        <div class="col-sm-5">
                                            <p id="consignee">{{addr.consignee}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="addr" class="col-sm-2">收货地址</label>
                                        <div class="col-md-6 col-sm-10">
                                            <p id="addr">{{addr.province}}{{addr.city}}{{addr.district}}-{{addr.address}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="orderMoney" class="col-sm-2">订单金额</label>
                                        <div class="col-sm-3">
                                            <p id="orderMoney">{{order.orderMoney}}</p>
                                        </div>
                                        <label for="districtMoney" class="col-sm-2">优惠金额</label>
                                        <div class="col-sm-5">
                                            <p id="districtMoney">{{order.districtMoney}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="shippingMoney" class="col-sm-2">运费金额</label>
                                        <div class="col-sm-3">
                                            <p id="shippingMoney">{{order.shippingMoney}}</p>
                                        </div>
                                        <label for="paymentMoney" class="col-sm-2">支付金额</label>
                                        <div class="col-sm-5">
                                            <p id="paymentMoney">{{order.paymentMoney}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="createTime" class="col-sm-2">下单时间</label>
                                        <div class="col-md-6 col-sm-10">
                                            <p id="createTime">{{order.createTime}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="shippingTime" class="col-sm-2">发货时间</label>
                                        <div class="col-md-6 col-sm-10">
                                            <p id="shippingTime">{{order.shippingTime}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="payTime" class="col-sm-2">支付时间</label>
                                        <div class="col-md-6 col-sm-10">
                                            <p id="payTime">{{order.payTime}}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="receiveTime" class="col-sm-2">收货时间</label>
                                        <div class="col-md-6 col-sm-10">
                                            <p id="receiveTime">{{order.receiveTime}}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>商品名称</th>
                                <th>购买商品数量</th>
                                <th>购买商品单价</th>
                                <th>总计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(value,index) in info.list'>
                                <td>{{++index}}</td>
                                <td>{{value.productName}}</td>
                                <td>{{value.productCnt}}</td>
                                <td>{{value.productPrice}}</td>
                                <td>
                                    {{value.productPrice * value.productCnt}}
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
<script src="/static/admin/js/detail.js"></script>
</body>
</html>
