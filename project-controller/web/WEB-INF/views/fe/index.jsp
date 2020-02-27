<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-16
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
<%--    <meta http-equiv="x-ua-compatible" content="ie=edge">--%>
    <title>FS_Home || Jhilmil</title>
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
    <script src="/static/customer/js/index.js"></script>
</head>
<body>
<div id="HomeBody">
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
                            <p>We are open 9 am - 10pm</p>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-8 col-sm-9">
                        <div class="top-right">
                            <div class="top-login-cart">
                                <ul>
                                    <li class=" hidden-xs"><a href="/fe/login">登录或注册</a></li>
                                    <li class=" hidden-xs"><a href="/fe/checkout">查看</a></li>
                                    <li><a href="/fe/viewcart"><img src="/static/customer/img/icon/cart.png" alt="">购物车 (${cart.itemCount})</a>
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
                                                            小计 <span></span>
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
<!-- slider start -->
<div class="slider-wrap">
    <div class="preview-2">
        <div id="nivoslider" class="slides">
            <img src="/static/customer/img/slider/1.jpg" alt="" title="#slider-direction-1"  />
            <img src="/static/customer/img/slider/2.jpg" alt="" title="#slider-direction-2"  />
        </div>
        <!-- direction 1 -->
        <div id="slider-direction-1" class="t-cn slider-direction">
            <div class="nivo_text">
                <div class="slider-content slider-text-1">
                    <div class="wow bounceInDown" data-wow-duration="3s" data-wow-delay="0.3s">
                        <h4>夏季男士系列</h4>
                    </div>
                </div>
                <div class="slider-content slider-text-2">
                    <div class="wow bounceInLeft" data-wow-duration="3s" data-wow-delay="1s">
                        <h1 class="title">男士 - 2019</h1>
                    </div>
                </div>
                <div class="slider-content slider-text-3">
                    <div class="wow bounceInUp" data-wow-duration="3s" data-wow-delay="1s">
                        <a href='#' class='slider-button'>现在去购物 <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- direction 2 -->
        <div id="slider-direction-2" class="slider-direction">
            <div class="nivo_text slide_two">
                <div class="slider-content slider-text-1">
                    <div class="wow bounceInDown" data-wow-duration="2s" data-wow-delay="0.3s">
                        <h4>夏季女士系列</h4>
                    </div>
                </div>
                <div class="slider-content slider-text-2">
                    <div class="wow bounceInRight" data-wow-duration="3s" data-wow-delay="1s">
                        <h1 class="title">女士 - 2019</h1>
                    </div>
                </div>
                <div class="slider-content slider-text-3">
                    <div class="wow bounceInUp" data-wow-duration="3s" data-wow-delay="1s">
                        <a href='#' class='slider-button'>现在去购物 <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider end -->
<!-- service start -->
<div class="service_area clearfix">
    <div class="single-service">
        <div class="service-icon">
            <img src="/static/customer/img/icon/1.png" alt="">
        </div>
        <div class="service-info">
            <h2><a href="#">免费送货</a></h2>
            <p>所有产品免费</p>
        </div>
    </div>
    <div class="single-service">
        <div class="service-icon">
            <img src="/static/customer/img/icon/2.png" alt="">
        </div>
        <div class="service-info">
            <h2><a href="#">在线订购</a></h2>
            <p><a href="www.bootexperts.com">www.bootexperts.com</a></p>
        </div>
    </div>
    <div class="single-service hidden-sm">
        <div class="service-icon">
            <img src="/static/customer/img/icon/3.png" alt="">
        </div>
        <div class="service-info">
            <h2><a href="#">退款</a></h2>
            <p>退款保证</p>
        </div>
    </div>
    <div class="single-service hidden-sm hidden-md">
        <div class="service-icon">
            <img src="/static/customer/img/icon/4.png" alt="">
        </div>
        <div class="service-info">
            <h2><a href="#">礼卷</a></h2>
            <p>惊喜礼卷</p>
        </div>
    </div>
