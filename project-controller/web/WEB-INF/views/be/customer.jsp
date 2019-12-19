<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-09
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>用户管理</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/zui/css/zui.min.css" rel="stylesheet">
    <link href="/static/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
<%--    <script src="/static/bootstrap/js/bootstrap.min.js"></script>--%>
    <script src="/static/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/static/zui/js/zui.min.js"></script>
    <script src="/static/js/vue.min.js"></script>
    <script src="/static/js/axios.min.js"></script>
    <script src="/static/js/vue-router.js"></script>
    <script src="/static/admin/js/customer.js"></script>
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
                    <li class="active"><a href="/be/customer"><i class="icon icon-user"></i>用户资料</a></li>
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
                        <div class="input-group">
                            <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchName">
                                <input id="inputSearchName" type="search" v-model="search" class="form-control search-input" placeholder="搜索用户名">
                                <label for="inputSearchName" class="input-control-icon-left search-icon"  style="top: 8px;"><i class="icon icon-search"></i></label>
                            </div>
                            <span class="input-group-btn">
                            <button class="btn btn-primary" type="button" @click="searchName()">搜索</button>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-2 column">
                        <button href="#" class="add btn btn-info" @click="insert()">新增</button>
                    </div>
                </div>
                </br></br>
                <div class="row clearfix">
                    <div class="col-md-12 column">
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
                                    <a href='#' class='delete btn btn-danger' @click="deleteRow(value.customerId)">注销</a>
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


</body>
</html>
