<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/static/common/common.jsp"%>
<!doctype html>
<html>
<head>
    <title>系统日志</title>
    <script type="text/javascript" src="/static/js/systemLog.js"></script>
</head>
<body>
    <table id="sysl_datagrid"></table>
    <div id="sysl_toolbar">
        <a class="easyui-linkbutton" iconCls="icon-reload" plain="true", onclick="reload()">刷新</a>
        <input class="easyui-textbox" id="keyword" prompt="姓名"/>
        <input class="easyui-datebox" id="beginDate"/>~
        <input class="easyui-datebox" id="endDate"/>
        <a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searching()"></a>
    </div>

        <form id="sysl_form" method="post">
            <table align="center" style="margin-top:15px">
                <input type="hidden" name="id"/>
                <tr>
                    <td>登录用户:</td>
                    <td><input name="opUser.id" class="easyui-textbox"
                               data-options="valueField:'id',textField:'realname',url:'/employee/listAll.do',
                        panelHeight:'auto'"/></td>
                </tr>
                <tr>
                    <td>操作时间:</td>
                    <td><input name="opTime" class="easyui-datebox"/></td>
                </tr>
                <tr>
                    <td>操作IP:</td>
                    <td><input name="opIP" class="easyui-textbox"/></td>
                </tr>
                <tr>
                    <td>使用功能:</td>
                    <td><input name="function" class="easyui-textbox"/></td>
                </tr>
                <tr>
                    <td>操作参数:</td>
                    <td><input name="params" class="easyui-textbox"/></td>
                </tr>
            </table>
        </form>
</body>
</html>
