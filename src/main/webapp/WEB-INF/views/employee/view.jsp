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
<div>
    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
    <a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>
    <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>
    <a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>
    <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增员工信息
                </h4>
            </div>
            <div class="modal-body">
                在这里添加一些文本
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default">
                    提交更改
                </button>
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<br/>
<div class="panel-body table-responsive">
    <table class="table table-hover">
        <thead>
        <tr class="text-center">
            <th class="text-center"><i class="fa fa-trash"></i></th>
            <th>序号</th>
            <th>账号名</th>
            <th>真实姓名</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>部门</th>
            <th>入职日期</th>
            <th>状态</th>
            <th>是否管理员</th>
        </thead>
        <tbody>
        <c:forEach items="${employees}" var="entity" varStatus="num">
            <tr>
                <td class="text-center">
                    <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                            for="${entity.id}"></label></div>
                </td>
                <td class="text-center">${num.count}</td>
                <td>${entity.username}</td>
                <td>${entity.realname}</td>
                <td>${entity.tel}</td>
                <td>${entity.email}</td>
                <td>${entity.dept.name}</td>
                <td>${entity.inputTime}</td>
                <td>${entity.state}</td>
                <td>${entity.admin}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%@include file="/WEB-INF/views/common/page.jsp"%>
</div>
</body>
</html>