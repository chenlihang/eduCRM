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
            $(".btn_close").click(function () {
                window.location.reload();
            });
        });
    </script>
</head>
<body class="panel panel-default">
<form id="searchForm" action="/role/view.do" method="post">
    <div>
        <a href="/role/input.do" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
        <%--<a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>--%>
        <%--<a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>--%>
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
                <th class="text-center">操作</th>
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
                    <td class="text-center"><a href="/role/input.do?id=${entity.id}" class="btn btn-default" data-toggle="modal" data-target="#myModal">编辑</a>
                        <a data-path="/role/delete.do?id=${entity.id}" class="btn btn-default btn_change" >删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@ include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>


<!-- 模态框（Modal） -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-content">
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                    <%--&times;--%>
                <%--</button>--%>
                <%--<h4 class="modal-title" id="myModalLabel">--%>
                    <%--新增角色信息--%>
                <%--</h4>--%>
            <%--</div>--%>
            <%--<div class="panel-body">--%>
                <%--<form action="/role/saveOrUpdate.do" method="post" id="editForm">--%>
                <%--&lt;%&ndash;表格开始&ndash;%&gt;--%>
                    <%--<table class="table table-hover">--%>
                        <%--<tr style="padding-bottom: 5px">--%>
                            <%--<td class="text-center">--%>
                                <%--角色编号：--%>
                            <%--</td>--%>
                            <%--<td class="text-center">--%>
                                <%--<input name="sn" type="text">--%>
                            <%--</td>--%>
                        <%--</tr><br/>--%>
                        <%--<tr style="padding-bottom: 5px">--%>
                            <%--<td  class="text-center">--%>
                                <%--角色名称：--%>
                            <%--</td>--%>
                            <%--<td class="text-center">--%>
                                <%--<input name="name" type="text">--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<td class="ui_text_rt" width="140">分配权限</td>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<td class="ui_text_lt">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<table>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<select multiple="true" class="ui_multiselect01 all_permissions">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:forEach items="${permissions}" var="obj">&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<option value="${obj.id}">${obj.name}</option>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<td align="center">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input type="button" id="select" value="-->" class="left2right"/><br/>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input type="button" id="selectAll" value="==>" class="left2right"/><br/>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input type="button" id="deselect" value="<--" class="left2right"/><br/>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input type="button" id="deselectAll" value="<==" class="left2right"/>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<select name="ids" multiple="true" class="ui_multiselect01 selected_permissions">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:forEach items="${entity.permissions}" var="obj">&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<option value="${obj.id}">${obj.name}</option>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                    <%--</table>--%>
                <%--&lt;%&ndash;表格结束&ndash;%&gt;--%>
                <%--</form>--%>
            <%--</div>--%>
            <%--<div class="modal-footer">--%>
                <%--<button type="button" class="btn btn_default">--%>
                    <%--<font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="customerSubmit">保存更改</font></font>--%>
                <%--</button>--%>
                <%--<button type="button" class="btn btn-white" data-dismiss="modal">--%>
                    <%--<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关闭</font></font>--%>
                <%--</button>--%>
            <%--</div>--%>
        <%--</div><!-- /.modal-content -->--%>
    </div><!-- /.modal -->
</div>

<div class="modal fade dialog_info" role="dialog" style="padding-right: 17px;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title">温馨提示</h4>
            </div>
            <div id="dialog_content" class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn_close" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>