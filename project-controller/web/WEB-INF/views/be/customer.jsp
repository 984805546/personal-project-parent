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
    <title>用户信息</title>

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
                <li><a href="#">基础资料管理</a></li>
                <li class="active">用户信息</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">用户信息</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="pull-right" style="width: 250px;">
                                <div class="input-group">
                                    <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
                                        <input id="inputSearchExample3" type="search" v-model="search" class="form-control search-input" placeholder="输入用户名称">
                                        <label for="inputSearchExample3" class="input-control-icon-left search-icon"  style="top: 8px;"><i class="icon icon-search"></i></label>

                                        <!-- <input type="text" class="form-control" placeholder="关键字">-->
                                    </div>
                                    <span class="input-group-btn">
										<button class="btn btn-default" type="button" @click="searchName()">搜索</button>
									</span>
                                </div>
                                <div class="input-group">

                                </div>
                            </div>
                            <div class="tools-group">
                                <button href="#" class="add btn btn-info" @click="insert()"><i class="icon icon-plus-sign"></i>新增</button>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>用户名</th>
                                <th>用户信息</th>
                                <th>用户地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(value,index) in info.list'>
                                <td>{{++index}}</td>
                                <td>{{value.loginUsername}}</td>
                                <td>
                                    <a href='#' @click="selectInfo(value.customerId)"> >>>查看用户详情 </a>
                                </td>
                                <td>
                                    <a href='#' @click="selectAddr(value.customerId)"> >>>查看用户地址详情 </a>
                                </td>
                                <td>
                                    <a href='#' class='delete btn btn-xs btn-danger' @click="deleteRow(value.customerId)">注销</a>
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
    <!-- 用户添加模态框（Modal）-->
    <div class="modal fade" id="addCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加用户
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="customerAdd">
                        <div class="form-group">
                            <label for="loginUsername" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="loginUsername" name="loginUsername"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10" id="details">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="button" id="save" class="btn btn-default" @click="save()">保存</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 用户信息模态框（Modal）-->
    <div class="modal fade" id="customerInf" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        用户详情
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="cInf">
                        <div class="form-group">
                            <label for="customerName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="customerName" name="customerName"
                                       placeholder="姓名" :value="inf.customerName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="gender" name="gender"
                                       placeholder="性别" :value="inf.gender"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="identityCardType" class="col-sm-2 control-label">证件类型</label>
                            <div class="col-sm-10" v-if="inf.identityCardType===1">
                                <input type="text" class="form-control" id="identityCardType" name="identityCardType"
                                       placeholder="证件类型:1 身份证，2 军官证，3 护照" value="身份证"/>
                            </div>
                            <div class="col-sm-10" v-if="inf.identityCardType===2">
                                <input type="text" class="form-control" name="identityCardType"
                                       placeholder="证件类型:1 身份证，2 军官证，3 护照" value="军官证"/>
                            </div>
                            <div class="col-sm-10" v-if="inf.identityCardType===3">
                                <input type="text" class="form-control" name="identityCardType"
                                       placeholder="证件类型:1 身份证，2 军官证，3 护照" value="护照"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="identityCardNo" class="col-sm-2 control-label">证件号码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="identityCardNo" name="identityCardNo"
                                       placeholder="证件号码" :value="inf.identityCardNo"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mobilePhone" class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="mobilePhone" name="mobilePhone"
                                       placeholder="手机号" :value="inf.mobilePhone"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerEmail" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="customerEmail" name="customerEmail"
                                       placeholder="邮箱" :value="inf.customerEmail"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="registerTime" class="col-sm-2 control-label">注册时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="registerTime" name="registerTime"
                                       placeholder="注册时间" :value="inf.registerTime"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 用户地址模态框（Modal）-->
    <div class="modal fade" id="customerAddr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel3">
                        用户收货地址
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="cAddr">
                        <div class="form-group">
                            <label for="consignee" class="col-sm-2 control-label">收货人姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="consignee" name="consignee"
                                       placeholder="收货人姓名" :value="addr.consignee"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="consigneePhone" class="col-sm-2 control-label">收货人手机号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="consigneePhone" name="consigneePhone"
                                       placeholder="收货人手机号" :value="addr.consigneePhone"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="province" class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-3">
                                <select class="form-control" id="province">
                                    <option>{{addr.province}}</option>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-control" id="city">
                                    <option>{{addr.city}}</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <select class="form-control" id="district">
                                    <option>{{addr.district}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label">具体详情</label>
                            <div class="col-sm-10">
								<textarea id="address" name="address" class="form-control kindeditor"
                                          placeholder="具体详情" style="height:150px;" :value="addr.address"></textarea>
                            </div>
                        </div>
                    </form>
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
<script src="/static/admin/js/customer.js"></script>
</body>
</html>
