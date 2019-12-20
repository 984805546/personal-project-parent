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
        axios.get('/privilege/list', {
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
            id: "",
            name: "",
            uri: "",
            pid: ""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            searchName:function(){
                axios.get('/privilege/search', {
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
                    axios.get('/privilege/delete', {
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
                $("#myModalLabel").html("修改权限信息");
                $("#save").data("op", "update");
                vm.id = list.id;
                vm.name = list.name;
                vm.uri = list.uri;
                vm.pid = list.pid;

                $("#myModal").modal("show");
            },
            insert: function () {
                $("#myModalLabel").html("添加权限信息");
                $("#save").data("op", "insert");
                vm.id = "";
                vm.name = "";
                vm.uri = "";
                vm.pid = "";

                $("#myModal").modal('show');
            },
            save: function () {
                const op = $("#save").data("op");

                const privilegeInfo = new FormData(document.querySelector("#privilegeInfo"));
                $("#myModal").modal('hide');
                if (op != "update") {
                    axios({
                        method:"POST",
                        url:"/privilege/insert",
                        data: privilegeInfo,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("添加成功"),start(vm.pageNum,vm.pageSize)));
                }else{
                    axios({
                        method:"POST",
                        url:"/privilege/update",
                        data: privilegeInfo,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("修改成功"),start(vm.pageNum,vm.pageSize)));
                };
            }
        },
        watch:{
            pageNum: function () {
                    start(vm.pageNum, vm.pageSize)
            }
        }
    });
});