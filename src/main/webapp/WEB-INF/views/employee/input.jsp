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
    <script>
        $(".btn_submit").click(function () {
            var form = $(this).closest("form");
            var action = form.attr("action");
            $.post(action, form.serialize(), function (data) {
                if (data.success) {
                    $("#dialog_content").html("保存成功");
                    $('.dialog_info').modal('toggle');
                }
            });
        });

    </script>
</head>
<body>

<div class="panel-title" style="width:300px;margin-left:10px">
    新增/编辑员工信息
    <ul class="panel-tools">
        <li><a class="icon minimise-tool"><i class="fa fa-minus"></i></a></li>
        <li><a class="icon expand-tool"><i class="fa fa-expand"></i></a></li>
        <li><a class="icon closed-tool"><i class="fa fa-times"></i></a></li>
    </ul>
</div>
<div class="panel-body">
    <form id="input_form" action="/employee/saveOrUpdate.do" method="post">
        <input type="hidden" name="id" value="${entity.id}">
        <table style="margin-left: 50px">
            <tr>
                <td>真实姓名&nbsp;</td>
                <td><input type="text" class="form-control" id="input11" name="realname" value="${entity.realname}">
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>电话&nbsp;</td>
                <td><input type="text" class="form-control" name="tel" value="${entity.tel}"></td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>邮箱&nbsp;</td>
                <td><input type="text" class="form-control" name="email" value="${entity.email}"></td>
            </tr>
        </table>
        <%--<div class="form-group">
            <label class="col-sm-2 control-label form-label">真实姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="input11" name="realname" value="${entity.realname}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label form-label">电话</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="tel" value="${entity.tel}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label form-label">邮箱</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="email" value="${entity.email}">
            </div>
        </div>--%>
        <br/>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-default btn_submit" data-dismiss="modal">提交</button>
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </form>
</div>

</body>
</html>