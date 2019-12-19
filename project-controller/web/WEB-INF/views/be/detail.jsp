<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-09
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>订单管理</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/zui/css/zui.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/zui/js/zui.min.js"></script>
    <script src="/static/js/vue.min.js"></script>
    <script src="/static/js/axios.min.js"></script>
    <script src="/static/js/vue-router.js"></script>
    <script th:inline="javascript" src="/static/admin/js/detail.js"></script>
    <script src="/static/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
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
                    <li><a href="/be/announcement"><i class="icon icon-chat-line"></i>公告管理</a></li>
                    <li class="active">
                        <a href="/be/order"><i class="icon icon-tasks"></i>订单管理</a>
                        <ul>
                            <li>
                                <a><i class="icon icon-circle-blank"></i>已就绪</a>
                                <ul>
                                    <li><a @click="searchStatus(3)">未支付</a></li>
                                    <li><a @click="searchStatus(2)">未发货</a></li>
                                </ul>
                            </li>
                            <li><a @click="searchStatus(1)"><i class="icon icon-play-sign"></i>进行中</a></li>
                            <li><a @click="searchStatus(0)"><i class="icon icon-ok-sign"></i>已完成</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-md-10 column" id="content">
            <div class="jumbotron">
                <div class="row clearfix">
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
                                    <p id="loginUsername">{{order.customer.loginUsername}}</p>
                                </div>
                                <label for="consignee" class="col-sm-2">收货人</label>
                                <div class="col-sm-5">
                                    <p id="consignee">{{order.addr.consignee}}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="addr" class="col-sm-2">收货地址</label>
                                <div class="col-md-6 col-sm-10">
                                    <p id="addr">{{order.addr.province}}{{order.addr.city}}{{order.addr.district}}-{{order.addr.address}}</p>
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
                <div class="row clearfix">
                    <div class="col-md-12 column">
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
