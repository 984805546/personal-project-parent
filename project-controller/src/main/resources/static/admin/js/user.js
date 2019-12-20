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
$(function(){
    function start(pageNum,pageSize) {
        axios.get('/user/list', {
            params: {
                pageNum: pageNum, pageSize: pageSize
            },
            responseType: "json"
        }).then(response =>(vm.info = response.data.data))
            .catch(function (error) {
            console.log(error);
            alert("未查询到结果！");
        });
    };
    function getIdsFromCheckNodes(event, treeId, treeNode) {
        var treeObj = $.fn.zTree.getZTreeObj("tree"),
            nodes = treeObj.getCheckedNodes(true),
            id = [];
        for (var i = 0; i < nodes.length; i++) {
            id[i] = nodes[i].id; //第三部
        }
        return id;
    }
    const vm = new Vue({
        el:"#container",
        data: {
            info: [],
            pageNum: 1,
            pageSize: 5,
            search: "",
            id: 0,
            username: "",
            password: ""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            searchName:function(){
                axios.get('/user/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        name : vm.search
                    },
                    responseType: "json"
                }).then(response =>(vm.info = response.data.data))
                    .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            },
            deleteRow: function (id) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/user/delete', {
                        params: {
                            id: id
                        },
                        responseType: "json"
                    }).then(response =>(vm.info = response.data.data))
                        .catch(function (error) {
                        console.log(error);
                        alert("删除失败！");
                    });
                }
            },
            update: function (list) {
                $("#myModalLabel").html("修改用户信息");
                $("#save").data("op", "update");
                vm.id = list.id;
                vm.username = list.username;
                vm.password = list.password;

                $("#myModal").modal("show");
            },
            insert: function () {
                $("#myModalLabel").html("添加用户信息");
                $("#save").data("op", "insert");
                vm.id = 0;
                vm.username = "";
                vm.password = "";

                $("#myModal").modal('show');
            },
            save: function () {
                const op = $("#save").data("op");

                const user = new FormData(document.querySelector("#userInfo"));
                user.append("id", vm.id);
                $("#myModal").modal('hide');
                if (op != "update") {
                    axios({
                        method:"POST",
                        url:"/user/insert",
                        data: user,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("添加成功"),start(vm.pageNum,vm.pageSize)));
                }else{
                    axios({
                        method:"POST",
                        url:"/user/update",
                        data: user,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("修改成功"),start(vm.pageNum,vm.pageSize)));
                };
            },
            associatedRole: function (id) {
                vm.id = id;
                axios.get('/role/check', {
                    params: {
                        userId : id
                    },
                    responseType: "json"
                }).then(response =>($.fn.zTree.init($("#tree"), setting, response.data)));

                $("#Role").modal("show");
            },
            endue: function () {
                const ids = getIdsFromCheckNodes();
                axios.get('/ur/update', {
                    params: {
                        userId: vm.id,
                        roleId: ids
                    },
                    responseType: "json"
                }).then(response => (console.log(true)));

                $("#Role").modal('hide');
            }
        },
        watch:{
            pageNum: function () {
                    start(vm.pageNum, vm.pageSize)
            }
        }
    });
});