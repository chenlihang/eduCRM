<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Issac
  Date: 2018/2/28
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ========== Css Files ========== -->
<link href="/css/root.css" rel="stylesheet">
<%@include file="/WEB-INF/views/common/plugins.jsp" %>

<html>
<head>
    <title>编辑大客户</title>
</head>
<body>




<form id="input_form" action="/employee/saveOrUpdate.do" method="post">
    <input type="hidden" name="id" value="${enity.id}">
    <table style="margin-left: 50px">
        <tr>
            <td>学校名&nbsp;</td>
            <td><input type="text" class="form-control" name="realname" value="${enity.name}">
            </td>
            <td>&nbsp;地址&nbsp;</td>
            <td><input type="text" class="form-control" name="realname" value="${enity.address}">
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>重要程度&nbsp;</td>
            <td><select name="importance" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${importance}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;意向程度&nbsp;</td>
            <td><select name="intentionLevel" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${intentionLevel}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
        </tr>

        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>学院&nbsp;</td>
            <td><select name="college" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${college}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;联系人&nbsp;</td>
            <td><select name="contact" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${contact}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
        </tr>
        <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>营销人员&nbsp;</td>
            <td><select name="marketer" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${marketer}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;跟进人员&nbsp;</td>
            <td><select name="tracer" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${tracer}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>

        <tr>
            <td>上次更进的日期</td>
            <td>
                <input class="Wdate" type="text" id="d15" onclick="WdatePicker({isShowClear:false,readOnly:true})"/></td>
        </tr>

        <script>
            $(".strtodate").datetimepicker();
        </script>

    </table>
    <br/>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-default btn_submit" data-dismiss="modal">提交</button>
            <button type="button" class="btn btn-white" data-dismiss="modal">关闭
            </button>
        </div>
    </div>
</form>



    <%--
    importance_id
    intentionLevel_id
    subject_id
    college_id
    contact_id
    marketer_id
    tracer_id
    prevTranceTime
    nextTranceTime
    traceState
    customerStatus
    schoolTel
    email
    stuNumber
    itStuNumber
    type_id
    education_id
    telegraph
    postcode
    teacherNumber
    allStudent
    remark
    introduction
    cooperation--%>






</body>
</html>
