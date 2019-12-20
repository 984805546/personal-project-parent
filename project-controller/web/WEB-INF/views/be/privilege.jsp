<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-20
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>权限管理</title>
    <!-- zui css -->
    <link rel="stylesheet" href="/static/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/zui/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/admin/css/app.css">

    <link rel="stylesheet" href="/static/bootstrap/css/bootstrapStyle/bootstrapStyle.css" type="text/css">
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
                <li><a href="#">基础资料管理</a></li>
                <li class="active">权限管理</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">权限管理</div>
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
                                <th>授权编号</th>
                                <th>权限名称</th>
                                <th>访问地址</th>
                                <th>上级权限</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='value in info.list'>
                                <td>{{value.id}}</td>
                                <td>{{value.name}}</td>
                                <td>{{value.uri}}</td>
                                <td>{{value.pid}}</td>
                                <td>
                                    <a href='#' class='delete btn btn-xs btn-danger' @click="deleteRow(value.id)">注销</a>
                                    <a href='#' class='edit btn btn-xs btn-primary' @click="update(value)">编辑</a>
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
                        权限信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="privilegeInfo">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label">授权编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="id" name="id" v-model="id"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">权限名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" v-model="name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="uri" class="col-sm-2 control-label">访问地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="uri" name="uri" v-model="uri"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pid" class="col-sm-2 control-label">上级权限</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="pid" name="pid" v-model="pid"/>
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
<script src="/static/js/jquery.ztree.core.js"></script>
<script src="/static/js/jquery.ztree.excheck.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
<script src="/static/admin/js/privilegelist.js"></script>
</body>
</html>

