
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

<form id="searchForm" action="/classmanagement/view.do" method="post">
    <table>

        <tr>
            <td colspan="3" style="padding-top: 20px">
                <div>
                    <a href="/classmanagement/input.do" class="btn btn-default" data-toggle="modal" data-target="#input_box"><i
                            class="fa fa-plus"></i>新增</a>
                    <a href="#" class="btn btn-warning"><i class="fa fa-warning"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">删除</font></font></a>
                    <a href="#" class="btn btn-option3"><i class="fa fa-paper-plane-o"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">分配班主任</font></font></a>
                    <a href="#" class="btn btn-option4"><i class="fa fa-star"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上传班级课程表</font></font></a>
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
                    <td>${entity.gradestate ?"开班" :"木开班"}</td>
                    <%--<td>${entity.state?"在职":"离职"}</td>--%>
                    <td>${entity.room.name}</td>
                    <td>${entity.emp.realname ? "暂时没分配" :"(应该员工已离职)"}</td>
                    <td><a href="/classmanagement/input.do?id=${entity.id}" class="btn-default" data-toggle="modal" data-target="#input_box">编辑</a>


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