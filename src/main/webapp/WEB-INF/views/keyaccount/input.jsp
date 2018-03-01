<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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





<form id="input_form" action="/keyaccount/saveOrUpdate.do" method="post">
    <input type="hidden" name="id" value="${enity.id}">
    <table style="margin-left: 50px">
        <tr>
            <td>学校名&nbsp;</td>
            <td><input type="text" class="form-control" name="name" value="${enity.name}">
            </td>
            <td>&nbsp;地址&nbsp;</td>
            <td><input type="text" class="form-control" name="address" value="${enity.address}">
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>重要程度&nbsp;</td>
            <td><select name="importance.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${importance}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>


            </select>
            </td>
            <td>&nbsp;意向程度&nbsp;</td>
            <td><select name="intentionLevel.id" class="selectpicker">
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
            <td><select name="college.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${college}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;联系人&nbsp;</td>
            <td><select name="contact.id" class="selectpicker">
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
            <td><select name="marketer.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${marketer}" var="obj">
                    <option value="${obj.id}">${obj.realname}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;跟进人员&nbsp;</td>
            <td><select name="tracer.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${tracer}" var="obj">
                    <option value="${obj.id}">${obj.realname}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;跟进状态&nbsp;</td>
            <td><select name="traceState" class="selectpicker">
                    <option value="false">未跟进</option>
                    <option value="true">已跟进</option>
            </select>
            </td>
            <td>&nbsp;顾客状态&nbsp;</td>
            <td><select name="customerStatus" class="selectpicker">
                    <option value="false">未签约</option>
                    <option value="true">已签约</option>
            </select>
            </td>
            <td>&nbsp;是否有合作&nbsp;</td>
            <td><select name="cooperation" class="selectpicker">
                <option value="false">未合作</option>
                <option value="true">已合作</option>
            </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>

        <tr>
            <td>上次更进的日期</td>
            <td>
                <fmt:formatDate value="${enity.prevTranceTime}" pattern="yyyy-MM-dd" var="prevTranceTime"></fmt:formatDate>

                <input name="prevTranceTime" class="date-picker" value="${prevTranceTime}"></td>
            <td>下一次更进日期</td>
            <td>
                <fmt:formatDate value="${enity.nextTranceTime}" pattern="yyyy-MM-dd" var="nextTranceTime"></fmt:formatDate>
                <input name="nextTranceTime" class="date-picker" value="${nextTranceTime}"></td>

            <td>&nbsp;学科&nbsp;</td>
            <td><select name="subject.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${subject}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
        </tr>



    </table>
    <br/>
    <table>
        <tr >
            <td> &nbsp;学校电话号码</td>
            <td> <input type="number" name="schoolTel" value="${enity.schoolTel}"></td>
            <td> &nbsp;电子邮箱</td>
            <td> <input name="email" value="${enity.email}"></td>
            <td> &nbsp;学生数目</td>
            <td> <input  type="number" name="stuNumber" value="${enity.stuNumber}"></td>
            <td> &nbsp;it学生数目</td>
            <td> <input  type="number" name="itstuNumber" value="${enity.itstuNumber}"></td>
            <td> &nbsp;教师数目</td>
            <td> <input  type="number" name="teacherNumber" value="${enity.teacherNumber}"></td>

        </tr><%--这里--%>
        <tr>
            <td colspan="2">&nbsp;</td> </tr>
        <tr>
            <td>学校类型&nbsp;</td>
            <td><select name="type.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${type}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            </td>
            <td>&nbsp;教育类型&nbsp;</td>
            <td><select name="educate.id" class="selectpicker">
                <option value="-1">请选择</option>
                <c:forEach items="${educate}" var="obj">
                    <option value="${obj.id}">${obj.name}</option>
                </c:forEach>

            </select>
            <script type="text/javascript">
                $("[name^=importance] option[value=${enity.importance.id}]").prop("selected",1);
                $("[name^=intentionLevel] option[value=${enity.intentionLevel.id}]").prop("selected",1);
                $("[name^=college] option[value=${enity.college.id}]").prop("selected",1);
                $("[name^=contact] option[value=${enity.contact.id}]").prop("selected",1);
                $("[name^=marketer] option[value=${enity.marketer.id}]").prop("selected",1);
                $("[name^=tracer] option[value=${enity.tracer.id}]").prop("selected",1);
                $("[name^=type] option[value=${enity.type.id}]").prop("selected",1);
                $("[name^=educate] option[value=${enity.educate.id}]").prop("selected",1);
                $("[name=traceState] option[value=${enity.traceState}]").prop("selected",1);
                $("[name=customerStatus] option[value=${enity.customerStatus}]").prop("selected",1);
                $("[name=cooperation] option[value=${enity.cooperation}]").prop("selected",1);
            </script>
            </td>
            <td>&nbsp;传真&nbsp;</td>
            <td><input name="telegraph" value="${enity.telegraph}"></td>


            <td>&nbsp;邮箱&nbsp;</td>
            <td><input name="postcode" value="${enity.postcode}"></td>
            <td>&nbsp;备注&nbsp;</td>
            <td><textarea name="remark">${enity.remark}</textarea></td>



        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    <tr>
        <td>&nbsp;学校介绍&nbsp;</td>
        <td><textarea name="introduction">${enity.introduction}</textarea></td>

        </tr>



    </table>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-default btn_submit" data-dismiss="modal">提交</button>
            <button type="button" class="btn btn-white" data-dismiss="modal">关闭
            </button>
        </div>
    </div>
    <script type="text/javascript" >
        $(".btn_submit").click(function () {
            var form=$(this).closest("form");
           var args= form.serialize();
            var url=form.prop("action");
           $.post(url,args,function (data) {
               if(data.success)
               {
                window.location.reload();
               }

           })

        })

    </script>
</form>










</body>
</html>
