$(function () {
    //抽取变量
    var emp_datagrid = $("#emp_datagrid");
    var emp_form = $("#emp_form");
    var emp_dialog = $("#emp_dialog");

    //使用一个对象统一管理
    var methodObj = {
        add:function(){
        //清空表单数据
        //emp_form.form('clear');
        //$('#state_combo').combobox('setValue', 1);
        $("#password_tr").show();
        emp_dialog.dialog('open');
        emp_dialog.dialog('setTitle','新增员工');
    },
    edit:function() {
        var row = emp_datagrid.datagrid('getSelected');
        if (!row){
            $.messager.alert("温馨提示","请选择一条数据",'warning');
            return;
        }
        //emp_form.form('clear');
        //隐藏密码框
        $("#password_tr").hide();
        //回显数据
        if (row.dept){
            row['dept.id'] = row.dept.id;
        }
        $.ajax({
            url:"/role/getRolesByEid.do",
            data:{employeeId:row.id},
            async:false,
            success:function (data) {
                console.log(data);
                $("#roles_combobox").combobox("setValues",data);
            }
        });
        emp_form.form('load',row);
        emp_dialog.dialog('open');
        emp_dialog.dialog('setTitle','编辑员工');
    },
        changeState:function() {
        var row = emp_datagrid.datagrid('getSelected');
        if (!row){
            $.messager.alert("温馨提示","请选择一条数据",'warning');
            return;
        }
        $.messager.confirm("确认对话框","您确定要设置为离职吗",function (r) {
            if (r){
                $.get('/employee/changeState.do',{id:row.id},function (data) {
                    if (data.success) {
                        $.messager.alert("温馨提示","操作成功", 'info',function () {
                            //关闭弹出框
                            emp_dialog.dialog('close');
                            emp_datagrid.datagrid('reload');
                        });
                    }else{
                        $.messager.alert("温馨提示","操作失败",'error');
                    }
                },'json');
            }
        });
    },
        reload:function() {
        emp_datagrid.datagrid('reload');
    },
        //保存按钮
        save:function() {
        emp_form.form('submit',{
            url:'/employee/saveOrUpdate.do',
            onSubmit:function (param) {
                var ids = $("#roles_combobox").combobox('getValues');
                for (var i=0;i<ids.length; i++){
                    param["roles["+i+"].id"] = ids[i];
                }
            },
            success:function (data) {
                data = $.parseJSON(data);
                if (data.success) {
                    $.messager.alert("温馨提示","保存成功", 'info',function () {
                        //关闭弹出框
                        emp_dialog.dialog('close');
                        emp_datagrid.datagrid('reload');
                    });
                }else{
                    $.messager.alert("温馨提示","保存失败",'error');
                }
            }
        });

    },
        cancel:function() {
        emp_dialog.dialog('close');
    },

        searching:function () {
        var val = $("#keyword").textbox('getValue');
        emp_datagrid.datagrid('load',{
            keyword:val
        });
    }
    }
    //统一绑定事件
    $("a[data-cmd]").click(function () {
        var methodName = $(this).data("cmd");
        methodObj[methodName]();
    });
    emp_datagrid.datagrid({
        url:'/employee/query.do',
        fitColumns:true,
        toolbar:'#emp_toolbar',
        striped:true,
        pagination:true,
        rownumbers:true,
        singleSelect:true,
        fit:true,
        columns:[
            [
                {field:'id', checkbox:true},
                {field:'username',title:'用户名', width:100},
                {field:'realname',title:'真实姓名', width:100},
                {field:'tel',title:'电话', width:100},
                {field:'email',title:'邮箱', width:100},
                {field:'dept',title:'部门', width:100, formatter:function (value,row,index) {
                        return value?value.name:"";
                    }},
                {field:'inputtime',title:'录入时间', width:100},
                {field:'admin',title:'是否管理员', width:100, formatter:function (value,row,index) {
                        return value?"是":"否";
                    }},
                {field:'state',title:'状态', width:100,formatter:function (value,row,index) {
                        return value?"在职":"<font color='red'>离职</font>";
                    }}
            ]
        ],
        onSelect:function (index, row) {
            if (!row.state) {
                $("#changeState_btn").linkbutton({
                    text:'复职'
                })
            }else{
                $("#changeState_btn").linkbutton({
                    text:'离职'
                })
            }
        }
    });

    emp_dialog.dialog({
        width:400,
        height:500,
        closed:true,
        buttons:'#emp_btns',
        onClose:function () {
            emp_form.form('clear');
        }
    });
});

