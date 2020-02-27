<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
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
    <script src="/static/customer/js/cart.js"></script>
</head>
<body>
    <div id="CartBody">
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
        <div class="cart-banner-area text-center">
            <div class="about-banner-text">
                <div class="banner-title">
                    <h2>购物车</h2>
                </div>
                <div class="breadcrumbs">
                    <ul>
                        <li class="home"><a href="/customer/index">家</a><span> > </span></li>
                        <li><a href="/customer/shop">购物</a> <span> > </span></li>
                        <li>购物车</li>
                    </ul>
                </div>
            </div>    
        </div>
        <!-- banner end -->
        <!-- cart start -->
        <div class="cart-area-start">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="cart-tab-menu text-center">
                            <ul>
                                <li class="active"><a href="/customer/cart">01. 购物车</a></li>
                                <li><a href="/customer/checkout">02. 查看</a></li>
                                <li><a href="#">03. 订单完成</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <form action="#">
                            <div class="cart-table table-responsive">
                                <form>
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="p-image" >
                                                <input type="checkbox" id="selectAll" v-model="selectAll">
                                                <label for="selectAll">全部</label>
                                            </th>
                                            <th class="p-name">商品信息</th>
                                            <th class="p-amount">单价</th>
                                            <th class="p-quantity">数量</th>
                                            <th class="p-total">总价</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="val in info.data">
                                            <td class="p-image text-left">
                                                <input type="checkbox" :value="val.productId" :checked="val.checked === 'true' ? true : false" @change="updateChecked(val.cartId,val.checked)">
                                            </td>
                                            <td class="p-name">
                                                <div class="cart-img">
                                                    <a href="">
                                                        <img width="126" height="135" :src="uri+val.picUrl" alt="">
                                                    </a>
                                                </div>
                                                <a>{{val.productName}}</a>
                                                <p>Lorem ipsum dolor sit <span></span></p>
                                                <p class="c-p-size"><span>尺寸 : </span> L</p>
                                            </td>
                                            <td class="p-amount"><span class="amount">{{val.price}}</span></td>
                                            <td class="p-quantity"><input type="number" min="1" v-model="val.productAmount" @click="updateAmount(val.cartId,val.productAmount)"></td>
                                            <td class="p-total">
                                                {{val.price * val.productAmount}}
                                                <a href="#">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">

                        <div class="cart-coupn-leftside">
                            <div class="section-title">
                                <h4>收货信息</h4>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <h6>收货人 : </h6>
                                    <div class="shipping-info">
                                        <p>方盛</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h6>电话号码 : </h6>
                                    <div class="shipping-info">
                                        <p>17673451242</p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <h6>收货地址 : </h6>
                                    <div class="shipping-info col-md-4">
                                        <select name="country">
                                            <option>Country</option>
                                            <option>Bangladesh</option>
                                            <option>USA</option>
                                            <option>India</option>
                                            <option>UK</option>
                                            <option>Australia</option>
                                        </select>
                                    </div>
                                    <div class="shipping-info col-md-4">
                                        <select name="country">
                                            <option>Country</option>
                                            <option>Bangladesh</option>
                                            <option>USA</option>
                                            <option>India</option>
                                            <option>UK</option>
                                            <option>Australia</option>
                                        </select>
                                    </div>
                                    <div class="shipping-info col-md-4">
                                        <select name="country">
                                            <option>Country</option>
                                            <option>Bangladesh</option>
                                            <option>USA</option>
                                            <option>India</option>
                                            <option>UK</option>
                                            <option>Australia</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <h6>详细 : </h6>
                                    <div class="shipping-info">
                                        <p>sfsdfsdsdfsdfsdfsd</p>
                                    </div>
                                </div>
                                <div class="col-sm-push-4 col-md-12">
                                    <div class="shipping-info">
                                       <button>更换地址</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="cart-coupon-rightside">
<%--                            <div class="row">--%>
    <%--                                <div class="col-xs-12">--%>
    <%--                                    <div class="section-title">--%>
    <%--                                        <h4>优惠卷号码</h4>--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                            <div class="row">--%>
    <%--                                <div class="col-md-6">--%>
    <%--                                    <div class="cpn-code">--%>
    <%--                                        <input type="text" placeholder="Coupon Code">--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                                <div class="col-md-6">--%>
    <%--                                    <div class="shipping-info">--%>
    <%--                                        <button>申请代码</button>--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
                            <div class="section-title">
                                <h4>购物车总价</h4>
                            </div>
                            <div class="amount-table table-responsive">
                                <table>
                                    <tbody>
                                        <tr class="s-total">
                                            <td>小计 <span>¥{{SubTotal}}</span></td>
                                        </tr>
                                        <tr class="s-total">
                                            <td>邮费 <span>¥{{Shipping}}</span></td>
                                        </tr>
                                        <tr class="g-total">
                                            <td>总计<span class="grand">¥{{GrandTotal}}</span></td>
                                        </tr>											
                                    </tbody>
                                </table>
                            </div>
                            <a href="/customer/checkout" class="checkout">结算</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- cart end -->
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
                        <div class="col-md-12">
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>  
                        <div class="col-md-12">  
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>  
                        <div class="col-md-12">  
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="single-client">
                                <a href="#"><img src="/static/customer/img/client/1.png" alt=""></a>
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
