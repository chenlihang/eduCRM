$(function () {
    $("#dept_datagrid").datagrid({
        url:'/department/query.do',
        fitColumns:true,
        toolbar:'#dept_toolbar',
        striped:true,
        pagination:true,
        rownumbers:true,
        singleSelect:true,
        fit:true,
        columns:[
            [
                {field:'id', checkbox:true},
                {field:'sn',title:'部门编码', width:100},
                {field:'name',title:'部门名称', width:100},
                {field:'manager',title:'部门经理', width:100,formatter:function (value,row,index) {
                        return value?value.name:"";
                    }},
                {field:'parent',title:'上级部门', width:100,formatter:function (value,row,index) {
                        return value?value.name:"";
                    }},
                {field:'state',title:'状态', width:100,formatter:function (value,row,index) {
                        return value?"部门存在":"<font color='red'>部门不存在</font>";
                    }}
            ]
        ]
    });

    $("#dept_dialog").dialog({
        closed:true,
        buttons:'#dept_btns',
        onClose:function () {
            $("#dept_form").form('clear');
        }
    });
});

function add() {
    $("#dept_dialog").dialog('open');
    $("#dept_dialog").dialog('setTitle','新增部门');
}

function edit() {
    var row = $("#dept_datagrid").datagrid('getSelected');
    if (!row){
        $.messager.alert("温馨提示","请选择一条数据",'warning');
        return;
    }
    //回显数据
    $("#dept_form").form('load',row);
    $("#dept_dialog").dialog('open');
    $("#dept_dialog").dialog('setTitle','编辑部门');
}
function reload() {
    $("#dept_datagrid").datagrid('reload');
}