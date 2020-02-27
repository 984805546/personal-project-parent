$(function(){
    function price(response) {
        vm.info = response.data;
        vm.SubTotal = 0;
        var checkAmount = 0;
        for (let val of vm.info.data) {
            if (val.checked == "true") {
                vm.SubTotal += val.price * val.productAmount;
                checkAmount += 1;
            }
        }
        if (checkAmount == vm.info.data.length) {
            vm.selectAll = true;
        } else {
            vm.selectAll = false;
        }
    };
    function start() {
        axios.get('/carts', {
            params: {
                customerId: 1
            },
            responseType: "json"
        }).then(function (response){price(response)});
    };
    const vm = new Vue({
        el:"#CartBody",
        data: {
            info: [],
            brand: [],
            category: [],
            selectAll: false,
            // select: [],
            uri: "/file/download?filename=",
            SubTotal: 0,
            Shipping: 0,
            GrandTotal: 0
        },
        mounted:
            function () {
                start(),
                axios.get('/brand/all', {
                    responseType: "json"
                }).then(result =>(vm.brand = result.data.data));
                axios.get('/category/all', {
                    responseType: "json"
                }).then(result =>(vm.category = result.data.data));
            },
        methods:{
            updateChecked: function (cartId,checked) {
                axios({
                    method:"PUT",
                    url: "/carts/" + cartId,
                    params: {
                        cartId: cartId,
                        checked: checked == "false" ? "true" : "false"
                    },
                    processData:false,
                    contentType:false,
                    responseType:"json"
                }).then(response=>(start()));
            },
            updateAmount: function (cartId,productAmount) {
                axios({
                    method:"PUT",
                    url: "/carts/" + cartId,
                    params: {
                        cartId: cartId,
                        productAmount: productAmount
                    },
                    processData:false,
                    contentType:false,
                    responseType:"json"
                }).then(response=>(start()));
            }
        },
        watch:{
            selectAll: function (newvalue) {
                if (newvalue) {
                    for (let list of vm.info.data) {
                        vm.updateChecked(list.cartId,"false");
                    }
                } else {
                    for (let list of vm.info.data) {
                        vm.updateChecked(list.cartId,"true");
                    }
                }
            },
            SubTotal: function (newValue) {
                vm.GrandTotal = vm.Shipping + newValue;
            }
        }
    });
});