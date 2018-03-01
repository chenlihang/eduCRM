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
            // $("#customerSubmit").click(function () {
            //
            //     $("#editForm").ajaxSubmit(function (data) {
            //         if(data.success){
            //             showDialog("操作成功",function () {
            //                 window.location.href="/role/view.do";
            //             })
            //         }
            //     })
            // });
            $("#reload").click(function () {
                var url = $(this).data("url");
                //弹出加载权限对话框
                showDialog("需加载很久，确定加载吗？",function () {
                    //发送ajax请求访问加载权限的方法
                    $.get(url,function (data) {
                        if (data.success){
                            showDialog("加载成功",function () {
                                location.reload();
                            });
                        }
                    });
                },true);
            })
        });
    </script>
</head>
<body class="panel panel-default">
<form id="searchForm" action="/permission/view.do" method="post">
    <div>
        <a href="#" class="btn btn-default" id="reload" data-url="/permission/load.do"><i class="fa fa-refresh"></i>加载权限</a>
        <%--<button type="button" class="btn btn_default">--%>
            <%--<font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="customerSubmit">加载权限</font></font>--%>
        <%--</button>--%>
    </div>



    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="text-center">编号</th>
                <th class="text-center">权限名称</th>
                <th class="text-center">权限资源</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <%--<td>--%>
                       <%--<input id="${entity.id}" type="hidden">--%>
                    <%--</td>--%>
                    <td class="text-center">${num.count}</td>
                    <td class="text-center">${entity.name}</td>
                    <td class="text-center">${entity.resource}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@ include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>

</body>
</html>