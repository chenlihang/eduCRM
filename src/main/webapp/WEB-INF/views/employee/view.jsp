<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

            $(".btn_close").click(function () {
                window.location.reload();
            });

            $(".btn_change").click(function () {
                var href = $(this).data("path");
                var ret = $("#dialog_confirm").modal("toggle");
                if (ret) {
                    $.get(href, function (data) {
                        if (data.success) {
                            $("#dialog_content").html("操作成功");
                            $(".dialog_info").modal("toggle");
                        }
                    });
                }
            });
        })
    </script>
</head>
<body class="panel panel-default">


<form id="searchForm" action="/employee/view.do" method="post">

    <table>
        <tr>
            <td style="padding-right: 20px">
                <input style="width: 150px" name="keyword" value="${qo.keyword}"></td>
            <td style="padding-right: 20px">
                <div class="input-group" style="width: 200px">
                    <fmt:formatDate value="${qo.beginDate}" pattern="yyyy-MM-dd" var="beginDate"/>
                    <input type="text" class="form-control date-picker" name="beginDate" value="${beginDate}">
                    <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </td>
            <td style="padding-right: 20px">
                <div class="input-group" style="width: 200px">
                    <fmt:formatDate value="${qo.endDate}" pattern="yyyy-MM-dd" var="endDate"/>
                    <input type="text" class="form-control date-picker" name="endDate" value="${endDate}">
                    <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </td>
            <td style="padding-right: 20px">
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>查询</button>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="padding-top: 20px">
                <div>
                    <a href="/employee/input.do" class="btn btn-default" data-toggle="modal" data-target="#input_box"><i
                            class="fa fa-plus"></i>新增</a>
                    <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>
                </div>
            </td>
        </tr>
    </table>
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
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input class="check_id" id="${entity.id}" value="${entity.id}"
                                                                type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${num.count}</td>
                    <td>${entity.username}</td>
                    <td>${entity.realname}</td>
                    <td>${entity.tel}</td>
                    <td>${entity.email}</td>
                    <td>${entity.dept.name}</td>
                    <td><fmt:formatDate value="${entity.inputTime}" pattern="yyyy-MM-dd"/></td>
                    <td>${entity.state?"在职":"离职"}</td>
                    <td>${entity.admin?"是":"否"}</td>
                    <td><a href="/employee/input.do?id=${entity.id}" class="btn btn-default" data-toggle="modal" data-target="#input_box">编辑</a>
                    <a data-path="/employee/updateState.do?id=${entity.id}" class="btn btn-default btn_change" >修改状态</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>


<!-- 模态框（Modal） -->
<div class="modal fade" id="input_box" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-content">
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
<%--确认操作框--%>
<div class="modal fade" id="dialog_confirm" role="dialog" style="padding-right: 17px;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title">温馨提示</h4>
            </div>
            <div class="modal-body">
                <p>确定要进行此操作?</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="btn_confirm" class="btn btn-default" data-dismiss="modal" >确定</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>