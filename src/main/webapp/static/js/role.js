$(function () {
    //抽取变量
    var role_datagrid = $("#role_datagrid");
    var role_form = $("#role_form");
    var role_dialog = $("#role_dialog");

    //使用一个对象统一管理
    var methodObj = {
        add:function(){
        role_dialog.dialog('open');
        role_dialog.dialog('setTitle','新增角色');
    },
    edit:function() {
        var row = role_datagrid.datagrid('getSelected');
        if (!row){
            $.messager.alert("温馨提示","请选择一条数据",'warning');
            return;
        }
        //发送请求查询该角色的权限集合
        selfPermissions.datagrid('load',{roleId:row.id});
        //回显数据
        role_form.form('load',row);
        role_dialog.dialog('open');
        role_dialog.dialog('setTitle','编辑角色');
    },
        reload:function() {
        role_datagrid.datagrid('reload');
        },
        //保存按钮
        save:function() {
        role_form.form('submit',{
            url:'/role/saveOrUpdate.do',
            onSubmit:function (param) {
                var rows = selfPermissions.datagrid('getRows');
                for (var i=0; i<rows.length; i++){
                    param["permissions["+i+"].id"] = rows[i].id;

                }
            },
            success:function (data) {
                data = $.parseJSON(data);
                if (data.success) {
                    $.messager.alert("温馨提示","保存成功", 'info',function () {
                        //关闭弹出框
                        role_dialog.dialog('close');
                        role_datagrid.datagrid('reload');
                    });
                }else{
                    $.messager.alert("温馨提示","保存失败",'error');
                }
            }
        });

    },
        cancel:function() {
        role_dialog.dialog('close');
        }
    }
    //统一绑定事件
    $("a[data-cmd]").click(function () {
        var methodName = $(this).data("cmd");
        methodObj[methodName]();
    });
    role_datagrid.datagrid({
        url:'/role/query.do',
        fitColumns:true,
        toolbar:'#role_toolbar',
        striped:true,
        pagination:true,
        rownumbers:true,
        singleSelect:true,
        fit:true,
        columns:[
            [
                {field:'sn',title:'角色编号', width:100},
                {field:'name',title:'角色名称', width:100}
            ]
        ]
    });

    role_dialog.dialog({
        width:400,
        height:500,
        closed:true,
        buttons:'#role_btns',
        onClose:function () {
            role_form.form('clear');
            //清空已有权限数据表格(加载本地数据)
            selfPermissions.datagrid('loadData',[]);
            allPermissions.datagrid('load');
        }
    });
    var allPermissions = $("#allPermissions");
    var selfPermissions = $("#selfPermissions");
    allPermissions.datagrid({
        height:310,
        fitColumns:true,
        title:'所有权限',
        rownumbers:true,
        scrollbarSize:0,
        url:'/permission/selectAll.do',
        columns:[[
            {field:'name',title:'权限名称',width:100, align:'center'}
        ]],
        onClickRow:function (index,row) {
            //判断已有权限的所有数据
            /*var rows = selfPermissions.datagrid('getRows');
            for (var i=0; i<rows.length; i++){
                if (rows[i].id==row.id){
                    selfPermissions.datagrid('selectRow',1);
                    return;
                }
            }*/
            selfPermissions.datagrid('appendRow',row);
            allPermissions.datagrid('deleteRow',index);
        }
    });

    selfPermissions.datagrid({
        height:310,
        fitColumns:true,
        title:'已有权限',
        rownumbers:true,
        scrollbarSize:0,
        url:'/permission/queryPermissionsByRoleId.do',
        columns:[[
            {field:'name',title:'权限名称',width:100, align:'center'}
        ]],
        onClickRow:function (index,row) {
            allPermissions.datagrid('appendRow',row);
            selfPermissions.datagrid('deleteRow',index);
        },
        onLoadSuccess:function (data) {
            var ids = $.map(data.rows,function (item) {
                return item.id;
            });
            var allRows = allPermissions.datagrid('getRows');
            for (var i = allRows.length-1; i>=0; i--){
                var flag = $.inArray(allRows[i].id, ids);
                if (flag>-1) {
                    allPermissions.datagrid('deleteRow',i);
                }
            }
        }
    });
});

