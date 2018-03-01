$(function () {
    $("#myTabs").tabs({fit:true});
    $("#myTree").tree({
        url:"/menu/getRootMenu.do",
        onClick:function (node) {
            //console.log(node);
            if(node.url){
                var flag = $("#myTabs").tabs('exists',node.text);
                    if (flag) {
                        $("#myTabs").tabs('select',node.text);
                    }else{
                        $("#myTabs").tabs('add',{
                            title:node.text,
                            content:'<iframe src="'+node.url+'" width="100%" height="100%" frameborder="0"></iframe>',
                            closable:true
                        });
                }
            }
        }
    });
});
