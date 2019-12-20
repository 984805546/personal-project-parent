$(function () {
    var buildTree = function (data, parentId) {
        var tree = [];
        for (var i = 0; i < data.length; i++) {
            var node = data[i];
            if (node.pid == parentId) {
                var newNode = {};
                newNode.id = node.id;
                newNode.name = node.name;
                newNode.uri = node.uri;
                newNode.children = buildTree(data, node.id);
                tree.push(newNode);
            }
        }
        return tree;
    };

    var generateMenu = function (data) {
        for (var i = 0; i < data.length; i++) {
            var menuItemData = data[i];
            if(menuItemData.children.length==0){
                continue;
            }
            var $menuItem = $("#menuTemplate").clone();
            $menuItem.find(".parent").text(menuItemData.name);
            $menuItem.find(".child").empty();
            for (var j = 0; j < menuItemData.children.length; j++) {
                var $menuChildItem = $("<li><a><span></span></a></li>");
                $menuChildItem.find("a").attr("href",menuItemData.children[j].uri);
                $menuChildItem.find("span").text(menuItemData.children[j].name);
                $menuItem.find(".child").append($menuChildItem);
            }
            $("#treeMenu").append($menuItem);
        }
    };
    // $.getJSON("/rp/query", {"id": 1}, function (result) {
    // 	generateMenu(buildTree(result,0));
    // });
    axios.get('/rp/query', {
        params: {
            id: 1
        },
        responseType: "json"
    }).then(response => (generateMenu(buildTree(response.data,0))));

    $('#treeMenu').on('click', 'a', function() {
    $('#treeMenu li.active').removeClass('active');
    $(this).closest('li').addClass('active');
    });
});