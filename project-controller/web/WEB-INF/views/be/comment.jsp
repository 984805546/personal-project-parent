<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-09
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>评论管理</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/zui/css/zui.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
<%--    <script src="/static/bootstrap/js/bootstrap.min.js"></script>--%>
    <script src="/static/zui/js/zui.min.js"></script>
    <script src="/static/js/vue.min.js"></script>
    <script src="/static/js/axios.min.js"></script>
    <script src="/static/js/vue-router.js"></script>
    <script src="/static/admin/js/comment.js"></script>
</head>
<body>
<div class="container" id="container">
    <div class="row clearfix">
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
                    <li><a href="/be/homepage"><i class="icon icon-th"></i>主页</a></li>
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
                    <li class="active"><a href="/be/comment"><i class="icon icon-comments"></i>评论管理</a></li>
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
                <div class="row clearfix">
                    <div class="col-md-10 column">
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
                                <label for="productName" class="col-sm-2">商品名称</label>
                                <div class="col-md-6 col-sm-10">
                                    <input type="text" class="form-control" id="productName" name="productName"
                                           placeholder="请输入商品名称" v-model="productName">
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
                                <div class="col-sm-offset-2 col-sm-5">
                                    <button type="button" class="btn btn-default" @click="search()">搜索</button>
                                </div>
                                <div class="col-sm-push-2 col-sm-5">
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
<%--                    <div class="col-md-2 column">--%>
<%--                        <button href="#" class="add btn btn-info" @click="insert()">新增</button>--%>
<%--                    </div>--%>
                </div>
                </br></br>
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>商品名称</th>
                                <th>订单编号</th>
                                <th>用户名称</th>
                                <th>评论内容</th>
                                <th>评论时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(value,index) in info.list'>
                                <td>{{++index}}</td>
                                <td>{{value.product.productName}}</td>
                                <td>{{value.order.orderSn}}</td>
                                <td>{{value.customer.loginUsername}}</td>
                                <td>{{value.content}}</td>
                                <td>{{value.auditTime}}</td>
                                <td>
                                    <a href='#' class='delete btn btn-danger' @click="deleteRow(value.commentId)">删除</a>
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
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="center-block" style="width:400px;max-width:100%;background-color:#ccc;">
                <h3>无版权</h3>
            </div>
        </div>
    </div>
</div>


</body>
</html>
