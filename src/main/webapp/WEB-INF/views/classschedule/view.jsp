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
    <%@include file="../common/plugins.jsp"%>

</head>
<body class="panel panel-default">

<form id="searchForm" action="/classschedule/view.do" method="post">
    <table>
    <tr>
        <td style="padding-right: 20px">
            <input style="width: 150px" name="keyword" value="${qo.keyword}" placeholder="班级"></td>
        <td style="padding-right: 20px">
            <input style="width: 150px" name="keyword" value="${qo.keyword}" placeholder="教室"></td>
        <td style="padding-right: 20px">
            <input style="width: 150px" name="keyword" value="${qo.keyword}" placeholder="老师"></td>
        <td style="padding-right: 20px">
            <div class="input-group" style="width: 200px">
                <fmt:formatDate value="${qo.beginDate}" pattern="yyyy-MM-dd" var="beginDate"/>
                <input type="text" class="form-control date-picker" name="beginDate" value="${beginDate}">
                <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
        </td>
        <td style="padding-right: 20px">
            <div class="input-group" style="width: 200px">
                <fmt:formatDate value="${qo.endDate}" pattern="yyyy-MM-dd" var="endDate"/>
                <input type="text" class="form-control date-picker" name="endDate" value="${endDate}">
                <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
        </td>
        <td style="padding-right: 20px">
            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>查询</button>
        </td>
    </tr>

    </table>


    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>序号</th>
                <th>日期</th>
                <th>星期</th>
                <th>班级</th>
                <th>课程名称</th>
                <th>班主任</th>
                <th>上课教师</th>
                <th>教室</th>
                <th>备注</th>
                <th>状态</th>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${entity.id}</td>
                    <td><fmt:formatDate value="${entity.time}" pattern="yyyy-MM-dd"/></td>
                    <td>${entity.week}</td>
                    <td>${entity.grade.gradeuser}</td>
                    <td>${entity.coursename}</td>
                    <td>${entity.charge}</td>
                    <td>${entity.attendacher}</td>
                    <td>${entity.classroom.name}</td>
                    <td>${entity.remark}</td>
                    <td>${entity.state}</td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>
</body>
</html>