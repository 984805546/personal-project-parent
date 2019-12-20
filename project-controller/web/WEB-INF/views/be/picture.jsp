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
    <title>商品图片</title>

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
                <li><a href="#">商品管理</a></li>
                <li class="active">商品图片</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">商品图片</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="col-md-10 column">
                                <p>
                                    <button type="button" class="btn" data-toggle="collapse" data-target="#filterSelect">筛选</button>
                                </p>
                                <form class="form-horizontal collapse" id="filterSelect">
                                    <div class="form-group">
                                        <label for="searchOne" class="col-sm-2">商品名称</label>
                                        <div class="col-md-6 col-sm-10">
                                            <input type="text" class="form-control" id="searchOne" name="searchOne"
                                                   placeholder="请输入商品名称" v-model="searchOne">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="searchTwo" class="col-sm-2">图片状态</label>
                                        <div class="col-md-6 col-sm-10">
                                            <select id="searchTwo" name="searchTwo" style="width: 150px"
                                                    class="form-control cate-select col-md-5" v-model="searchTwo">
                                                <option value="" >请选择图片状态</option>
                                                <option value="0">副图片</option>
                                                <option value="1">主图片</option>
                                            </select>
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
                            <div class="col-md-2 column">
                                <button href="#" class="add btn btn-info" @click="insert()"><i class="icon icon-plus-sign"></i>新增</button>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>商品名称</th>
                                <th>图片</th>
                                <th>主视图</th>
                                <th>详情</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(list,index) in info.list'>
                                <td>{{++index}}</td>
                                <td v-for='product in product' v-if="product.productId === list.productId" >
                                    {{product.productName}}
                                </td>
                                <td>
                                    <img :src="list.picUrl" width="50px" height="50px" class="img-rounded">
                                </td>
                                <td>
                                    <div class="switch" v-if="list.picMaster === 1">
                                        <input type="checkbox" disabled checked="checked">
                                        <label>是</label>
                                    </div>
                                    <div class="switch" v-else>
                                        <input type="checkbox" disabled>
                                        <label>否</label>
                                    </div>
                                </td>
                                <td>
                                    <a href='#' @click="details(list)"> >>>查看图片详情 </a>
                                </td>
                                <td>
                                    <a href='#' class='delete btn btn-xs btn-danger' @click="deleteRow(list.productPicId)">注销</a>
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
                        图片信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="picture">
                        <div class="form-group">
                            <label for="productId" class="col-sm-2 control-label">商品名称</label>
                            <div class="col-sm-10">
                                <select id="productId" name="productId" style="width: 150px"
                                        class="form-control cate-select col-md-5" v-model="productId">
                                    <option value>请选择商品</option>
                                    <option :value="product.productId" v-for="product in product" >{{product.productName}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myfile" class="col-sm-2 control-label">上传图片</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="file" name="myfile" id="myfile" multiple="multiple"
                                           class="form-control" @change="changeImage($event)"/>
                                </div>
                                <div id="imgDiv" style="display: none">
                                    <img src="" id="image" style="width: 230px;height: 200px">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myView" class="col-sm-2 control-label">主视图</label>
                            <div class="col-sm-10">
                                <div class="switch">
                                    <input type="checkbox" id="myView" name="myView" v-model="checked">
                                    <label>{{checked}}</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="picDesc" class="col-sm-2 control-label">图片描述</label>
                            <div class="col-sm-10">
								<textarea id="picDesc" name="picDesc" class="form-control kindeditor"
                                          style="height:150px;" v-model="picDesc"></textarea>
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
</div>


<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
<script src="/static/admin/js/picture.js"></script>
</body>
</html>
