<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-09
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>图片管理</title>
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
                            <li class="active"><a href="/be/picture"><i class="icon icon-picture"></i>商品图片</a></li>
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
                                <div class="col-sm-offset-2 col-sm-5">
                                    <button type="button" class="btn btn-default" @click="search()">搜索</button>
                                </div>
                                <div class="col-sm-push-2 col-sm-5">
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </form>
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
                                    <a href='#' class='delete btn btn-danger' @click="deleteRow(list.productPicId)">注销</a>
                                    <a href='#' class='edit btn btn-info' @click="update(list)">编辑</a>
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


<script src="/static/admin/js/picture.js"></script>
</body>
</html>
