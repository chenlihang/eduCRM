<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/static/common/common.jsp"%>
<!doctype html>
<html>
<head>
    <title>部门管理</title>
    <script type="text/javascript" src="/static/js/department.js"></script>
</head>
<body>
    <table id="dept_datagrid"></table>
    <div id="dept_toolbar">
        <a class="easyui-linkbutton" iconCls="icon-add" plain="true", onclick="add()">新增</a>
        <a class="easyui-linkbutton" iconCls="icon-edit" plain="true", onclick="edit()">编辑</a>
        <a class="easyui-linkbutton" iconCls="icon-remove" plain="true",  onclick="remove()">解散</a>
        <a class="easyui-linkbutton" iconCls="icon-reload" plain="true", onclick="reload()">刷新</a>
    </div>
    <div id="dept_btns">
        <a class="easyui-linkbutton" iconCls="icon-save" plain="true", onclick="save()">保存</a>
        <a class="easyui-linkbutton" iconCls="icon-cancel" plain="true", onclick="cancel()">取消</a>
    </div>
    <div id="dept_dialog">
        <form id="dept_form" method="post">
            <table align="center" style="margin-top:15px">
                <input type="hidden" name="id"/>
                <tr>
                    <td>部门编码:</td>
                    <td><input name="sn" class="easyui-textbox"/></td>
                </tr>
                <tr>
                    <td>部门名称:</td>
                    <td><input name="name" class="easyui-textbox" prompt="请输入部门名称"/></td>
                </tr>
                <tr>
                    <td>部门经理:</td>
                    <td><input name="manager.id" class="easyui-combobox"
                               data-options="valueField:'id',textField:'name',url:'/department/query.do',
                        panelHeight:'auto'"/></td>
                </tr>
                <tr>
                    <td>上级部门:</td>
                    <td><input name="parent.id" class="easyui-combobox"
                               data-options="valueField:'id',textField:'name',url:'/department/query.do',
                        panelHeight:'auto'"/></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
