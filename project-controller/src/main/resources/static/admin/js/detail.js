$(function(){
    const orderId = $("#orderId").val();
    function start(pageNum,pageSize) {
        axios.get('/detail/'+orderId, {
            params: {
                pageNum:pageNum,
                pageSize:pageSize,
                orderId: orderId
            },
            responseType: "json"
        }).then(response => (vm.info = response.data.data))
            .catch(function (error) {
                console.log(error);
                alert("未查询到结果！");
            });
        axios.get('/order/'+orderId, {
            params: {
                orderId: orderId
            },
            responseType: "json"
        }).then(response => (
            vm.order = response.data.data,
            vm.customer = response.data.data.customer,
            vm.addr = response.data.data.addr
        ))
            .catch(function (error) {
            console.log(error);
            alert("未查询到结果！");
        });
    };

    const vm = new Vue({
        el:"#container",
        data: {
            info: [],
            customer: [],
            addr: [],
            order: [],
            pageNum: 1,
            pageSize: 5
        },
        mounted: start(this.pageNum,this.pageSize),
        watch:{
            pageNum: function () {
                start(vm.pageNum,vm.pageSize)
            }
        }
    });
    $('#treeMenu').on('click', 'a', function() {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
});