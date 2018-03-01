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
    <%@include file="../common/plugins.jsp"%>

    <script>
        $(function () {
            $(".btn_dictionarydelete").click(function () {
                var url = $(this).data("url");
              /*  showDialog("你确定要删除吗？", function () {*/
                    var a = $("#delcfmOverhaul").modal('toggle');
                    if(a){
                        $("#deleteHaulBtn").click(function () {
                            $.get(url, function (data) {
                               if(data.success){
                                   $("#dialog_content").html("删除成功");

                                   $(".dialog_info").modal('toggle');

                                  /* window.location.reload();*/
                               }
                            },"json");
                        });
                    }
                   /* $.get(url, function (data) {
                        if (data.success) {
                            /!*showDialog("删除成功", function () {
                                window.location.reload();
                            })*!/
                            $("#dialog_content").html("删除成功");
                            $('.dialog_info').modal('toggle');
                        }
                    }, "json");*/
                /*}, true);*/
            });
        /*    $(".btn_datadictionary").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        $('.dialog_info').modal('toggle');
                        showDialog("操作成功",function () {
                            window.location.href="/dataDictionary/view.do";
                        })
                    }
                })
            });*/
            

            $("#myModal3").on("hidden.bs.modal", function() {
                $(this).removeData("bs.modal");
            });
           /*  $(".btn_add_datadictionary").on("click", function() {
                 alert(1)
                 $(this).removeData("bs.modal");
            });*/
           $('#myModal3').on('hidden.bs.modal', function () {
                $(this).removeData("bs.modal").val("");
            });

        });
    </script>
</head>
<body class="panel panel-default">
<!-- 模态框（Modal） -->
<div class="modal fade"  id="myModal3" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

        </div>
    </div><!-- /.modal -->
</div>
<form id="searchForm" action="/dataDictionary/view.do" method="post">

    <div>
        <a href="/dataDictionary/input.do" class="btn btn-default btn_add_datadictionary" data-toggle="modal" data-target="#myModal3"><i class="fa fa-plus"></i>新增</a>
        <%--<a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal3"><i class="fa fa-edit"></i>编辑</a>
        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>--%>
      <%--  <a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>
        <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>--%>
    </div>


    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>编号</th>
                <th>字典目录编码</th>
                <th>字典目录名称</th>
                <th>字典目录简介</th>
                <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${num.count}</td>
                    <td>${entity.name}</td>
                    <td>${entity.sn}</td>
                    <td>${entity.intro}</td>
                    <td>
                        <a href="/dataDictionary/input.do?id=${entity.id}" class="btn btn-default btn_dictionedit" data-url="/dataDictionary/input.do?id=${entity.id}" data-toggle="modal" data-target="#myModal3"><i class="fa fa-edit"></i>编辑</a>
                        <%--<a href="javascript:;" class="btn btn-default btn_dictionarydelete" data-url="/dataDictionary/delete.do?id=${entity.id}"><i class="fa fa-minus"></i>删除</a>--%>
                        <a href="/dataDictionaryItem/view.do?sn=${entity.sn}&sid=${entity.id}" class="btn btn-default"><i class="fa fa-child"></i>查看</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%@include file="/WEB-INF/views/common/page.jsp" %>
    </div>
</form>

<!-- 模态框（Modal） -->
<div class="modal fade" id="input_box" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-content">
    </div><!-- /.modal -->
</div>

<div class="modal fade dialog_info" role="dialog" style="padding-right: 17px;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title">温馨提示</h4>
            </div>
            <div id="dialog_content" class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn_close" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>


<!-- 模态框   信息删除确认 -->
<div class="modal fade dialog_del" id="delcfmOverhaul">
    <div class="modal-dialog modal-sm">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <!-- 隐藏需要删除的id -->
                <input type="hidden" id="deleteHaulId" />
                <p>您确认要删除该条信息吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        id="deleteHaulBtn" data-dismiss="modal">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

</body>
</html>