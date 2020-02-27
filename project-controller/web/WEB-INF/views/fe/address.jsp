<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Address || Jhilmil</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="/static/customer/img/favicon.ico">

        <!-- Google Fonts
        ============================================ -->
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Niconne' rel='stylesheet' type='text/css'>

        <!-- style CSS
        ============================================ -->
        <link rel="stylesheet" href="/static/customer/css/style.css">

        <!-- jquery
        ============================================ -->
        <script src="/static/js/jquery-3.3.1.min.js"></script>

        <!-- Vue JS
        ============================================ -->
        <script src="/static/js/vue.min.js"></script>
        <script src="/static/js/axios.min.js"></script>
        <script src="/static/js/vue-router.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->


        <!-- header start -->
        <header class="header-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2">
                        <div class="header-logo">
                            <a href="/fe/index"><img src="/static/customer/img/logo/header-logo.png" alt="Jhilmil"></a>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-lg-5 col-md-4 col-sm-3 hidden-xs">
                                <div class="top-left">
                                    <p>我们上午9点至晚上10点营业</p>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-8 col-sm-9">
                                <div class="top-right">
                                    <div class="top-login-cart">
                                        <ul>
                                            <li class=" hidden-xs"><a href="/fe/login">登录或注册</a></li>
                                            <li class=" hidden-xs"><a href="/fe/checkout">查看</a></li>
                                            <li><a href="/fe/cart"><img src="/static/customer/img/icon/cart.png" alt="">购物车 (${cart.itemCount})</a>
                                                <ul class="submenu-mainmenu">
                                                    <%--                                            <s:forEach items="${cart.items}" var="item">--%>
                                                    <%--                                                <li class="single-cart-item clearfix">--%>
                                                    <%--	                                                        <span class="cart-img">--%>
                                                    <%--	                                                        	<s:forEach items="${pvo.picture}" var="pic">--%>
                                                    <%--                                                                    <s:if test="${item.product.product_id == pic.product_id}" var="result">--%>
                                                    <%--                                                                        <a href="#"><img width="50" height="59" src="${pic.pic_url}" alt=""></a>--%>
                                                    <%--                                                                    </s:if>--%>
                                                    <%--                                                                </s:forEach>--%>
                                                    <%--	                                                        </span>--%>
                                                    <%--                                                    <span class="cart-info">--%>
                                                    <%--	                                                            <a href="#">${item.product.product_name}</a>--%>
                                                    <%--	                                                            <span>${item.product.price} ✖️ ${item.qty}</span>--%>
                                                    <%--	                                                        </span>--%>
                                                    <%--                                                    <span class="trash-cart">--%>
                                                    <%--	                                                            <a href="/removefromcart?pid=${item.product.product_id}&&qty=${item.qty}"><i class="fa fa-trash-o"></i></a>--%>
                                                    <%--	                                                        </span>--%>
                                                    <%--                                                </li>--%>
                                                    <%--                                            </s:forEach>--%>
                                                    <li>
                                                            <span class="sub-total-cart text-center">
                                                                小计 <span>${cart.total}</span>
                                                                <a href="/static/customer/cart" class="view-cart active">查看购物车</a>
                                                                <a href="/static/customer/checkout" class="view-cart">结账</a>
                                                            </span>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="search-box">
                                        <form method="post" action="/static/customer/shop">
                                            <input type="text" placeholder="Search here..." name="product_name">
                                            <button type="submit"><i class="fa fa-search"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-9 col-md-8">
                                <div class="mainmenu-area">
                                    <nav>
                                        <div class="mainmenu">
                                            <ul>
                                                <li><a href="/fe/index">家</a>
                                                    <ul class="submenu-mainmenu">
                                                        <li><a href="index-2.html">家庭版 2</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="/fe/about-us">关于</a></li>
                                                <li><a href="/fe/shop">Go Shopping</a></li>
                                                <li ><a href="#">店<span><img src="/static/customer/img/icon/hot.png" alt=""></span></a>
                                                    <div class="mega-menu">
                                                    <span>
                                                        <a href="shop-left-sidebar.html" class="title">类别</a>
                                                        <a v-for="c in category"><i class="fa fa-circle"></i>{{c.categoryName}}</a>
                                                    </span>
                                                        <span>
                                                        <a href="shop-left-sidebar.html" class="title">品牌</a>
                                                        <a v-for="b in brand"><i class="fa fa-circle"></i>{{b.brandName}}</a>
                                                    </span>
                                                        <span>
                                                        <img src="/static/customer/img/menu/1.jpg" alt="">
                                                    </span>
                                                    </div>
                                                </li>
                                                <li class="hidden-md"><a href="#">饰品</a></li>
                                                <li class="dropdown"><a href="/static/customer/shop">网页</a>
                                                    <ul class="submenu-mainmenu">
                                                        <li><a href="/static/customer/checkout">查看</a></li>
                                                        <li><a href="/static/customer/shop">购物栏</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="/static/customer/contact">联系</a></li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 hidden-sm hidden-xs">
                                <div class="account-usd">
                                    <ul>
                                        <li><a href="account.html">我的账户<i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-mainmenu">
                                                <li><a href="#"><i class="fa fa-circle"></i>登录</a></li>
                                                <li><a href="/static/customer/account"><i class="fa fa-circle"></i>我的账户</a></li>
                                                <li><a href="/static/customer/address"><i class="fa fa-circle"></i>我的地址</a></li>
                                                <li><a href="/static/customer/cart"><i class="fa fa-circle"></i>我的购物车</a></li>
                                                <li><a href="/static/customer/checkout"><i class="fa fa-circle"></i>查看</a></li>
                                            </ul>
                                        </li>
                                        <li class="currency"><a href="#">人民币</a>
                                        </li>
                                        <li class="language"><a href="#">中文</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Area start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul>
                                        <li><a href="/static/customer/index">家</a>
                                            <ul>
                                                <li><a href="index-2.html">家庭版 2</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/static/customer/about-us">关于</a></li>
                                        <li><a href="/static/customer/shop">Go Shopping</a></li>
                                        <li ><a href="#">店<span><img src="/static/customer/img/icon/hot.png" alt=""></span></a>
                                            <div class="mega-menu">
                                                    <span>
                                                        <a href="shop-left-sidebar.html" class="title">类别</a>
                                                        <s:forEach items="${pvo.category }" var="c">
                                                            <a href="/static/customer/shop?category_id=${c.category_id}"><i class="fa fa-circle"></i>${c.category_name}</a>
                                                        </s:forEach>
                                                    </span>
                                                <span>
                                                        <a href="shop-left-sidebar.html" class="title">品牌</a>
                                                        <s:forEach items="${pvo.brand }" var="b">
                                                            <a href="/static/customer/shop?brand_id=${b.brand_id }"><i class="fa fa-circle"></i>${b.brand_name}</a>
                                                        </s:forEach>
                                                    </span>
                                                <span>
                                                        <img src="/static/customer/img/menu/1.jpg" alt="">
                                                    </span>
                                            </div>
                                        </li>
                                        <li class="hidden-md"><a href="#">饰品</a></li>
                                        <li class="dropdown"><a href="/static/customer/shop">网页</a>
                                            <ul class="submenu-mainmenu">
                                                <li><a href="/static/customer/checkout">查看</a></li>
                                                <li><a href="/static/customer/shop">购物栏</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/static/customer/contact">联系</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Area end -->
        </header>
        <!-- header end -->
        <!-- banner start -->
        <div class="checkout-banner-area text-center">
            <div class="about-banner-text">
                <div class="banner-title">
                    <h2>我的地址</h2>
                </div>
                <div class="breadcrumbs">
                    <ul>
                        <li class="home"><a href="/customer/index">家</a><span> > </span></li>
                        <li><a href="/customer/shop">购物</a> <span> > </span></li>
                        <li>我的地址</li>
                    </ul>
                </div>
            </div>    
        </div>
        <!-- banner end -->
        <!-- address start -->
        <div class="checkout-area-start">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="cart-tab-menu text-center">
                            <ul>
                                <li class="active"><a href="/fe/address">01. 我的地址</a></li>
                                <li><a href="/customer/cart">02. 我的购物车</a></li>
                                <li><a href="/customer/checkout">03. 结账</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="billing-detail">
                            <div class="section-title">
                                <h4>填写地址</h4>
                            </div>    
                            <form action="/customer/insertaddr" method="post">
                                <p>收货人 <span>*</span><br>
                                <input type="text" placeholder="请输入收货人姓名" name="consignee">
                                </p>
                                <p>收货人电话 <span>*</span><br>
                                <input type="text" placeholder="请输入收货人电话" name="consignee_phone">
                                </p>
                                <p>邮编 <span>*</span><br>
                                <input type="text" placeholder="请输入邮编地址" name="zip">
                                </p>
                                <div class="row">
                                    <p class="col-sm-4 col-xs-12">
                                        省份 <span>*</span><br>
                                        <select name="province">
		                                    <option value="广东省">广东省</option>
		                                    <option value="湖南省">湖南省</option>
		                                </select>
                                    </p>
                                    <p class="col-sm-4 col-xs-12">
                                        城市 <span>*</span><br>
                                        <select name="city">
		                                    <option value="珠海市">珠海市</option>
		                                    <option value="广州市">广州市</option>
		                                    <option value="湛江市">湛江市</option>
		                                    <option value="中山市">中山市</option>
		                                </select>
                                    </p>
                                    <p class="col-sm-4 col-xs-12">
                                        小区/镇 <span>*</span><br>
                                        <select name="district">
		                                    <option value="香洲区">香洲区</option>
		                                    <option value="斗门区">斗门区</option>
		                                    <option value="拱北区">拱北区</option>
		                                    <option value="吉大区">吉大区</option>
		                                </select>
                                    </p>
                                </div>
                                <p>详细地址 <span>*</span><br>
                                	<input type="text" placeholder="请输入您的详细地址" name="address">
                                </p>
                                <p>是否默认 <span>*</span><br>
                            		<input type="radio" checked="checked" value="0" name="is_default">是
                            		<input type="radio" value="1" name="is_default">否
                            	</p>
                            	<div class="row">
                            		<p class="col-sm-3 col-xs-12"></p>
                                    <p class="col-sm-3 col-xs-12">
                                        <input type="submit" value="保存"/>
                                    </p>
                                    <p class="col-sm-3 col-xs-12">
                                        <input type="reset" value="重置"/>
                                    </p>
                                    <p class="col-sm-3 col-xs-12"></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="billing-detail">
                     		<table class="table table-bordered table-hover table-condensed">
                                 <thead>
                                     <tr>
                                     	 <th class="p-id">Id</th>
                                         <th class="p-name">收货人</th>
                                         <th class="p-phone">收货人电话</th>
                                         <th class="p-area">所在地区</th>
                                         <th class="p-address">详细地址</th>
                                         <th class="p-zip">邮编</th>
                                         <th class="p-operate">操作</th>
                                         <th class="p-default"></th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                 	<s:forEach items="${address}" var="addr">
                                 		<tr>
                                          <td class="p-id text-left">${addr.customer_addr_id}</td>
                                          <td class="p-name text-left">${addr.consignee}</td>
                                          <td class="p-phone text-left">${addr.consignee_phone}</td>
                                          <td class="p-area">${addr.province} ${addr.city} ${addr.district}</td>
                                          <td class="p-address">${addr.address}</td>
                                          <td class="p-zip">${addr.zip}</td>
                                          <td class="p-operate">
                                          	<a href="#" class="edit">修改 </a>|
                                          	<a href="/customer/deleteaddr?addr_id=${addr.customer_addr_id}"> 删除</a>
                                          </td>
                                          <td>
