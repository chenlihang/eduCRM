$(function () {
    $("#sysl_datagrid").datagrid({
        url:'/systemLog/query.do',
        fitColumns:true,
        toolbar:'#sysl_toolbar',
        striped:true,
        pagination:true,
        rownumbers:true,
        singleSelect:true,
        fit:true,
        columns:[
            [
                {field:'id', checkbox:true},
                {field:'opUser',title:'登录用户', width:100, formatter:function (value, row, index) {
                        return value?value.realname:'';
                    }},
                {field:'opTime',title:'操作时间', width:100},
                {field:'opIP',title:'操作IP', width:100},
                {field:'function',title:'使用功能', width:100},
                {field:'params',title:'操作参数', width:100}
            ]
        ]
    });
})

function reload() {
    $("#sysl_datagrid").datagrid('reload');
}

function searching() {
    var val = $("#keyword").textbox('getValue');
    var val1 = $("#beginDate").datebox('getValue');
    var val2 = $("#endDate").datebox("getValue");
    $("#sysl_datagrid").datagrid('load',{
        keyword:val,
        beginDate:val1,
        endDate:val2
    });
}