$(function(){
    function start(pageNum,pageSize) {
        axios.get('/product/list', {
            params: {
                pageNum: pageNum, pageSize: pageSize
            },
            responseType: "json"
        }).then(response => (vm.info = response.data.data))
            .catch(function (error) {
            console.log(error);
            alert("未查询到结果！");
        });
    };

    var vm = new Vue({
        el:"#container",
        data: {
            info: [],
            brand: [],
            category: [],
            pageNum: 1,
            pageSize: 5,
            productId: 0,
            productCore: "",
            productName: "",
            brandId: 0,
            categoryId: 0,
            price: 0,
            averageCost: 0,
            productionDate: "",
            shelfLife: 0,
            currentCnt: 0,
            lockCnt: 0,
            descript: "",
            searchOne:"",
            searchTwo:"",
            searchThree:0,
            searchFour:0,
        },
        mounted: function () {
                start(this.pageNum, this.pageSize),
                axios.get('/brand/all', {
                    responseType: "json"
                }).then(function (result) {
                    vm.brand = result.data.data;
                }).catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
                axios.get('/category/all', {
                    responseType: "json"
                }).then(function (result) {
                    vm.category = result.data.data;
                }).catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
        },
        methods:{
            search: function (){
                axios.get('/product/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        productCore: vm.searchOne,
                        productName: vm.searchTwo,
                        categoryId: vm.searchThree,
                        brandId: vm.searchFour
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data));
            },
            deleteRow: function (productId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/product/delete', {
                        params: {
                            productId: productId
                        },
                        responseType: "json"
                    }).then(function (result) {
                        start(vm.pageNum,vm.pageSize);
                    }).catch(function (error) {
                        console.log(error);
                        alert("删除失败！");
                    });
                }
            },
            assignment: function (list) {
                vm.productId = list.productId;
                vm.productCore = list.productCore;
                vm.productName = list.productName;
                vm.brandId = list.brandId;
                vm.categoryId = list.categoryId;
                vm.price = list.price;
                vm.averageCost = list.averageCost;
                vm.productionDate = list.productionDate;
                vm.shelfLife = list.shelfLife;
                vm.descript = list.descript;

                axios.get('/warehouse/searchById', {
                    params: {
                        productId: list.productId
                    },
                    responseType: "json"
                }).then(response =>(
                    vm.currentCnt = response.data.data.currentCnt,
                    vm.lockCnt = response.data.data.lockCnt
                )).catch(function (error) {
                    console.log(error);
                });
            },
            details: function (list) {
                $("#myModalLabel").html("商品详情");
                vm.assignment(list);

                $("#details").prop("hidden","hidden");
                $("#myModal").modal("show");
            },
            update: function (list) {
                $("#myModalLabel").html("修改商品信息");
                $("#save").data("op", "update");
                vm.assignment(list);

                $("#details").prop("hidden","");
                $("#myModal").modal("show");
            },
            insert: function () {
                $("#myModalLabel").html("添加商品信息");
                $("#save").data("op", "insert");
                vm.productId = "";
                vm.productCore = "";
                vm.productName = "";
                vm.brandId = "";
                vm.categoryId = "";
                vm.price = "";
                vm.averageCost = "";
                vm.productionDate = "";
                vm.shelfLife = "";
                vm.currentCnt = "";
                vm.lockCnt = "";
                vm.descript = "";

                $("#details").prop("hidden","");
                $("#myModal").modal('show');
            },
            save: function () {
                const op = $("#save").data("op");
                const productInfo = new FormData(document.querySelector("#productInfo"));
                productInfo.append("productId", vm.productId);
                $("#myModal").modal('hide');
                if (op != "update") {
                    axios({
                        method:"POST",
                        url:"/product/insert",
                        data: productInfo,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("添加成功"),start(vm.pageNum,vm.pageSize)));
                }else{
                    axios({
                        method:"POST",
                        url:"/product/update",
                        data: productInfo,
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
    $('#treeMenu').on('click', 'a', function() {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
    // 仅选择日期
    $(".form-date").datetimepicker({
        language:  "zh-CN",
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: "yyyy-mm-dd"
    });
});