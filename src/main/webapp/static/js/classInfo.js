$(function () {
    //抽取变量
    var cls_datagrid = $("#cls_datagrid");
    var cls_form = $("#cls_form");
    var cls_dialog = $("#cls_dialog");

    //使用一个对象统一管理
    var methodObj = {
        add:function(){
        //清空表单数据
        //cls_form.form('clear');
        //$('#state_combo').combobox('setValue', 1);
        cls_dialog.dialog('open');
        cls_dialog.dialog('setTitle','新增班级');
    },
    edit:function() {
        var row = cls_datagrid.datagrid('getSelected');
        if (!row){
            $.messager.alert("温馨提示","请选择一条数据",'warning');
            return;
        }
        //cls_form.form('clear');
        //回显数据
        cls_form.form('load',row);
        cls_dialog.dialog('open');
        cls_dialog.dialog('setTitle','编辑班级');
    },
        reload:function() {
        cls_datagrid.datagrid('reload');
    },
        remove1:function () {
            var row = $("#cls_datagrid").datagrid('getSelected');
            if (!row){
                $.messager.alert("温馨提示","请选择一条数据",'warning');
                return;
            }
            $.messager.confirm("确认对话框","您确定要删除该数据吗",function (r) {
                if (r){
                    $.get('/classInfo/delete.do',{id:row.id},function (data) {
                        if (data.success) {
                            $.messager.alert("温馨提示","删除成功", 'info',function () {
                                //关闭弹出框
                                $("#cls_dialog").dialog('close');
                                $("#cls_datagrid").datagrid('reload');
                            });
                        }else{
                            $.messager.alert("温馨提示","删除失败",'error');
                        }
                    },'json');
                }
            });
        },
        //保存按钮
        save:function() {
        cls_form.form('submit',{
            url:'/classInfo/saveOrUpdate.do',
            success:function (data) {
                data = $.parseJSON(data);
                if (data.success) {
                    $.messager.alert("温馨提示","保存成功", 'info',function () {
                        //关闭弹出框
                        cls_dialog.dialog('close');
                        cls_datagrid.datagrid('reload');
                    });
                }else{
                    $.messager.alert("温馨提示","保存失败",'error');
                }
            }
        });

    },
        cancel:function() {
        cls_dialog.dialog('close');
    },

        searching:function () {
        var val = $("#keyword").textbox('getValue');
            var val1 = $("#minInputTime").datebox('getValue');
            var val2 = $("#maxInputTime").datebox("getValue");
        cls_datagrid.datagrid('load',{
            keyword:val,
            minInputTime:val1,
            maxInputTime:val2
        });
    }
    }
    //统一绑定事件
    $("a[data-cmd]").click(function () {
        var methodName = $(this).data("cmd");
        methodObj[methodName]();
    });
    cls_datagrid.datagrid({
        url:'/classInfo/query.do',
        fitColumns:true,
        toolbar:'#cls_toolbar',
        striped:true,
        pagination:true,
        rownumbers:true,
        singleSelect:true,
        fit:true,
        columns:[
            [
                {field:'id', checkbox:true},
                {field:'title',title:'班级名称', width:100},
                {field:'inputTime',title:'开班日期', width:100},
                {field:'state',title:'状态', width:100, formatter:function (value,row,index) {
                        return value?"正常":"<font color='red'>已毕业</font>";
                    }},
                {field:'teacher',title:'班主任', width:100}
            ]
        ]
    });

    cls_dialog.dialog({
        width:400,
        height:500,
        closed:true,
        buttons:'#cls_btns',
        onClose:function () {
            cls_form.form('clear');
        }
    });
});

