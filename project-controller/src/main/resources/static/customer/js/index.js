$(function(){
    const vm = new Vue({
        el:"#HomeBody",
        data: {
            product: [],
            brand: [],
            category: [],
            picture: [],
            modelInfo: [],
        },
        mounted: function () {
            axios.get('/product/all', {
                responseType: "json"
            }).then(result =>(vm.product = result.data.data))
                .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            axios.get('/brand/all', {
                responseType: "json"
            }).then(result =>(vm.brand = result.data.data))
                .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            axios.get('/category/all', {
                responseType: "json"
            }).then(result =>(vm.category = result.data.data))
                .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
            axios.get('/picture/all', {
                responseType: "json"
            }).then(result =>(vm.picture = result.data.data))
                .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
        },
        methods:{
            openModel: function (list) {
                vm.modelInfo = list;
                $("#productModal").modal("show");
            },
            searchName:function(){
                // axios.get('/product/search', {
                //     params: {
                //         pageNum: vm.pageNum,
                //         pageSize: vm.pageSize,
                //         productName : vm.search
                //     },
                //     responseType: "json"
                // }).then(function (result) {
                //     vm.info = result.data;
                // }).catch(function (error) { // 请求失败处理
                //     console.log(error);
                //     alert("未查询到结果！");
                // });
            }
        }
        // watch:{
        //     pageNum: function () {
        //         start(vm.pageNum, vm.pageSize)
        //     }
        // }
    });
});