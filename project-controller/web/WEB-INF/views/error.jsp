<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-19
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>404</title>

    <!-- zui css -->
    <link rel="stylesheet" href="/static/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/zui/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/admin/css/app.css">
</head>
<body>
    <div class="page page-error text-center">
        <header>
            <h1>404</h1>
            <p>您要的页面找不到了！</p>
        </header>
        <a class="btn btn-primary btn-round" href="index.html" style="margin-right:10px;">回到首页</a>
        <a class="btn btn-round" href="javascript:history.back();">返回上页</a>
        <footer class="page-copyright">
            <p>WEBSITE BY 莫非</p>
            <p>© 2018. All RIGHT RESERVED.</p>
        </footer>
    </div>

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/zui/js/zui.min.js" charset="utf-8"></script>
    <script src="/static/admin/js/app.js"></script>
</body>
</html>
