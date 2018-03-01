<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="/classmanagement/saveOrUpdate.do" method="post" id="editForm">
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
</form>


