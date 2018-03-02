<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
                var a = $("#delcfmOverhaul").modal('toggle');
                if(a) {
                    $("#deleteHaulBtn").click(function () {
                        $.get(url, function (data) {
                            if (data.success) {
                                $("#dialog_content").html("删除成功");
                                $(".dialog_info").modal('toggle');
                                $(".btn_close").click(function () {
                                    window.location.reload();
                                });
                            }
                        }, "json");
                    });
                }
            });

            $(".btn_datadictionary").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        $('.dialog_info').modal('toggle');
                        showDialog("操作成功",function () {
                            window.location.href="/customer/view.do";
                        })
                    }
                })
            });

            $("#myModal").on("hidden.bs.modal", function() {
                $(this).removeData("bs.modal");
            });
            /*  $(".btn_add_datadictionary").on("click", function() {
                  alert(1)
                  $(this).removeData("bs.modal");
             });*/
            $('#myModal').on('hidden.bs.modal', function () {
                $(this).removeData("bs.modal").val("");
            });



            /*查看开始*/
            $(".btn_showPage").click(function () {
                var url = $(this).data("url");
                alert(url)
                showDialog("你确定要批量删除",function () {
                    var ids = $.map($(".acb:checked"),function (item) {
                        return $(item).data("eid");
                    });
                    if(ids.length>0&&ids.length==1){
                        $.post(url,{ids:ids},function (data) {
                            if(data.success){
                                showDialog("批量删除成功",function () {
                                    window.location.reload();
                                });
                            }
                        },"json");
                    }else{
                        showDialog("至少选中1条数据");
                    }
                },true);
            });
            /*查看结束*/


        });
    </script>
</head>
<body class="panel panel-default">
<!-- 模态框（Modal） -->
<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

                <%--<%@include file="input.jsp"%>--%>

        </div>
    </div><!-- /.modal -->
</div>
<form id="searchForm" action="/customer/view.do" method="post">
    <div>
        <a href="/customer/input.do" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>新增</a>
       <%-- <a href="#" class="btn btn-default"><i class="fa fa-edit"></i>编辑</a>
        <a href="#" class="btn btn-default"><i class="fa fa-minus"></i>删除</a>--%>
        <a href="#" data-url="/customer/show.do" class="btn btn-default btn_showPage" data-toggle="modal" data-target="#myModal"><i class="fa fa-search"></i>查看</a>
        <a href="#" class="btn btn-default"><i class="fa fa-search"></i>查询</a>
        <a href="#" class="btn btn-default"><i class="fa fa-ellipsis-h"></i>更多</a>
    </div>


    <br/>
    <div class="panel-body table-responsive">
        <table class="table table-hover">
            <thead>
            <tr class="text-center">
                <th class="text-center"><i class="fa fa-trash"></i></th>
                <th>编号</th>
                <th>客户名称</th>
                <th>年龄</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>QQ</th>
                <th>学校</th>
                <th>意向程度</th>
                <th>负责人</th>
                <th>创建人</th>
                <th>日期</th>
                <th>状态</th>
                <th>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.data}" var="entity" varStatus="num">
                <tr>
                    <td class="text-center">
                        <div class="checkbox margin-t-0"><input id="${entity.id}" type="checkbox" class="acb" data-eid="${entity.id}"><label
                                for="${entity.id}"></label></div>
                    </td>
                    <td class="text-center">${num.count}</td>
                    <td>${entity.name}</td>
                    <td>${entity.age}</td>
                    <td>${entity.tel}</td>
                    <td>${entity.email}</td>
                    <td>${entity.QQ}</td>
                    <td>${entity.school}</td>
                    <td>${entity.intentionExtent.name}</td>
                    <td>负责人</td>
                    <td>${entity.inputUser.realname}</td>
                    <td><fmt:formatDate value="${entity.inputTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <c:if test="${entity.state.name=='正式学员'}">
                            <font color="green">${entity.state.name}</font>
                        </c:if>
                        <c:if test="${entity.state.name=='正常'}">
                           ${entity.state.name}
                        </c:if>
                    </td>
                    <td>
                        <a href="/customer/input.do?id=${entity.id}" class="btn btn-default btn_dictionedit" data-toggle="modal" data-target="#myModal"><i class="fa fa-edit"></i>编辑</a>
                        <em style="display: block;padding-top: 3px"></em>
                        <a href="javascript:;" style="width: 88px"  class="btn btn-default btn_dictionarydelete" data-url="/customer/delete.do?id=${entity.id}"><i class="fa fa-minus"></i>删除</a>
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