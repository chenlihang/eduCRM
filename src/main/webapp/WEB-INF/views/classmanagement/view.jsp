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
    <%@include file="../common/plugins.jsp"%>

    <script>
        $(function () {
            $("#customerSubmit").click(function () {

                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        showDialog("操作成功",function () {
                            window.location.href="/classmanagement/view.do";
                        })
                    }
                })
            });
        });
    </script>
</head>
<body class="panel panel-default">
<!-- 模态框（Modal） -->
<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span></button>
                <h4 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">教室编辑</font></font></h4>
            </div>
            <div class="modal-body" style="text-align:center"><font style="vertical-align: inherit; text-align: center"><font style="vertical-align: inherit;">
                <%@include file="input.jsp"%>
            </font></font></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关闭</font></font></button>
                <button type="button" class="btn btn-default"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="customerSubmit">保存更改</font></font></button>
            </div>
        </div>
    </div><!-- /.modal -->
</div>
<form id="searchForm" action="/classmanagement/view.do" method="post">
    <div>
        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>编辑</a>
        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>
        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>刷新</a>
        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>分配班主任</a>
        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>上传班级课程表</a>

    </div>


    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>班级编号</th>
                <th>班级名称</th>
                <th>学生数量</th>
                <th>所在学院</th>
                <th>班级状态</th>
                <th>所在教室</th>
                <th>班主任</th>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td>${entity.id}</td>
                    <td>${entity.gradeuser}</td>
                    <td>${entity.studenquantity}</td>
                    <td>${entity.college.name}</td>
                    <td>${entity.gradestate}</td>
                    <td>${entity.room.name}</td>
                    <td>${entity.emp.realname}</td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>
</body>
</html>