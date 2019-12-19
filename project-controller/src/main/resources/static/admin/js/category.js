$(function(){
    function start(pageNum,pageSize) {
        axios.get('/category/list', {
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
            categoryId: 0,
            categoryName: "",
            categoryCode: ""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            searchName:function(){
                axios.get('/category/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        categoryName : vm.search
                    },
                    responseType: "json"
                }).then(function (result) {
                    vm.info = result.data.data;
                }).catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            },
            deleteRow: function (categoryId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/category/delete', {
                        params: {
                            categoryId: categoryId
                        },
                        responseType: "json"
                    }).then(response => (start(vm.pageNum, vm.pageSize)));
                }
            },
            update: function (list) {
                $("#myModalLabel").html("修改品牌信息");
                $("#save").data("op", "update");
                vm.categoryId = list.categoryId;
                vm.categoryName = list.categoryName;
                vm.categoryCode = list.categoryCode;

                $("#myModal").modal("show");
            },
            insert: function () {
                $("#myModalLabel").html("添加品牌信息");
                $("#save").data("op", "insert");
                vm.categoryId = 0;
                vm.categoryName = "";
                vm.categoryCode = "";

                $("#myModal").modal('show');
            },
            save: function () {
                const op = $("#save").data("op");
                const category = new FormData(document.querySelector("#categoryInfo"));
                category.append("categoryId", vm.categoryId);

                $("#myModal").modal('hide');
                if (op != "update") {
                    axios({
                        method:"POST",
                        url:"/category/insert",
                        data: category,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("添加成功"),start(vm.pageNum,vm.pageSize)));
                }else{
                    axios({
                        method:"POST",
                        url:"/category/update",
                        data: category,
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
    // $('#treeMenu').on('click', 'a', function() {
    //     $('#treeMenu li.active').removeClass('active');
    //     $(this).closest('li').addClass('active');
    // });
});