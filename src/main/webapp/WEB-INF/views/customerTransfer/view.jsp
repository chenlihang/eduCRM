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
    <%@include file="/WEB-INF/views/common/plugins.jsp" %>
    <script>
        $(document).ready(function () {
            $('.date-picker').daterangepicker({
                singleDatePicker: true,
                format: 'YYYY-MM-DD'
            }, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });
        });
    </script>
</head>
<body class="panel panel-default">


<form id="searchForm" action="/customerTransfer/view.do" method="post">

    <table>
        <tr>
            <td style="padding-right: 20px">
                <input style="width: 150px" name="keyword" value="${qo.keyword}"></td>
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


    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>序号</th>
                <th>被移交客户</th>
                <th>移交时间</th>
                <th>监交人</th>
                <th>新咨询师</th>
                <th>原咨询师</th>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${num.count}</td>
                    <td>${entity.customer.name}</td>
                    <td>${entity.inputTime}</td>
                    <td>${entity.inputUser.realname}</td>
                    <td>${entity.newOwner.realname}</td>
                    <td>${entity.prevOwner.realname}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="panel panel-default">
            <div class="panel-title">
                Horizontal Form
                <ul class="panel-tools">
                    <li><a class="icon minimise-tool"><i class="fa fa-minus"></i></a></li>
                    <li><a class="icon expand-tool"><i class="fa fa-expand"></i></a></li>
                    <li><a class="icon closed-tool"><i class="fa fa-times"></i></a></li>
                </ul>
            </div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label form-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input11">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label form-label">Surname</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label form-label">Subject</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input122">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label form-label">Message</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Submit</button>
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- /.modal -->
</div>
</body>
</html>