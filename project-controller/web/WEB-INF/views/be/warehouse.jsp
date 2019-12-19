<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-09
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>库存管理</title>
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
    <script src="/static/admin/js/warehouse.js"></script>
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
                    <li><a href="/be/comment"><i class="icon icon-comments"></i>评论管理</a></li>
                    <li class="active"><a href="/be/warehouse"><i class="icon icon-chat-line"></i>库存管理</a></li>
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
                                <label for="productCore" class="col-sm-2">订单编号</label>
                                <div class="col-md-6 col-sm-10">
                                    <input type="text" class="form-control" id="productCore" name="productCore"
                                           placeholder="请输入商品编号" v-model="productCore">
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
                                <div class="col-sm-offset-2 col-sm-5">
                                    <button type="button" class="btn btn-default" @click="search()">搜索</button>
                                </div>
                                <div class="col-sm-push-2 col-sm-5">
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                </br></br>
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>商品编号</th>
                                <th>商品名称</th>
                                <th>商品数量</th>
                                <th>占用数量</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(value,index) in info.list'>
                                <td>{{++index}}</td>
                                <td>{{value.product.productCore}}</td>
                                <td>{{value.product.productName}}</td>
                                <td>{{value.currentCnt}}</td>
                                <td>{{value.lockCnt}}</td>
                                <td>
                                    <a href='#' class='delete btn btn-danger' @click="deleteRow(value.wpId)">删除</a>
                                    <a href='#' class='edit btn btn-info' @click="update(value)">编辑</a>
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
    <!-- 模态框（Modal）-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改库存信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="warehouseInfo">
                        <div class="form-group">
                            <label for="currentCnt" class="col-sm-2 control-label">库存量</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" class="form-control" id="currentCnt" name="currentCnt"
                                           v-model="currentCnt" placeholder="请输入当前库存量" style="width: 100px"/>
                                    <div class="input-group-addon" style="width: 20px">件</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lockCnt" class="col-sm-2 control-label">占用量</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" class="form-control" id="lockCnt" name="lockCnt"
                                           v-model="lockCnt" placeholder="请输入当前占用量" style="width: 100px"/>
                                    <div class="input-group-addon" style="width: 20px">件</div>
                                </div>
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


</body>
</html>
