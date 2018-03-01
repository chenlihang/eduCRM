<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="/classroom/saveOrUpdate.do" method="post" id="editForm">
    <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
            <td class="ui_text_rt" width="140">教室名称</td>
            <td class="ui_text_lt">
                <input name="name" class="ui_input_txt02" value="${entity.name}"/>
            </td>
        </tr>
        <tr>
            <td class="ui_text_rt" width="140">教室地址</td>
            <td class="ui_text_lt">
                <input name="address" class="ui_input_txt02" value="${entity.address}"/>
            </td>
        </tr>
        <tr>
            <td class="ui_text_rt" width="140">教室坐位数</td>
            <td class="ui_text_lt">
                <input name="remark" class="ui_input_txt02" value="${entity.remark}"/>
            </td>
        </tr>
        <tr>
            <td class="ui_text_rt" width="300">教室标语</td>
            <td class="ui_text_lt">
                <input name="state" class="ui_input_txt02" value="${entity.state}"/>
            </td>
        </tr>



    </table>
</form>


