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
    <!-- zui css -->
    <link rel="stylesheet" href="/static/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/zui/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/admin/css/app.css">
</head>

<body class="bg-primary">
<div class="page page-login text-center">
    <div class="panel">
        <div class="panel-body">
            <div class="logo">
                <a href="javaScript:;">ADMIN-LOGIN</a>
            </div>
            <form action="/user/doLogin" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="ID/帐号">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="code" name="code" placeholder="验证码">
                </div>
                <div class="form-group">
                    <img id="kaptcha" src="/captcha/default"/>
                    <a href="" onclick="changeImg()">看不清...</a>
                </div>
                <div class="form-group">${msg}</div>
                <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
            </form>
        </div>
    </div>
    <footer class="page-copyright page-copyright-inverse">
        <p>WEBSITE BY FS</p>
        <p>© 2019. All RIGHT RESERVED.</p>
    </footer>
</div>

<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
<script src="/static/admin/js/app.js"></script>
<script>
    function changeImg() {
        var imgSrc = $("#kaptcha");
        imgSrc.attr("src", "/captcha/default?t="+new Date());
    }
</script>
</body>
</html>
