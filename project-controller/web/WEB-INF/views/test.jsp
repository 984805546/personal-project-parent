<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-20
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>jQuery Tree Demo</h1>

<ul id="tree" class="ztree"></ul>

<input type="button" id="btnSave" value="save"/>

<script src="/static/js/jquery-3.3.1.min.js"></script>
<script>
    var setting = {
        check: {
            //使用复选框
            enable: true
        },
        data: {
            //使用外部数据
            simpleData: {
                enable: true
            }
        }
    };

    function getIdsFromCheckNodes(event, treeId, treeNode) {       //第二步
        var treeObj = $.fn.zTree.getZTreeObj("tree"),
            nodes = treeObj.getCheckedNodes(true),
            id = [];
        for (var i = 0; i < nodes.length; i++) {
            id[i] = nodes[i].id; //第三部
        }
        return id;
    }

    $.getJSON("/privilege/list", {"roleId": 2}, function (result) {
        $.fn.zTree.init($("#tree"), setting, result);
    })


    $("#btnSave").click(function () {
        var ids = getIdsFromCheckNodes();
        console.log(ids);
    });

</script>
<script src="/static/js/jquery.ztree.core.js"></script>
<script src="/static/js/jquery.ztree.excheck.js"></script>
<script src="/static/boo/js/zui.min.js" charset="utf-8"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/vue-router.js"></script>
<script src="/static/admin/js/privilege.js"></script>
</body>
</html>
