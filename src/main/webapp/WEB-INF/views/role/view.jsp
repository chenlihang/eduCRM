<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wolfcode</title>

    <!-- ========== Css Files ========== -->
    <link href="/css/root.css" rel="stylesheet">
    <%@include file="/WEB-INF/views/common/plugins.jsp" %>

    <script>
        $(function () {
            $("#customerSubmit").click(function () {

                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        showDialog("操作成功",function () {
                            window.location.href="/role/view.do";
                        })
                    }
                })
            });
        });
    </script>
</head>
<body class="panel panel-default">
<form id="searchForm" action="/role/view.do" method="post">
    <div>
        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
        <a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>
        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>
        <%--<a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>--%>
        <%--<a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>--%>
    </div>



    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="text-center">角色编号</th>
                <th class="text-center">角色名称</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <%--<td>--%>
                       <%--<input id="${entity.id}" type="hidden">--%>
                    <%--</td>--%>
                    <td class="text-center">${entity.sn}</td>
                    <td class="text-center">${entity.name}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@ include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>


<!-- 模态框（Modal） -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增角色信息
                </h4>
            </div>
            <div class="panel-body">
                <form action="/role/saveOrUpdate.do" method="post" id="editForm">
                <%--表格开始--%>
                    <table class="table table-hover">
                        <tr style="padding-bottom: 5px">
                            <td class="text-center">
                                角色编号：
                            </td>
                            <td class="text-center">
                                <input name="sn" type="text">
                            </td>
                        </tr><br/>
                        <tr style="padding-bottom: 5px">
                            <td  class="text-center">
                                角色名称：
                            </td>
                            <td class="text-center">
                                <input name="name" type="text">
                            </td>
                        </tr>
                        <%--<tr>--%>
                            <%--<td class="ui_text_rt" width="140">分配权限</td>--%>
                            <%--<td class="ui_text_lt">--%>
                                <%--<table>--%>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--<select multiple="true" class="ui_multiselect01 all_permissions">--%>
                                                <%--<c:forEach items="${permissions}" var="obj">--%>
                                                    <%--<option value="${obj.id}">${obj.name}</option>--%>
                                                <%--</c:forEach>--%>
                                            <%--</select>--%>
                                        <%--</td>--%>
                                        <%--<td align="center">--%>
                                            <%--<input type="button" id="select" value="-->" class="left2right"/><br/>--%>
                                            <%--<input type="button" id="selectAll" value="==>" class="left2right"/><br/>--%>
                                            <%--<input type="button" id="deselect" value="<--" class="left2right"/><br/>--%>
                                            <%--<input type="button" id="deselectAll" value="<==" class="left2right"/>--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<select name="ids" multiple="true" class="ui_multiselect01 selected_permissions">--%>
                                                <%--<c:forEach items="${entity.permissions}" var="obj">--%>
                                                    <%--<option value="${obj.id}">${obj.name}</option>--%>
                                                <%--</c:forEach>--%>
                                            <%--</select>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                <%--</table>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    </table>
                <%--表格结束--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn_default">
                    <font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="customerSubmit">保存更改</font></font>
                </button>
                <button type="button" class="btn btn-white" data-dismiss="modal">
                    <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关闭</font></font>
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>