$(function(){
    function start(pageNum,pageSize) {
        axios.get('/brand/list', {
            params: {
                pageNum: pageNum, pageSize: pageSize
            },
            responseType: "json"
        }).then(function (result) {
            vm.info = result.data.data;
        }).catch(function (error) {
            console.log(error);
            alert("未查询到结果！");
        });
    };
    const vm = new Vue({
        el:"#container",
        data: {
            info: [],
            pageNum: 1,
            pageSize: 5,
            search: "",
            brandId: 0,
            brandName: "",
            telephone: "",
            brandWeb:"",
            brandLogo:"",
            brandDesc:""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            searchName:function(){
                axios.get('/brand/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        brandName : vm.search
                    },
                    responseType: "json"
                }).then(function (result) {
                    vm.info = result.data.data;
                }).catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            },
            deleteRow: function (brandId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/brand/delete', {
                        params: {
                            brandId: brandId
                        },
                        responseType: "json"
                    }).then(function (result) {
                        console.log(brandId);
                        start(vm.pageNum,vm.pageSize);
                    }).catch(function (error) {
                        console.log(error);
                        alert("删除失败！");
                    });
                }
            },
            update: function (list) {
                $("#myModalLabel").html("修改品牌信息");
                $("#save").data("op", "update");
                vm.brandId = list.brandId;
                vm.brandName = list.brandName;
                vm.telephone = list.telephone;
                vm.brandWeb = list.brandWeb;
                vm.brandLogo = list.brandLogo;
                vm.brandDesc = list.brandDesc;

                $("#myModal").modal("show");
            },
            insert: function () {
                $("#myModalLabel").html("添加品牌信息");
                $("#save").data("op", "insert");
                vm.brandId = 0;
                vm.brandName = "";
                vm.telephone = "";
                vm.brandWeb = "";
                vm.brandLogo = "";
                vm.brandDesc = "";

                $("#myModal").modal('show');
            },
            save: function () {
                const op = $("#save").data("op");

                const brandInfo = new FormData(document.querySelector("#brandInfo"));
                brandInfo.append("brandId", vm.brandId);
                $("#myModal").modal('hide');
                if (op != "update") {
                    axios({
                        method:"POST",
                        url:"/brand/insert",
                        data: brandInfo,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("添加成功"),start(vm.pageNum,vm.pageSize)));
                }else{
                    axios({
                        method:"POST",
                        url:"/brand/update",
                        data: brandInfo,
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