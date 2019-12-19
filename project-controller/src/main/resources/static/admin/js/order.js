$(function(){
    function start(pageNum,pageSize) {
        axios.get('/order/list', {
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
            pageNum: 1,
            pageSize: 5,
            amount: 0,
            orderId: 0,
            orderSn: "",
            loginUsername: ""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            search: function () {
                axios.get('/order/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        loginUsername: vm.loginUsername,
                        orderSn: vm.orderSn
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data));
            },
            searchStatus: function (orderStatus) {
                axios.get('/order/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        orderStatus: orderStatus
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data));
            },
            deleteRow: function (orderId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/order/delete', {
                        params: {
                            orderId: orderId
                        },
                        responseType: "json"
                    }).then(function (result) {
                        start(vm.pageNum,vm.pageSize);
                        // new $.zui.Messager('提示消息：删除成功', {
                        //     type: 'success' // 定义颜色主题
                        // }).show();
                    }).catch(function (error) {
                        console.log(error);
                        alert("删除失败！");
                    });
                }
            },
            ship: function (orderId) {
                axios({
                    method:"POST",
                    url:"/order/update",
                    params: {
                        orderStatus: 1,
                        orderId: orderId
                    },
                    cache:false,
                    processData:false,
                    contentType:false,
                    responseType:"json"
                }).then(response=>(alert("修改成功"),start(vm.pageNum,vm.pageSize)));
            },
            selectDetail: function (orderId) {
                location.href = "/be/detail/"+orderId+"?orderId="+orderId;
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