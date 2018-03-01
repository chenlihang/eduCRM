<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wolfcode</title>

    <!-- ========== Css Files ========== -->
    <link href="/css/root.css" rel="stylesheet">
    <%@include file="/WEB-INF/views/common/plugins.jsp" %>

    <title>大客户管理</title>
</head>
<body>


                <div class="col-md-12">
                    <div class="panel panel-default">
        <form id="searchForm" action="/keyaccount/view.do" method="post">

                        <div class="panel-title">
                            Bordered table
                        </div>
                        <div class="panel-body">
                            <p> <code>大客户</code>查询 </p>


                            <div class="container-fluid">
                                <div class="row-fluid">
                                    <div class="span2 col-lg-2">
                                        <div class=" input-group input-group-sm">
                                            <span class="input-group-addon" >学校/地址</span>
                                            <input type="text" name="keyword" class="form-control" >
                                        </div>
                                    </div>
                                    <div class="span2 col-lg-2">
                                        <div class=" input-group input-group-sm">
                                            <span class="input-group-addon" >意向学科</span>
                                            <select name="subjectId" class="form-control">
                                                <option value="-1">请选择</option>

                                            </select>

                                        </div>
                                    </div>
                                    <div>
                                        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>
                                        <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>







                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <td>序号</td>
                                    <td>学校名</td>
                                    <td >地址</td>
                                    <td >重要程度</td>
                                    <td >意向程度</td>
                                    <td >学校电话</td>
                                    <td >学科</td>
                                    <td>营销人员</td>
                                    <td>跟进人员</td>
                                    <td>上一次跟进日期</td>
                                    <td>下一次跟进日期</td>
                                    <td>跟进状态</td>
                                    <td>顾客状态</td>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${result.data}" var="ele" varStatus="num">

                                    <tr role="row" class=${num.count%2==0?'odd':'even'}>
                                        <td class="sorting_1">${num.count}</td>
                                        <td>${ele.name}</td>
                                        <td>${ele.address}</td>
                                        <td>${ele.importance.name}</td>
                                        <td>${ele.intentionLevel.name}</td>
                                        <td>${ele.schoolTel}</td>
                                        <td>${ele.subject.name}</td>
                                            <%--<td>${ele.contact.name}</td>--%>
                                        <td>${ele.marketer.realname}</td>
                                        <td>${ele.tracer.realname}</td>
                                        <td>${ele.prevTranceTime}</td>
                                        <td>${ele.nextTranceTime}</td>
                                        <c:choose>

                                            <c:when test="${ele.traceState==true}">

                            <td>
                            <span style="color:green">
                                已跟进
                            </span>
                            </td>
                                            </c:when><c:otherwise>

                             <td><span style="color: red">未跟进</span></td>


                                        </c:otherwise>
                                        </c:choose>




                                        <c:choose>
                                            <c:when test="${ele.customerStatus==true}">


                                <td><span style="color: green">已签约</span></td>

                                            </c:when><c:otherwise>

                             <td><span style="color: red">未签约</span></td>


                                        </c:otherwise>
                                        </c:choose>



                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                <%@include file="/WEB-INF/views/common/common_page.jsp"%>
                        </div>
                </form>
                    </div>
                </div>






</body>
</html>
