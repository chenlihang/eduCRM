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
    <form action="/classmanagement/saveOrUpdate.do" method="post" id="editForm">
        <input type="hidden" name="id" value="${entity.id}">
        <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
            <tr>
                <td class="ui_text_rt" width="140">班级名称</td>
                <td class="ui_text_lt">
                    <input name="name" class="ui_input_txt02" value="${entity.gradeuser}"/>
                </td>
            </tr>
            <tr>
                <td class="ui_text_rt" width="140">学生数量</td>
                <td class="ui_text_lt">
                    <input name="address" class="ui_input_txt02" value="${entity.studenquantity}"/>
                </td>
            </tr>
            <tr>
                <td class="ui_text_rt" width="140">所属学院</td>
                <td class="ui_text_lt">
                    <input name="remark" class="ui_input_txt02" value="${entity.college.name}"/>
                </td>
            </tr>
            <tr>
                <td class="ui_text_rt" width="140">所在的教室教室</td>
                <td class="ui_text_lt">
                    <input name="state" class="ui_input_txt02" value="${entity.room.name}"/>
                </td>
            </tr>



        </table>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-default btn_submit" data-dismiss="modal">提交</button>
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </form>
    <br/>


</div>

</body>
</html>