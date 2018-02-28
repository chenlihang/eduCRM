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

</head>
<body class="panel panel-default">
<form id="searchForm" action="/classroom/view.do" method="post">
    <div>
        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
        <a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>
        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>
        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>
        <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>
    </div>

    <!-- 模态框（Modal） -->
    <form id="editForm" action="/classroom/saveOrUpdate.do" method="post">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">

                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                       新增教室信息
                    </h4>
                </div>
                <div class="modal-body">
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
                            <td class="ui_text_rt" width="140">教室标语</td>
                            <td class="ui_text_lt">
                                <input name="state" class="ui_input_txt02" value="${entity.state}"/>
                            </td>
                        </tr>


                       <%-- <tr>
                            <td>&nbsp;</td>
                            <td class="ui_text_lt">
                                &nbsp;<input type="submit" value="确定保存" class="btn btn-default"
                                             data-url="/client/query.do"/>
                                &nbsp;<input id="cancelbutton" type="button" value="重置" class="ui_input_btn01"/>
                            </td>
                        </tr>--%>
                    </table>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-default" value="确定保存" >
                    </input>
                    <input type="button" class="btn btn-default" value="重置" data-dismiss="modal">
                    </input>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>教室名称</th>
                <th>教室地址</th>
                <th>座位数</th>
                <th>教室状态</th>
                <th>教室标语</th>

            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${entity.name}</td>
                    <td>${entity.address}</td>
                    <td>${entity.seats}</td>
                    <td>${entity.remark}</td>
                    <td>${entity.state}</td>
                    <td>
                        <a href="javascript:" class="btn_input" data-url="/classroom/input.do?id=${entity.id}">编辑</a>
                        <a href="javascript:" class="btn_delete" data-url="/classroom/delete.do?id=${entity.id}">删除</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>
</body>
</html>