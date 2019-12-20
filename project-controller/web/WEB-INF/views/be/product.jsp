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
    <title>商品信息</title>

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
                <li class="active">商品信息</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">商品信息</div>
                    </div>
                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="col-md-10 column">
                                <p>
                                    <button type="button" class="btn" data-toggle="collapse" data-target="#filterSelect">筛选</button>
                                </p>
                                <form class="form-horizontal collapse" id="filterSelect">
                                    <div class="form-group">
                                        <label for="searchOne" class="col-sm-2">商品编号</label>
                                        <div class="col-md-6 col-sm-10">
                                            <input type="text" class="form-control" id="searchOne" name="searchOne"
                                                   placeholder="请输入商品编号" v-model="searchOne">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="searchTwo" class="col-sm-2">商品名称</label>
                                        <div class="col-md-6 col-sm-10">
                                            <input type="text" class="form-control" id="searchTwo" name="searchTwo"
                                                   placeholder="请输入商品名称" v-model="searchTwo">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="searchThree" class="col-sm-2">商品分类</label>
                                        <div class="col-md-6 col-sm-10">
                                            <select id="searchThree" name="searchThree" style="width: 150px"
                                                    class="form-control cate-select col-md-5" v-model="searchThree">
                                                <option value="0" >请选择类型</option>
                                                <option v-for="c in category" :value="c.categoryId">{{c.categoryName}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="searchFour" class="col-sm-2">商品品牌</label>
                                        <div class="col-md-6 col-sm-10">
                                            <select id="searchFour" name="searchFour" style="width: 150px"
                                                    class="form-control cate-select col-md-5" v-model="searchFour">
                                                <option value="0" >请选择品牌</option>
                                                <option v-for="b in brand" :value="b.brandId">{{b.brandName}}</option>
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
                                <th>编码</th>
                                <th>名称</th>
                                <th>品牌</th>
                                <th>类别</th>
                                <th>售价</th>
                                <th>详情</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for='(value,index) in info.list'>
                                <td>{{++index}}</td>
                                <td>{{value.productCore}}</td>
                                <td>{{value.productName}}</td>
                                <td v-for='b in brand' v-if="b.brandId === value.brandId" >
                                    {{b.brandName}}
                                </td>
                                <td v-for='c in category'  v-if="c.categoryId === value.categoryId">
                                    {{c.categoryName}}
                                </td>
                                <td>{{value.price}}</td>
                                <td>
                                    <a href='#' @click="details(value)"> >>>查看商品详情 </a>
                                </td>
                                <td>
                                    <a href='#' class='delete btn btn-xs btn-danger' @click="deleteRow(value.productId)">注销</a>
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
                        修改品牌信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="productInfo">
                        <div class="form-group">
                            <label for="productCore" class="col-sm-2 control-label">编码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="productCore" name="productCore" v-model="productCore"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productName" class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="productName" name="productName" v-model="productName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brandId" class="col-sm-2 control-label">品牌</label>
                            <div class="col-sm-10">
                                <select id="brandId" name="brandId" style="width: 150px"
                                        class="form-control cate-select col-md-5" v-model="brandId">
                                    <option value>选择品牌</option>
                                    <option :value="brand.brandId" v-for="brand in brand">{{brand.brandName}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="categoryId" class="col-sm-2 control-label">类型</label>
                            <div class="col-sm-10">
                                <select id="categoryId" name="categoryId" style="width: 150px"
                                        class="form-control cate-select col-md-5" v-model="categoryId">
                                    <option value>选择类型</option>
                                    <option :value="category.categoryId" v-for="category in category" >{{category.categoryName}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-2 control-label">售价</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" id="price" name="price" v-model="price"
                                           placeholder="售价" class="form-control" style="width: 100px" />
                                    <div class="input-group-addon" style="width: 20px">元</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="averageCost" class="col-sm-2 control-label">加权平均成本</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" id="averageCost" name="averageCost" v-model="averageCost"
                                           placeholder="加权平均成本" class="form-control" style="width: 100px" />
                                    <div class="input-group-addon" style="width: 20px">元</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productionDate" class="col-sm-2 control-label">生产日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control form-date" placeholder="选择或者输入一个日期："
                                       id="productionDate" name="productionDate" v-model="productionDate"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="shelfLife" class="col-sm-2 control-label">有效期</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" id="shelfLife" name="shelfLife" v-model="shelfLife"
                                           placeholder="有效期" class="form-control" style="width: 100px" />
                                    <div class="input-group-addon" style="width: 20px">天</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="currentCnt" class="col-sm-2 control-label">库存量</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" id="currentCnt" name="currentCnt" v-model="currentCnt"
                                           placeholder="库存量" class="form-control" style="width: 100px" />
                                    <div class="input-group-addon" style="width: 20px">件</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lockCnt" class="col-sm-2 control-label">占用量</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" id="lockCnt" name="lockCnt" v-model="lockCnt"
                                           placeholder="占用量" class="form-control" style="width: 100px" />
                                    <div class="input-group-addon" style="width: 20px">件</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descript" class="col-sm-2 control-label">描述</label>
                            <div class="col-sm-10">
								<textarea id="descript" name="descript" class="form-control kindeditor"
                                          style="height:150px;" v-model="descript"></textarea>
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
<script src="/static/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
<script src="/static/admin/js/product.js"></script>
</body>
</html>
