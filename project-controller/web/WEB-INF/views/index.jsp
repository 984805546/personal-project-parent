<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-02
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>

    <!-- zui css -->
    <link rel="stylesheet" href="/static/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/zui/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/admin/css/app.css">

    <link rel="stylesheet" href="/static/bootstrap/css/bootstrapStyle/bootstrapStyle.css" type="text/css">
</head>
<body>

<div class="wrapper">
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
                        <li><a href="layout.html"><i class="icon icon-circle-blank"></i> 空白页</a></li>
                        <li><a href="login.html"><i class="icon icon-circle-blank"></i> 登录</a></li>
                        <li><a href="error-404.html"><i class="icon icon-circle-blank"></i> 404页</a></li>
                        <li><a href="config.html"><i class="icon icon-circle-blank"></i> 系统设置</a></li>
                        <li><a href="list.html"><i class="icon icon-circle-blank"></i> 用户列表</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <div class="content-header">
            <ul class="breadcrumb">
                <li><a href="#"><i class="icon icon-home"></i></a></li>
                <li class="active">仪表盘</li>
            </ul>
        </div>
        <div class="content-body">
            <h1>jQuery Tree Demo</h1>

            <ul id="tree" class="ztree"></ul>

            <input type="button" id="btnSave" value="save"/>
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

<script>
    var setting = {
        check: {
            //使用复选框
            enable: true
        },
        data: {
            //使用外部数据
            simpleData: {
                enable: true
            }
        }
    };

    function getIdsFromCheckNodes(event, treeId, treeNode) {
        var treeObj = $.fn.zTree.getZTreeObj("tree"),
            nodes = treeObj.getCheckedNodes(true),
            id = [];
        for (var i = 0; i < nodes.length; i++) {
            id[i] = nodes[i].id; //第三部
        }
        return id;
    }

    $.getJSON("/privilege/check", {"roleId": 3}, function (result) {
        $.fn.zTree.init($("#tree"), setting, result);
    })
    $("#btnSave").click(function () {
        var ids = getIdsFromCheckNodes();
        console.log(ids);
        axios.get('/rp/update', {
            params: {
                roleId: 3,
                privilegeId: ids.toString()
            },
            responseType: "json"
        }).then(response => (console.log()));
    });
</script>
</body>
</html>
