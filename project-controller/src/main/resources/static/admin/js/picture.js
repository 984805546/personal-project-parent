$(function(){
    function start(pageNum,pageSize) {
        axios.get('/picture/list', {
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
            product: [],
            pageNum: 1,
            pageSize: 5,
            checked: false,
            productPicId: 0,
            productId: 0,
            picMaster: 0,
            picDesc: "",
            picUrl: "",
            searchOne:"",
            searchTwo:""
        },
        mounted: function () {
            start(this.pageNum, this.pageSize),
            axios.get('/product/all', {
                responseType: "json"
            }).then(result =>(vm.product = result.data.data))
                .catch(function (error) {
                    console.log(error);
                    alert("未查询到结果！");
                });
        },
        methods:{
            changeImage: function (data) {
                if (data.target.files[0] != null) {
                    $("#imgDiv").show();
                    let file = data.target.files[0];
                    let fileRead = new FileReader();
                    fileRead.readAsDataURL(file);
                    fileRead.onload = function () {
                        $("#image").attr("src", fileRead.result);

                    };
                } else {
                    $("#imgDiv").hide();
                }
            },
            search: function (){
                axios.get('/picture/search', {
                    params: {
                        pageNum: vm.pageNum,
                        pageSize: vm.pageSize,
                        productName: vm.searchOne,
                        picMaster: vm.searchTwo,
                    },
                    responseType: "json"
                }).then(response => (vm.info = response.data.data));
            },
            deleteRow: function (productPicId) {
                if (confirm("确定要删除吗？")) {
                    axios.get('/picture/delete', {
                        params: {
                            productPicId: productPicId
                        },
                        responseType: "json"
                    }).then(function (result) {
                        console.log(productPicId);
                        start(vm.pageNum,vm.pageSize);
                    }).catch(function (error) {
                        console.log(error);
                        alert("删除失败！");
                    });
                }
            },
            assignment: function (list) {
                vm.productPicId = list.productPicId;
                vm.productId = list.productId;
                vm.checked = list.picMaster > 0 ? true : false;
                vm.picDesc = list.picDesc;
                vm.picUrl = list.picUrl;

                $("#myfile").hide();
                $("#imgDiv").show();
                $("#image").attr("src", list.picUrl);
            },
            details: function (list) {
                $("#myModalLabel").html("图片详情");
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
                vm.productPicId = "";
                vm.productId = "";
                vm.picMaster = "";
                vm.picDesc = "";
                vm.picUrl = "";

                $("#imgDiv").hide();
                $("#myfile").show();
                $("#details").prop("hidden","");
                $("#myModal").modal('show');
            },
            save: function () {
                const op = $("#save").data("op");
                const picture = new FormData(document.querySelector("#picture"));
                picture.append("picMaster", vm.checked ? 1 : 0);
                $("#myModal").modal('hide');
                if (op != "update") {
                    axios({
                        method:"POST",
                        url:"/picture/insert",
                        data: picture,
                        cache:false,
                        processData:false,
                        contentType:false,
                        responseType:"json"
                    }).then(response=>(alert("添加成功"),start(vm.pageNum,vm.pageSize)));
                }else{
                    picture.append("productPicId", vm.productPicId);
                    axios({
                        method:"POST",
                        url:"/picture/update",
                        data: picture,
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
});