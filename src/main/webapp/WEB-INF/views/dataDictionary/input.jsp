<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="/dataDictionary/saveOrUpdate.do" method="post" id="editForm">

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><font
                style="vertical-align: inherit;"><font style="vertical-align: inherit;" class="quxiao">×</font></font></span></button>
        <h4 class="modal-title"><font style="vertical-align: inherit;"><font
                style="vertical-align: inherit;">字典编辑</font></font></h4>
    </div>
        <div class="modal-body" style="text-align:center"><font style="vertical-align: inherit; text-align: center"><font
            style="vertical-align: inherit;">


        <input type="hidden" name="id" value="${entity.id}">
        <table style="margin-left: 30px">
            <tr>
                <td>&nbsp;&nbsp;字典名称&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><input type="text" name="name" value="${entity.name}"></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;字典编码&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td style="padding:20px 0px"><input type="text" name="sn" value="${entity.sn}"></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;字典简介&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><input type="text" name="intro" value="${entity.intro}"></td>
            </tr>
        </table>

        </font></font></div>
             <div class="modal-footer">
        <button type="button" class="btn btn-white quxiao" data-dismiss="modal"><font style="vertical-align: inherit;"><font
                style="vertical-align: inherit;">关闭</font></font></button>
        <button type="button" class="btn btn-default btn_datadictionary"><font style="vertical-align: inherit;"><font
                style="vertical-align: inherit;" id="customerSubmit" data-dismiss="modal">保存更改</font></font></button>
        </div>
        </div>
        <script>
            $(function () {
                $(".btn_datadictionary").click(function () {
                    var form = $(this).closest("form");
                    var action = form.attr("action");
                    $.post(action,form.serialize(),function (data) {
                        if (data.success) {
                            $("#dialog_content").html("操作成功");
                            $('.dialog_info').modal('toggle');
                        }
                    });
                });
            });
        </script>

</form>