</div>
<!-- service end -->
<!-- banner start -->
<div class="banner-area clearfix">
    <div class="single-banner">
        <a href="#" class="border-hover"><img src="/static/customer/img/banner/1.jpg" alt=""></a>
        <a href='#' class='slider-button'>现在去购物 <i class="fa fa-angle-right"></i></a>
    </div>
    <div class="single-banner">
        <a href="#" class="border-hover"><img src="/static/customer/img/banner/2.jpg" alt=""></a>
        <a href='#' class='slider-button'>现在去购物 <i class="fa fa-angle-right"></i></a>
    </div>
    <div class="single-banner hidden-sm">
        <a href="#" class="border-hover"><img src="/static/customer/img/banner/3.jpg" alt=""></a>
        <a href='#' class='slider-button'>现在去购物 <i class="fa fa-angle-right"></i></a>
    </div>
</div>
<!-- banner end -->
<!-- arrival start -->
<div class="arrival-area clearfix">
    <div class="container">
        <div class="row">

                <div class="col-xs-12">
                    <div class="section-tab">
                        <div class="section-tab-menu text-left">
                            <ul role="tablist">
                                <li role="presentation" class="active"><a href="#new" aria-controls="new" role="tab" data-toggle="tab">新款</a></li>
                                <li role="presentation"><a href="#featured" aria-controls="featured" role="tab" data-toggle="tab">精选</a></li>
                                <li role="presentation"><a href="#best" aria-controls="best" role="tab" data-toggle="tab">畅销</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <div class="tab-content row">
                            <div id="new" role="tabpanel" class="active section-tab-item">
                                <div class="tab-item-slider">
                                    <div class="col-xs-12 col-width">
                                        <div class="single-product">
                                            <div class="single-product-item">
                                                <div class="single-product-img clearfix hover-effect">
                                                    <a href="/fe/product-details/1">
                                                        <img class="primary-image" src="/static/customer/img/product/1.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="single-product-info">
                                                    <div class="pro-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="pro-price">
                                                        <span class="new-price">$150</span>
                                                        <span class="old-price">$180</span>
                                                    </div>
                                                    <div class="pro-name">
                                                        <h4><a href="#">Macbook pro系列 13.3寸</a></h4>
                                                    </div>
                                                </div>
                                                <div class="wish-icon-hover text-center">
                                                    <ul>
                                                        <li><a href="#" data-toggle="tooltip" title="Shopping Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a class="modal-view" href="#" data-toggle="modal" data-target="#productModal"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Compage"><i class="fa fa-refresh"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Like it!"><i class="fa fa-heart"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-width" v-for="p in product">
                                        <div class="single-product">
                                            <div class="single-product-item">
                                                <div class="single-product-img clearfix hover-effect">
                                                    <a href="#">
                                                        <img v-for="pic in picture" class="primary-image" :src="pic.picUrl" alt=""
                                                             v-if="pic.productId === p.productId && pic.picMaster === 1">
                                                    </a>
                                                </div>
                                                <div class="single-product-info">
                                                    <div class="pro-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="pro-price">
                                                        <span class="new-price">{{p.averageCost}}</span>
                                                        <span class="old-price">{{p.price}}</span>
                                                    </div>
                                                    <div class="pro-name">
                                                        <h4><a href="#">{{p.productName}}</a></h4>
                                                    </div>
                                                </div>
                                                <div class="wish-icon-hover text-center">
                                                    <ul>
                                                        <li><a href="#" data-toggle="tooltip" title="Shopping Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a class="modal-view" data-toggle="modal" @click="openModel(p)"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Compage"><i class="fa fa-refresh"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Like it!"><i class="fa fa-heart"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="featured" role="tabpanel" class="section-tab-item">
                                <div class="tab-item-slider">
                                    <div class="col-xs-12 col-width">
                                        <div class="single-product">
                                            <div class="single-product-item">
                                                <div class="single-product-img clearfix hover-effect">
                                                    <a href="#">
                                                        <img class="primary-image" src="/static/customer/img/product/9.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="single-product-info clearfix">
                                                    <div class="pro-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="pro-price">
                                                        <span class="new-price">$150</span>
                                                        <span class="old-price">$180</span>
                                                    </div>
                                                    <div class="pro-name">
                                                        <h4><a href="#">夏季短袖</a></h4>
                                                    </div>
                                                </div>
                                                <div class="wish-icon-hover text-center">
                                                    <ul>
                                                        <li><a href="#" data-toggle="tooltip" title="Shopping Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a class="modal-view" href="#" data-toggle="modal" data-target="#productModal"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Compage"><i class="fa fa-refresh"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Like it!"><i class="fa fa-heart"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="best" role="tabpanel" class="section-tab-item">
                                <div class="tab-item-slider">
                                    <div class="col-xs-12 col-width">
                                        <div class="single-product">
                                            <div class="single-product-item">
                                                <div class="single-product-img clearfix hover-effect">
                                                    <a href="#">
                                                        <img class="primary-image" src="/static/customer/img/product/10.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="single-product-info clearfix">
                                                    <div class="pro-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="pro-price">
                                                        <span class="new-price">$150</span>
                                                        <span class="old-price">$180</span>
                                                    </div>
                                                    <div class="pro-name">
                                                        <h4><a href="#">Electria Ostma</a></h4>
                                                    </div>
                                                </div>
                                                <div class="wish-icon-hover text-center">
                                                    <ul>
                                                        <li><a href="#" data-toggle="tooltip" title="Shopping Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a class="modal-view" href="#" data-toggle="modal" data-target="#productModal"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Compage"><i class="fa fa-refresh"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" title="Like it!"><i class="fa fa-heart"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section-button text-center">
                        <a href='#' class='slider-button'>查看更多<i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- arrival end -->
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
                    <div class="col-md-12"  v-for="b in brand">
                        <div class="single-client">
                            <a href="#"><img :src="uri+b.brandLogo"  alt=""></a>
                        </div>
                    </div>
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
                                <li><i class="fa fa-circle"></i><a href="/fe/customer/index">家</a></li>
                                <li><i class="fa fa-circle"></i><a href="/fe/customer/about-us">关于我们</a></li>
                                <li><i class="fa fa-circle"></i><a href="/fe/customer/contact">联系我们</a></li>
                                <li><i class="fa fa-circle"></i><a href="blog.html">我们的博客</a></li>
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
                                <li><i class="fa fa-circle"></i><a href="/fe/customer/checkout">查看</a></li>
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
                                    <li><a href="/fe/customer/contact">联系我们</a></li>
                                    <li><a href="/fe/customer/wishlist">愿望清单</a></li>
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

    <!-- QUICKVIEW PRODUCT -->
    <div id="quickview-wrapper">
        <!-- Modal -->
        <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="modal-product">
                            <div class="product-images">
                                <div class="main-image images">
                                    <img v-for="pic in picture" alt="" :src="pic.picUrl"
                                         v-if="pic.productId === modelInfo.productId && pic.picMaster === 1">
                                </div>
                            </div><!-- .product-images -->

                            <div class="product-info">
                                <h1>{{modelInfo.productName}}</h1>
                                <div class="price-box">
                                    <p class="price"><span class="special-price"><span class="amount">{{modelInfo.price}}</span></span></p>
                                </div>
                                <a href="shop.html" class="see-all">查看更多</a>
                                <div class="quick-add-to-cart">
                                    <form method="post" class="cart">
                                        <div class="numbers-row">
                                            <input type="number" id="french-hens" value="1">
                                        </div>
                                        <button class="single-add-to-cart-button" type="submit">加入购物车</button>
                                    </form>
                                </div>
                                <div class="quick-desc">
                                    {{modelInfo.descript}}
                                </div>
                                <div class="social-sharing">
                                    <div class="widget widget_socialsharing_widget">
                                        <h3 class="widget-title-modal">分享这个商品</h3>
                                        <ul class="social-icons">
                                            <li><a target="_blank" title="Facebook" href="#" class="facebook social-icon"><i class="fa fa-facebook"></i></a></li>
                                            <li><a target="_blank" title="Twitter" href="#" class="twitter social-icon"><i class="fa fa-twitter"></i></a></li>
                                            <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i class="fa fa-pinterest"></i></a></li>
                                            <li><a target="_blank" title="Google +" href="#" class="gplus social-icon"><i class="fa fa-google-plus"></i></a></li>
                                            <li><a target="_blank" title="LinkedIn" href="#" class="linkedin social-icon"><i class="fa fa-linkedin"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div><!-- .product-info -->
                        </div><!-- .modal-product -->
                    </div><!-- .modal-body -->
                </div><!-- .modal-content -->
            </div><!-- .modal-dialog -->
        </div>
        <!-- END Modal -->
    </div>
    <!-- END QUICKVIEW PRODUCT -->
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
