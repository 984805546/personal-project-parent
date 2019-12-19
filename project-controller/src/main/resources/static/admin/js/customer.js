$(function(){
    function start(pageNum,pageSize) {
        axios.get('/customer/list', {
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
            inf: [],
            addr: [],
            pageNum: 1,
            pageSize: 5,
            customerId: 0,
            loginUsername: "",
            search: ""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            searchName: function (){
                axios.get('/customer/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        loginUsername : vm.search
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data))
                    .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            },
            deleteRow: function (customerId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/customer/delete', {
                        params: {
                            customerId: customerId
                        },
                        responseType: "json"
                    }).then(response => (start(vm.pageNum, vm.pageSize)))
                        .catch(function (error) {
                            console.log(error);
                            alert("删除失败！");
                        });
                }
            },
            selectInfo: function (customerId) {
                axios.get('/customer/info/' + customerId, {
                    params: {
                        customerId: customerId
                    },
                    responseType: "json"
                }).then(function (response) {
                    if (response.data.data != null) {
                        vm.inf = response.data.data;
                        $("#customerInf").modal("show")
                    }else {
                        alert("该用户未填写详细信息！")
                    }
                });
            },
            selectAddr: function (customerId) {
                axios.get('/customer/addr/default', {
                    params: {
                        customerId: customerId
                    },
                    responseType: "json"
                }).then(function (response) {
                    if (response.data.data != null) {
                        vm.addr = response.data.data;
                        $("#customerAddr").modal("show");
                    } else {
                        alert("该用户未填写收货信息！")
                    }
                });
            },
            insert: function () {
                $("#loginUsername").val("");
                $("#password").val("");
                $("#addCustomer").modal('show');
            },
            save: function () {
                const customer = new FormData(document.querySelector("#customerAdd"));
                $("#addCustomer").modal('hide');
                axios({
                    method: "POST",
                    url: "/picture/insert",
                    data: customer,
                    cache: false,
                    processData: false,
                    contentType: false,
                    responseType: "json"
                }).then(response => (alert("添加成功"), start(vm.pageNum, vm.pageSize)));
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
});