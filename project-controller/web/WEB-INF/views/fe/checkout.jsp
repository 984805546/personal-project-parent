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
                            <a href="/customer/index"><img src="/static/customer/img/logo/header-logo.png" alt="Jhilmil"></a>
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
                                            <li class=" hidden-xs"><a href="/customer/login">${customer}</a></li>
                                            <li class=" hidden-xs"><a href="/customer/checkout">查看</a></li>
                                            <li><a href="/customer/viewcart"><img src="/static/customer/img/icon/cart.png" alt="">购物车 (${cart.itemCount})</a>
                                                <ul class="submenu-mainmenu">
                                               		<s:forEach items="${cart.items}" var="item">
	                                               		<li class="single-cart-item clearfix">
	                                                        <span class="cart-img">
	                                                        	<s:forEach items="${pvo.picture}" var="pic">
				                                                	<s:if test="${item.product.product_id == pic.product_id}" var="result">
	                                                            		<a href="#"><img width="50" height="59" src="${pic.pic_url}" alt=""></a>
				                                                	</s:if>
			                                                    </s:forEach>
	                                                        </span>
	                                                        <span class="cart-info">
	                                                            <a href="#">${item.product.product_name}</a>
	                                                            <span>${item.product.price} ✖️ ${item.qty}</span>
	                                                        </span>
	                                                        <span class="trash-cart">
	                                                            <a href="/removefromcart?pid=${item.product.product_id}&&qty=${item.qty}"><i class="fa fa-trash-o"></i></a>
	                                                        </span>
	                                                    </li>
                                               		</s:forEach>
                                                    <li>
                                                        <span class="sub-total-cart text-center">
                                                            小计 <span>${cart.total}</span>
                                                            <a href="/customer/cart" class="view-cart active">查看购物车</a>
                                                            <a href="/customer/checkout" class="view-cart">结账</a>
                                                        </span>
                                                    </li>    
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="search-box">
                                        <form method="post" action="/customer/shop">
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
                                                <li><a href="/customer/index">家</a>
                                                    <ul class="submenu-mainmenu">
                                                        <li><a href="index-2.html">家庭版 2</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="/customer/about-us">关于</a></li>
                                                <li><a href="/customer/shop">Go Shopping</a></li>
                                                <li ><a href="#">店<span><img src="/static/customer/img/icon/hot.png" alt=""></span></a>
                                                    <div class="mega-menu">
                                                        <span>
                                                            <a href="shop-left-sidebar.html" class="title">类别</a>
                                                            <s:forEach items="${pvo.category }" var="c">
                                                            	<a href="/customer/shop?category_id=${c.category_id}"><i class="fa fa-circle"></i>${c.category_name}</a>
                                                            </s:forEach>
                                                        </span>
                                                        <span>
                                                            <a href="shop-left-sidebar.html" class="title">品牌</a>
                                                            <s:forEach items="${pvo.brand }" var="b">
                                                            	<a href="/customer/shop?brand_id=${b.brand_id }"><i class="fa fa-circle"></i>${b.brand_name}</a>
                                                            </s:forEach>
                                                        </span>
                                                        <span>
                                                            <img src="/static/customer/img/menu/1.jpg" alt="">
                                                        </span>
                                                    </div>
                                                </li>
                                                <li class="hidden-md"><a href="#">饰品</a></li>
                                                <li class="dropdown"><a href="/customer/shop">网页</a>
                                                    <ul class="submenu-mainmenu">
                                                        <li><a href="/customer/checkout">查看</a></li>
                                                        <li><a href="/customer/shop">购物栏</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="/customer/contact">联系</a></li>
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
                                                <li><a href="/customer/account"><i class="fa fa-circle"></i>我的账户</a></li>
                                                <li><a href="/customer/address"><i class="fa fa-circle"></i>我的地址</a></li>
                                                <li><a href="/customer/cart"><i class="fa fa-circle"></i>我的购物车</a></li>
                                                <li><a href="/customer/checkout"><i class="fa fa-circle"></i>查看</a></li>
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
                                        <li><a href="/customer/index">家</a>
                                            <ul>
                                                <li><a href="index-2.html">家庭版 2</a></li>
                                            </ul>
                                        </li>
                                       	<li><a href="/customer/about-us">关于</a></li>
                                        <li><a href="/customer/shop">Go Shopping</a></li>
                                        <li ><a href="#">店<span><img src="/static/customer/img/icon/hot.png" alt=""></span></a>
                                            <div class="mega-menu">
                                                <span>
                                                    <a href="shop-left-sidebar.html" class="title">类别</a>
                                                    <s:forEach items="${pvo.category }" var="c">
                                                    	<a href="/customer/shop?category_id=${c.category_id}"><i class="fa fa-circle"></i>${c.category_name}</a>
                                                    </s:forEach>
                                                </span>
                                                <span>
                                                    <a href="shop-left-sidebar.html" class="title">品牌</a>
                                                    <s:forEach items="${pvo.brand }" var="b">
                                                    	<a href="/customer/shop?brand_id=${b.brand_id }"><i class="fa fa-circle"></i>${b.brand_name}</a>
                                                    </s:forEach>
                                                </span>
                                                <span>
                                                    <img src="/static/customer/img/menu/1.jpg" alt="">
                                                </span>
                                            </div>
                                        </li>
                                        <li class="hidden-md"><a href="#">饰品</a></li>
                                        <li class="dropdown"><a href="/customer/shop">网页</a>
                                            <ul class="submenu-mainmenu">
                                                <li><a href="/customer/checkout">查看</a></li>
                                                <li><a href="/customer/shop">购物栏</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/customer/contact">联系</a></li>
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
                    <h2>check out</h2>
                </div>
                <div class="breadcrumbs">
                    <ul>
                        <li class="home"><a href="index.html">Home</a><span> > </span></li>
                        <li><a href="shop.html">Shop</a> <span> > </span></li>
                        <li>checkout</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- banner end -->
        <!-- checkout start -->
        <div class="checkout-area-start">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="cart-tab-menu text-center">
                            <ul>
                                <li><a href="cart.html">01. Shopping Cart</a></li>
                                <li><a href="checkout.html">02. Checkout</a></li>
                                <li><a href="#">03. Order Complete</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="billing-detail">
                            <div class="section-title">
                                <h4>Billing detail</h4>
                            </div>
                            <form action="#">
                                <p>Country <span>*</span><br>
                                    <select>
                                        <option value="">Bangladesh</option>
                                        <option value="">United State</option>
                                    </select>
                                </p>
                                <div class="row">
                                    <p class="col-sm-6 col-xs-12">
                                        First Name <span>*</span><br>
                                        <input type="text" placeholder="First name">
                                    </p>
                                    <p class="col-sm-6 col-xs-12">
                                        Last Name <span>*</span><br>
                                        <input type="text" placeholder="Last name">
                                    </p>
                                </div>
                                <p>Company Name <span>*</span><br>
                                    <input type="text" placeholder="Company name">
                                </p>
                                <div class="row">
                                    <p class="col-sm-6 col-xs-12">
                                        Email Address <span>*</span><br>
                                        <input type="text" placeholder="Email address">
                                    </p>
                                    <p class="col-sm-6 col-xs-12">
                                        Phone No. <span>*</span><br>
                                        <input type="text" placeholder="Phone no.">
                                    </p>
                                </div>
                                <p id="">Address <span>*</span><br>
                                    <input type="text" placeholder="Address line 1">
                                    <input type="text" placeholder="Address line 2">
                                </p>
                                <p>Town/City <span>*</span><br>
                                    <input type="text" placeholder="Town/City">
                                </p>
                                <div class="row">
                                    <p class="col-sm-6 col-xs-12">
                                        State <span>*</span><br>
                                        <input type="text" placeholder="State">
                                    </p>
                                    <p class="col-sm-6 col-xs-12">
                                        Zip Code <span>*</span><br>
                                        <input type="text" placeholder="Zip Code">
                                    </p>
                                </div>
                                <div class="account-address">
                                    <label>
                                        <input type="radio" checked="checked" value="old-address" name="shipping-address">Ship to this address
                                    </label>
                                    <label>
                                        <input type="radio" id="add-new-address" value="new-address" name="shipping-address">Ship to different address
                                    </label>
                                </div>
                                <div id="add-new-address-info">
                                    <div class="customer-name">
                                        <div class="first-name">
                                            <p>First Name<span>*</span></p>
                                            <input type="text" required="">
                                        </div>
                                        <div class="last-name">
                                            <p>Last Name<span>*</span></p>
                                            <input type="text" required="">
                                        </div>
                                    </div>
                                    <div class="customer-info">
                                        <div class="company-name">
                                            <p>Company</p>
                                            <input type="text">
                                        </div>
                                        <div class="email-address">
                                            <p>Email Adress<span>*</span></p>
                                            <input type="email" required="">
                                        </div>
                                    </div>
                                    <p>Address<span>*</span></p>
                                    <input type="text" required="">
                                    <input type="text">
                                    <div class="city-country">
                                        <div class="city">
                                            <p>City<span>*</span></p>
                                            <input type="text" required="">
                                        </div>
                                        <div class="state">
                                            <p>State/Province</p>
                                            <select class="country">
                                                <option value="state">Please select region, state or province</option>
                                                <option value="indo">Bahasa Indonesia</option>
                                                <option value="melyu">Bahasa Melayu</option>
                                                <option value="deutsch">Deutsch (Deutschland)</option>
                                                <option value="austra">English (Australia)</option>
                                                <option value="canada">English (Canada)</option>
                                                <option value="india">English (India)</option>
                                                <option value="ireland">English (Ireland)</option>
                                                <option value="maktoob">English (Maktoob)</option>
                                                <option value="malaysia">English (Malaysia)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="city-country">
                                        <div class="city">
                                            <p>Zip/Postal Code<span>*</span></p>
                                            <input type="text" required="">
                                        </div>
                                        <div class="state">
                                            <p>Country<span>*</span></p>
                                            <select class="country">
                                                <option value="AF">Afghanistan</option>
                                                <option value="AU">Australia</option>
                                                <option value="BH">Bahrain</option>
                                                <option value="BD">Bangladesh</option>
                                                <option value="CA">Canada</option>
                                                <option value="DK">Denmark</option>
                                                <option value="EG">Egypt</option>
                                                <option value="FR">France</option>
                                                <option value="GB">United Kingdom</option>
                                                <option value="US" selected="selected">United States</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="customer-info">
                                        <div class="telephone">
                                            <p>Telephone<span>*</span></p>
                                            <input type="text" required="">
                                        </div>
                                        <div class="fax">
                                            <p>Fax</p>
                                            <input type="text">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="total-cart">
                            <div class="section-title">
                                <h4>Cart total</h4>
                            </div>
                            <div class="your-order">
                                <div class="order-table">
                                    <ul>
                                        <li>
                                            <h5 class="focus">Product <span>Total</span></h5>
                                            <p>Eletria ostma    <span> x  02</span><span>$300.00</span></p>
                                            <p>Celletria ostma  <span> x  01</span><span>$120.00</span></p>
                                            <p>Pelletria ostma  <span> x  02</span><span>$200.00</span></p>
                                        </li>
                                        <li>
                                            <h5>Sub total <span>$620.00</span></h5>
                                        </li>
                                        <li>
                                            <h5>Shipping <span>$0.00</span></h5>
                                        </li>
                                        <li class="order-total-purple">
                                            <h5 class="focus">Grand Total <span>$620.00</span></h5>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="section-title">
                                <h4>Payment Method</h4>
                            </div>
                            <div class="your-order">
                                <div class="order-table">
                                    <ul>
                                        <li>
                                            <label class="checkbox-title">
                                                <input id="transfer" value="bank" name="payment" type="radio">Direct bank tranfer

                                            </label>
                                            <p id="transfer-info">Make your payment directly into our bank account. Please use your order ID as the payment reference. Your order won’t be shippided until the funds have cleared in our account.</p>
                                        </li>
                                        <li>
                                            <label class="checkbox-title">
                                                <input id="payment" value="check" name="payment" type="radio">Cheque Payment
                                            </label>
                                            <p id="payment-info">Make your payment directly into our bank account. Please use your order ID as the payment reference. Your order won’t be shippided until the funds have cleared in our account.</p>
                                        </li>
                                        <li>
                                            <label class="checkbox-title">
                                                <input id="paypal" value="paypal" name="payment" type="radio">Paypal
                                            </label>
                                            <p id="paypal-info">Make your payment directly into our bank account. Please use your order ID as the payment reference. Your order won’t be shippided until the funds have cleared in our account.</p>
                                        </li>
                                        <li>
                                            <label class="checkbox-title red">
                                                <input type="radio">I’ve read &amp; Accept the terms &amp; Conditions.
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <button class="place-order">Place Order</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- checkout end -->
        <!-- client start -->
        <div class="client-area clearfix home-two">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section-title">
                            <h4>Our Brand</h4>
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
                        <a href='#' class='slider-button margin-allowed'>View More <i class="fa fa-angle-right"></i></a>
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