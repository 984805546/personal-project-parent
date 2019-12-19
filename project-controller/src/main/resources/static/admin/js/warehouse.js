$(function(){
    function start(pageNum,pageSize) {
        axios.get('/warehouse/list', {
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
            wpId: 0,
            productName: "",
            productCore: "",
            currentCnt: 0,
            lockCnt: 0
        },
        mounted: start(this.pageNum, this.pageSize),
        methods:{
            search: function (){
                axios.get('/warehouse/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        productName: vm.productName,
                        productCore: vm.productCore
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data));
            },
            deleteRow: function (wpId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/warehouse/delete', {
                        params: {
                            wpId: wpId
                        },
                        responseType: "json"
                    }).then(response => (start(vm.pageNum, vm.pageSize)))
                        .catch(function (error) {
                            console.log(error);
                            alert("删除失败！");
                        });
                }
            },
            update: function (list) {
                vm.wpId = list.wpId;
                vm.currentCnt = list.currentCnt;
                vm.lockCnt = list.lockCnt;

                $("#myModal").modal("show");
            },
            save: function () {
                const warehouse = new FormData(document.querySelector("#warehouseInfo"));
                warehouse.append("wpId", vm.wpId);
                $("#myModal").modal('hide');
                axios({
                    method: "POST",
                    url: "/warehouse/update",
                    data: warehouse,
                    cache: false,
                    processData: false,
                    contentType: false,
                    responseType: "json"
                }).then(response => (alert("修改成功"), start(vm.pageNum, vm.pageSize)));
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