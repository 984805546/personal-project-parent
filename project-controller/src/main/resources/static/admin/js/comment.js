$(function(){
    function start(pageNum,pageSize) {
        axios.get('/comment/list', {
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
    const vm = new Vue({
        el:"#container",
        data: {
            info: [],
            pageNum: 1,
            pageSize: 5,
            commentId: 0,
            productName: "",
            orderSn: "",
            loginUsername: ""
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            search: function (){
                axios.get('/comment/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        productName: vm.productName,
                        orderSn: vm.orderSn,
                        loginUsername: vm.loginUsername
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data));
            },
            deleteRow: function (commentId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/comment/delete', {
                        params: {
                            commentId: commentId
                        },
                        responseType: "json"
                    }).then(response => (start(vm.pageNum, vm.pageSize)))
                        .catch(function (error) {
                            console.log(error);
                            alert("删除失败！");
                        });
                }
            }
            // insert: function () {
            //     $("#loginUsername").val("");
            //     $("#password").val("");
            //     $("#myModal").modal('show');
            // },
            // save: function () {
            //     const customer = new FormData(document.querySelector("#customerAdd"));
            //     $("#addCustomer").modal('hide');
            //     axios({
            //         method: "POST",
            //         url: "/picture/insert",
            //         data: customer,
            //         cache: false,
            //         processData: false,
            //         contentType: false,
            //         responseType: "json"
            //     }).then(response => (alert("添加成功"), start(vm.pageNum, vm.pageSize)));
            // }
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