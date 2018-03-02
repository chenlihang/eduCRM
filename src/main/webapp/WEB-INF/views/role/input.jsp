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
        $(function () {
            $("#customerSubmit").click(function () {
                // $("#editForm").ajaxSubmit(function (data) {
                //     if(data.success){
                //         showDialog("操作成功",function () {
                //             window.location.href="/role/view.do";
                //         })
                //     }
                // })
                var form = $(this).closest("form");
                var action = form.attr("action");
                $(".selected_permissions option").prop("selected",true);
                $.post(action, form.serialize(), function (data) {
                    if (data.success) {
                        $("#dialog_content").html("保存成功");
                        $('.dialog_info').modal('toggle');
                    }
                });
            });
            $(".close").click(function () {
                window.location.reload();
            });

            $("#select").click(function () {
                $(".all_permissions option:selected").appendTo(".selected_permissions")
            })
            $("#deselect").click(function () {
                $(".selected_permissions option:selected").appendTo(".all_permissions")
            })

            //获取右边列表存在的option
            var ids = $.map($(".selected_permissions option"),function(item){
                return item.value;
            })
            //查询左边，删除右边存在的option
            $.each($(".all_permissions option"),function (index,item) {
                if ($.inArray(item.value,ids) != -1){
                    $(item).remove();
                }
            })
        });
    </script>
</head>
<body>


<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        新增角色信息
    </h4>
</div>
<form action="/role/saveOrUpdate.do" method="post" id="editForm">
    <div class="panel-body">
        <input type="hidden" name="id" value="${entity.id}">
        <%--表格开始--%>
        <table class="table table-hover">
            <tr style="padding-bottom: 5px">
                <td class="text-center">
                    角色编号：
                </td>
                <td class="text-center">
                    <input name="sn" type="text" value="${entity.sn}">
                </td>
                <td></td>
                <td></td>
            </tr>
            <br/>
            <tr style="padding-bottom: 5px">
                <td class="text-center">
                    角色名称：
                </td>
                <td class="text-center">
                    <input name="name" type="text" value="${entity.name}">
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="text-center">分配权限：</td>
                <td class="text-center">
                    <select multiple="true" class="ui_multiselect01 all_permissions" style="height: 140px;width: 100px">
                    <c:forEach items="${permissions}" var="obj">
                        <option value="${obj.id}">${obj.name}</option>
                    </c:forEach>
                    </select>
                </td>
                <td class="text-center" style="padding-top: 50px">
                    <input type="button" id="select" value="-->" class="left2right"/><br/>
                    <input type="button" id="deselect" value="<--" class="left2right"/><br/>
                </td>
                <td class="text-center">
                    <select name="ids" multiple="true" class="ui_multiselect01 selected_permissions" style="height: 140px;width: 100px">
                        <c:forEach items="${entity.permissions}" var="obj">
                            <option value="${obj.id}">${obj.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>



                <%--<td class="ui_text_lt text-center">
                    <table class="table table-hover">
                        <tr>
                            <td class="text-center">
                                <select multiple="true" class="ui_multiselect01 all_permissions">
                                    <c:forEach items="${permissions}" var="obj">
                                        <option value="${obj.id}">${obj.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td align="center" class="text-center">
                                <input type="button" id="select" value="-->" class="left2right"/><br/>
                                &lt;%&ndash;<input type="button" id="selectAll" value="==>" class="left2right"/><br/>&ndash;%&gt;
                                <input type="button" id="deselect" value="<--" class="left2right"/><br/>
                                &lt;%&ndash;<input type="button" id="deselectAll" value="<==" class="left2right"/>&ndash;%&gt;
                            </td>
                            <td class="text-center">
                                <select name="ids" multiple="true" class="ui_multiselect01 selected_permissions">
                                    <c:forEach items="${entity.permissions}" var="obj">
                                        <option value="${obj.id}">${obj.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>--%>
            </tr>
        </table>
        <%--表格结束--%>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn_default">
            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"
                                                         id="customerSubmit" data-dismiss="modal">保存更改</font></font>
        </button>
        <button type="button" class="btn btn-white" data-dismiss="modal">
            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关闭</font></font>
        </button>
    </div>
</form>

</body>
</html>