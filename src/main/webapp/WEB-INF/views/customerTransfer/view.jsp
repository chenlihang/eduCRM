<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

</head>
<body class="panel panel-default">
<form id="searchForm" action="/customerTransfer/view.do" method="post">
    <div>
        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
        <a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>
        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>
        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>
        <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>
    </div>

    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>序号</th>
                <th>被移交客户</th>
                <th>移交时间</th>
                <th>监交人</th>
                <th>新咨询师</th>
                <th>原咨询师</th>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${num.count}</td>
                    <td>${entity.customer.name}</td>
                    <td>${entity.inputTime}</td>
                    <td>${entity.inputUser.realname}</td>
                    <td>${entity.newOwner.realname}</td>
                    <td>${entity.prevOwner.realname}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>
</body>
</html>