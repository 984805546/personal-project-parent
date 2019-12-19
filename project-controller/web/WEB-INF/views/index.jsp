<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-02
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/js/axios.min.js"></script>
    <script src="/static/js/vue-router.js"></script>
    <script src="/static/js/vue.js"></script>
</head>
<body>
    <div id="demo">
        <h1>Wzl 老狗逼</h1>
        <ul v-for="list in info">
            <li>{{list.brandId}}</li>
            <li>{{list.brandName}}</li>
            <li>{{list.telephone}}</li>
        </ul>
    </div>

<script>
    function start(pageNum,pageSize) {
        axios.get('/brand/list',{
            params:{
                pageNum:pageNum, pageSize: pageSize
            },
            responseType:"json"
        }).then(function (result) { vm.info = result.data.data.list })
            .catch(function (error) { // 请求失败处理
                console.log(error);
            });
    }
    var vm = new Vue({
        el:"#demo",
        data: {
            info: null,
            pageNum: 1,
            pageSize: 5
        },
        mounted: start(this.pageNum, this.pageSize)
    })
</script>
</body>
</html>
