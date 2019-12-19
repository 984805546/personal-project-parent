<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-04
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li class="header">主要菜单</li>
                <li class="active">
                    <a href="index.html">
                        <i class="icon icon-dashboard"></i>
                        <span>主页</span>
                        <span class="pull-right-container">
                            </span>
                    </a>
                </li>
                <li class="treeview" id="menuTemplate">
                    <a href="javascript:;">
                        <span class="parent">页面演示</span>
                        <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu child">
                        <%--						<li><a href="layout.html"><i class="icon icon-circle-blank"></i> 空白页</a></li>--%>
                        <%--						<li><a href="login.html"><i class="icon icon-circle-blank"></i> 登录</a></li>--%>
                        <%--						<li><a href="error-404.html"><i class="icon icon-circle-blank"></i> 404页</a></li>--%>
                        <%--						<li><a href="config.html"><i class="icon icon-circle-blank"></i> 系统设置</a></li>--%>
                        <%--						<li><a href="list.html"><i class="icon icon-circle-blank"></i> 用户列表</a></li>--%>
                    </ul>
                </li>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <div class="content-header">
            <ul class="breadcrumb">
                <li><a href="#"><i class="icon icon-home"></i></a></li>
                <li><a href="#">页面演示</a></li>
                <li class="active">品牌管理</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">品牌管理</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="pull-right" style="width: 250px;">
                                <div class="input-group">
                                    <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
                                        <input id="inputSearchExample3" type="search" v-model="search" class="form-control search-input" placeholder="搜索">
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
                                <th>品牌名称</th>
                                <th>联系电话</th>
                                <th>品牌网络</th>
                                <th>品牌logo URL</th>
                                <th>品牌描述</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='list in info.list'>
                                <td>{{list.brandName}}</td>
                                <td>{{list.telephone}}</td>
                                <td>{{list.brandWeb}}</td>
                                <td>{{list.brandLogo}}</td>
                                <td>{{list.brandDesc}}</td>
                                <td>
                                    <a href='#' class='delete btn btn-xs btn-danger' @click="deleteRow(list.brandId)">删除</a>
                                    <a href='#' class='edit btn btn-xs btn-primary' @click="update(list)">编辑</a>
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
    <!-- 模态框（Modal）-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改品牌信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="brandInfo">
                        <div class="form-group">
                            <label for="brandName" class="col-sm-2 control-label">品牌名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="brandName" name="brandName" v-model="brandName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-sm-2 control-label">联系电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="telephone" name="telephone" v-model="telephone"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brandWeb" class="col-sm-2 control-label">品牌网络</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="brandWeb" name="brandWeb" v-model="brandWeb"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brandLogo" class="col-sm-2 control-label">品牌logo URL</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="brandLogo" name="brandLogo" v-model="brandLogo"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brandDesc" class="col-sm-2 control-label">品牌描述</label>
                            <div class="col-sm-10">
                                <input type="tel" class="form-control" id="brandDesc" name="brandDesc" v-model="brandDesc" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
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
</div>


<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
<script src="/static/admin/js/brand.js"></script>
</body>
</html>