<%--                                          	<s:choose>--%>
<%--                                          		<s:when test="${addr.is_default == 0}">--%>
<%--                                          			默认地址--%>
<%--                                          		</s:when>--%>
<%--                                          		<s:otherwise>--%>
<%--                                          			<a href="/customer/isdefaultaddress?addr_id=${addr.customer_addr_id}">设为默认</a>--%>
<%--                                          		</s:otherwise>--%>
<%--                                          	</s:choose>--%>
                                          </td>
                                      </tr>
                                 	</s:forEach>
                                 </tbody>
                             </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- address end -->
        <!-- client start -->
        <div class="client-area clearfix home-two">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section-title">
                            <h4>我们的品牌</h4>
                        </div>
                    </div>
                </div>    
                <div class="row">
                    <div class="client-owl">
                        <div class="col-md-12">   
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>    
                        </div>
                    </div>
                </div> 
                <div class="row">
                    <div class="section-button text-center">
                        <a href='#' class='slider-button margin-allowed'>查看更多 <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- client end -->
        <!-- footer start -->
        <footer class="footer-area">
            <div class="footer-top-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-4 col-xs-12">
                            <div class="footer-logo text-center">
                                <a href="customer/index"><img src="/static/customer/img/logo/footer-logo.png" alt="Jhilmil"></a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-2 hidden-xs">
                            <div class="footer-social text-center">
                                <ul>
                                    <li><a href="www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="www.linkedin.com" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                                    <li class="hidden-sm"><a href="www.googleplus.com" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                                    <li class="hidden-sm"><a href="www.instagram.com" target="_blank"><i class="fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 hidden-xs">
                            <div class="footer-widget-newsletter">
                                <h4 class="newsletter">业务通讯</h4>
                                <form action="#">
                                    <input type="text" placeholder="在这输入您的email...">
                                    <a class="submit" href="#">订阅</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-middle-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="footer-widget">
                                <h5>Contact</h5>
                                <div class="single-footer-contact">
                                    <div class="footer-icon">
                                        <img src="/static/customer/img/cart/1.png" alt="">
                                    </div>
                                    <div class="footer-contact-info">
                                        <p>湖南 岳阳 ,</p>
                                        <p>Glasgow, D04  89GR</p>
                                    </div>
                                </div>
                                <div class="single-footer-contact">
                                    <div class="footer-icon">
                                        <img src="/static/customer/img/cart/2.png" alt="">
                                    </div>
                                    <div class="footer-contact-info">
                                        <p>电话 : 17673451242</p>
                                        <p>电话 : 17673451242</p>
                                    </div>
                                </div>
                                <div class="single-footer-contact">
                                    <div class="footer-icon">
                                        <img src="/static/customer/img/cart/3.png" alt="">
                                    </div>
                                    <div class="footer-contact-info">
                                        <p>电子邮件 : <a href="#">984805546@qq.com</a></p>
                                        <p>网址 : <a href="http://devitems.com/">www.devitems.com</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="footer-widget">
                                <h5>公司</h5>
                                <ul>
                                    <li><i class="fa fa-circle"></i><a href="/customer/index">家</a></li>
                                    <li><i class="fa fa-circle"></i><a href="/customer/about-us">关于我们</a></li>
                                    <li><i class="fa fa-circle"></i><a href="/customer/contact">联系我们</a></li>
                                    <li><i class="fa fa-circle"></i><a href="/customer/blog">我们的博客</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">支持中心</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">隐私政策</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 hidden-sm">
                            <div class="footer-widget">
                                <h5>支持</h5>
                                <ul>
                                    <li><i class="fa fa-circle"></i><a href="#">配送信息</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">订单跟踪</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">退货</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">礼物卡</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">送货上门</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">在线支持</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-3">
                            <div class="footer-widget">
                                <h5>信息</h5>
                                <ul>
                                    <li><i class="fa fa-circle"></i><a href="#">付款选项</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">运输</a></li>
                                    <li><i class="fa fa-circle"></i><a href="/customer/checkout">查看</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">折扣</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">网站地图</a></li>
                                    <li><i class="fa fa-circle"></i><a href="#">服务</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="copyright">
                                <p>版权所有 @ 2016 <span><a href="http://devitems.com/">Devitems</a></span>. All right reserved. </p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="footer-menu text-center">
                                <nav>
                                    <ul>
                                        <li><a href="">网站地图</a></li>
                                        <li><a href="/customer/contact">联系我们</a></li>
                                        <li><a href="/customer/wishlist">愿望清单</a></li>
                                        <li><a href="#">通讯</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-md-4 hidden-sm">
                            <div class="payment text-right">
                                <img src="/static/customer/img/payment/1.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer end -->
        
		<!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		                    &times;
		                </button>
		                <h4 class="modal-title" id="myModalLabel">
		                  	修改地址
		                </h4>
		            </div>
		            <div class="modal-body">
		                <form class="form-horizontal" role="form">
		                    <div class="form-group">
		                        <label for="addr_id" class="col-sm-2 control-label">ID<span>*</span></label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" id="addr_id" name="addr_id"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="consignee" class="col-sm-2 control-label">收货人 <span>*</span></label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" id="consignee" name="consignee"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="consignee_phone" class="col-sm-2 control-label">电话 <span>*</span></label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" id="consignee_phone" name="consignee_phone"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="zip" class="col-sm-2 control-label">邮编 <span>*</span></label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" id="zip" name="zip"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="province" class="col-sm-2 control-label">省份 <span>*</span></label>
		                        <div class="col-sm-10">
		                            <select id="province" name="province">
		                                    <option value="广东省">广东省</option>
		                                    <option value="湖南省">湖南省</option>
		                            </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="city" class="col-sm-2 control-label">城市 <span>*</span></label>
		                        <div class="col-sm-10">
		                             <select id="city" name="city">
		                                    <option value="珠海市">珠海市</option>
		                                    <option value="广州市">广州市</option>
		                                    <option value="湛江市">湛江市</option>
		                                    <option value="中山市">中山市</option>
		                             </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="district" class="col-sm-2 control-label">小区/镇 <span>*</span><br></label>
		                        <div class="col-sm-10">
		                            <select id="district" name="district">
		                                    <option value="香洲区">香洲区</option>
		                                    <option value="斗门区">斗门区</option>
		                                    <option value="拱北区">拱北区</option>
		                                    <option value="吉大区">吉大区</option>
		                            </select>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="address" class="col-sm-2 control-label">详细地址 <span>*</span></label>
		                        <div class="col-sm-10">
		                            <input type="text" id="address" name="address">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="col-sm-offset-2 col-sm-10">
		                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
		                            </button>
		                            <button type="button" id="save" class="btn btn-default">保存</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>




        <!-- modernizr JS
        ============================================ -->
        <script src="/static/customer/js/vendor/modernizr-2.8.3.min.js"></script>
        <!-- bootstrap JS
        ============================================ -->
        <script src="/static/bootstrap/js/bootstrap.min.js"></script>
        <!-- meanmenu JS
                ============================================ -->
        <script src="/static/customer/js/jquery.meanmenu.js"></script>
        <!-- wow JS
        ============================================ -->
        <script src="/static/customer/js/wow.min.js"></script>
        <!-- owl.carousel JS
        ============================================ -->
        <script src="/static/customer/js/owl.carousel.min.js"></script>
        <!-- countdown JS
        ============================================ -->
        <script src="/static/customer/js/jquery.countdown.min.js"></script>
        <!-- price-slider JS
        ============================================ -->
        <script src="/static/customer/js/jquery-price-slider.js"></script>
        <!-- Elevate Zoom js
        ============================================ -->
        <script src="/static/customer/js/jquery.elevatezoom.js"></script>
        <!-- scrollUp JS
        ============================================ -->
        <script src="/static/customer/js/jquery.scrollUp.min.js"></script>
        <!-- plugins JS
        ============================================ -->
        <script src="/static/customer/js/plugins.js"></script>
        <!-- Nevo Slider js
        ============================================ -->
        <script type="text/javascript" src="/static/customer/js/jquery.nivo.slider.js"></script>
        <script type="text/javascript" src="/static/customer/js/home.js"></script>
        <!-- main JS
        ============================================ -->
        <script src="/static/customer/js/main.js"></script>
    </body>
</html>