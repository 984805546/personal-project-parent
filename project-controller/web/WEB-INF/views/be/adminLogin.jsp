<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-03
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Lowin</title>
    <link rel="stylesheet" href="/static/admin/css/auth.css">
</head>

<body>
<div class="lowin lowin-blue">
    <div class="lowin-brand">
        <img src="/static/admin/img/kodinger.jpg" alt="logo">
    </div>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form method="post">
                    <p>管理员登录</p>
                    <div class="lowin-group">
                        <label>邮箱 <a href="#" class="login-back-link">登录</a></label>
                        <input type="email" autocomplete="email" name="username" class="lowin-input">
                    </div>
                    <div class="lowin-group password-group">
                        <label>密码 <a href="#" class="forgot-link">忘记密码?</a></label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input">
                    </div>
                    <button class="lowin-btn login-btn">
                        登录
                    </button>

                    <div class="text-foot">
                        没有账户? <a href="" class="register-link">注册</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="lowin-box lowin-register">
            <div class="lowin-box-inner">
                <form method="post">
                    <p>让我们创建您的帐户</p>
                    <div class="lowin-group">
                        <label>姓名</label>
                        <input type="text" name="username" autocomplete="name" class="lowin-input">
                    </div>
                    <div class="lowin-group">
                        <label>邮箱</label>
                        <input type="email" autocomplete="email" name="email" class="lowin-input">
                    </div>
                    <div class="lowin-group">
                        <label>密码</label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input">
                    </div>
                    <button class="lowin-btn">
                        注册
                    </button>

                    <div class="text-foot">
                        已有账户? <a href="" class="login-link">登录</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="lowin-footer">

    </footer>
</div>

<script src="/static/admin/js/auth.js"></script>
<script>
    Auth.init({
        login_url: '/admin/dologin',
        forgot_url: '/admin/forgot'
    });
</script>
</body>
</html>
