<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form action="/customer/saveOrUpdate.do" method="post" id="editForm">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span></button>
    <h4 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">潜在客户编辑</font></font></h4>
</div>
<div class="modal-body" style="text-align:center"><font style="vertical-align: inherit; text-align: center"><font style="vertical-align: inherit;">

    <table style="margin-left: 50px">
        <tr>
            <td>&nbsp;&nbsp;姓名&nbsp;:&nbsp;</td>
            <td><input type="text" name="name" value="${entity.name}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄&nbsp;:&nbsp;</td>
              <td><input type="text" name="age" value="${entity.age}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别&nbsp;:&nbsp;</td>
              <td>
                  <table>
                      <tr>
                          <td style="padding-left:10px "> 男&nbsp;:&nbsp;</td>
                          <td> <input type="radio" name="gender" checked value="0"></td>
                          <td style="padding-left:10px">女&nbsp;:&nbsp;</td>
                          <td><input type="radio" name="gender" value="1"></td>

                      </tr>
                  </table>
              </td>
          </tr>
          <tr><td colspan="6">&nbsp;</td></tr>
          <tr>
              <td>&nbsp;&nbsp;电话&nbsp;:&nbsp;</td>
              <td><input type="text" name="tel" value="${entity.tel}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ&nbsp;:&nbsp;</td>
              <td><input type="text" name="QQ" value="${entity.QQ}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;微信&nbsp;:&nbsp;</td>
              <td><input type="text" name="weChat" value="${entity.weChat}"></td>
          </tr>
          <tr>
              <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
              <td>&nbsp;&nbsp;邮箱&nbsp;:&nbsp;</td>
              <td><input type="text" name="email" value="${entity.email}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学校&nbsp;:&nbsp;</td>
              <td><input type="text" name="school" value="${entity.school}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业&nbsp;:&nbsp;</td>
              <td><input type="text" name="major" value="${entity.major}"></td>
          </tr>
          <tr>
              <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
              <td>&nbsp;&nbsp;学历&nbsp;:&nbsp;</td>
              <td><%--<input type="text" name="diplomas" value="${entity.diplomas}">--%>
                  <select name="diplomas.id" id="" style="width: 166px">
                      <c:forEach items="${dataItemList}" var="list" varStatus="s">
                          <c:forEach items="${list.items}" var="dataItem">
                              <c:if test="${list.sn=='DIPLOMAS'}">
                                  <option value="${dataItem.id}">${dataItem.name}</option>
                              </c:if>
                          </c:forEach>
                          <%-- ${list.items}--%>
                      </c:forEach>
                  </select>
              </td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;省份&nbsp;:&nbsp;</td>
              <td><%--<input type="text" name="province" value="${entity.province}">--%>
                  <select name="province.id" id="" style="width: 166px">
                      <c:forEach items="${dataItemList}" var="list" varStatus="s">
                          <c:forEach items="${list.items}" var="dataItem">
                              <c:if test="${list.sn=='PROVINCE'}">
                                  <option value="${dataItem.id}">${dataItem.name}</option>
                              </c:if>
                          </c:forEach>
                          <%-- ${list.items}--%>
                      </c:forEach>
                  </select>
              </td>
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;毕业时间&nbsp;:&nbsp;</td>
               <td><%--<input type="text" name="graduateTime" value="${entity.graduateTime}">--%>
                  <%-- <fmt:formatDate value="${entity.graduateTime}" pattern="yyyy-MM-dd" var="graduateTime"/>
                   <input type="text" class="form-control date-picker" name="graduateTime" value="${graduateTime}">
                   <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
--%>
                   <div class="input-group" style="width: 168px">
                       <fmt:formatDate value="${entity.graduateTime}" pattern="yyyy-MM-dd" var="graduateTime"/>
                       <input type="text" class="form-control date-picker" name="graduateTime" value="${graduateTime}">
                       <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                   </div>
               </td>
           </tr>
        <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
        <tr>
            <td>&nbsp;&nbsp;工作年限&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="workSeniority" value="${entity.workSeniority}">--%>
             <%--   <div class="input-group" style="width: 168px">
                    <fmt:formatDate value="" pattern="yyyy-MM-dd" var="beginDate"/>
                    <input type="text" class="form-control date-picker" name="beginDate" value="">
                    <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>--%>

                <div class="input-group" style="width: 168px">
                    <fmt:formatDate value="${entity.workSeniority}" pattern="yyyy-MM-dd" var="workSeniority"/>
                    <input type="text" class="form-control date-picker" name="workSeniority" value="${workSeniority}">
                    <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户来源&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="source" value="${entity.source}">--%>
                <select name="source.id" id="" style="width: 166px">
                    <c:forEach items="${dataItemList}" var="list" varStatus="s">
                        <c:forEach items="${list.items}" var="dataItem">
                            <c:if test="${list.sn=='SOURCE'}">
                                <option value="${dataItem.id}">${dataItem.name}</option>
                            </c:if>
                        </c:forEach>
                        <%-- ${list.items}--%>
                    </c:forEach>
                </select>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合作高校&nbsp;:&nbsp;</td>
            <td><input type="text" name="collegeClient" value="${entity.collegeClient}"></td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;客户类型&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="clientType" value="${entity.clientType}">--%>
                <select name="clientType.id" id="" style="width: 166px">
                    <c:forEach items="${dataItemList}" var="list" varStatus="s">
                        <c:forEach items="${list.items}" var="dataItem">
                            <c:if test="${list.sn=='CLIENTTYPE'}">
                                <option value="${dataItem.id}">${dataItem.name}</option>
                            </c:if>
                        </c:forEach>
                        <%-- ${list.items}--%>
                    </c:forEach>
                </select>
                </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向校区&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="intentionCampus" value="${entity.intentionCampus}">--%>
                <select name="intentionCampus.id" id="" style="width: 166px">
                    <c:forEach items="${dataItemList}" var="list" varStatus="s">
                        <c:forEach items="${list.items}" var="dataItem">
                            <c:if test="${list.sn=='INTENTIONCAMPUS'}">
                                <option value="${dataItem.id}">${dataItem.name}</option>
                            </c:if>
                        </c:forEach>
                        <%-- ${list.items}--%>
                    </c:forEach>
                </select>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向学科&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="intentionSubject" value="${entity.intentionSubject}">--%>
                <select name="intentionSubject.id" id="" style="width: 166px">
                    <c:forEach items="${dataItemList}" var="list" varStatus="s">
                        <c:forEach items="${list.items}" var="dataItem">
                            <c:if test="${list.sn=='subject'}">
                                <option value="${dataItem.id}">${dataItem.name}</option>
                            </c:if>
                        </c:forEach>
                        <%-- ${list.items}--%>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;意向班级&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="intentionClass" value="${entity.intentionClass}">--%>
                <select name="intentionClass.id" id="" style="width: 166px">
                    <c:forEach items="${dataItemList}" var="list" varStatus="s">
                        <c:forEach items="${list.items}" var="dataItem">
                            <c:if test="${list.sn=='INTENTIONCLASS'}">
                                <option value="${dataItem.id}">${dataItem.name}</option>
                            </c:if>
                        </c:forEach>
                        <%-- ${list.items}--%>
                    </c:forEach>
                </select>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向程度&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="intentionExtent" value="${entity.intentionExtent}">--%>
                <select name="intentionExtent.id" id="" style="width: 166px">
                    <c:forEach items="${dataItemList}" var="list" varStatus="s">
                        <c:forEach items="${list.items}" var="dataItem">
                            <c:if test="${list.sn=='intentionLevel'}">
                                <option value="${dataItem.id}">${dataItem.name}</option>
                            </c:if>
                        </c:forEach>
                        <%-- ${list.items}--%>
                    </c:forEach>
                </select>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前状态&nbsp;:&nbsp;</td>
            <td><input type="text" name="state" value="${entity.state}">
                <%--<select style="width: 166px">
                    <option value="1">1</option>
                    <option value="1">2</option>
                </select>--%>

            </td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
       <tr>
            <td>&nbsp;&nbsp;携带电脑&nbsp;:&nbsp;</td>
            <td><%--<input type="text" name="computer" value="${entity.computer}">--%>
                <table>
                    <tr>
                        <td style="padding-left:10px "> 是&nbsp;:&nbsp;</td>
                        <td> <input type="radio" name="computer" checked value="0"></td>
                        <td style="padding-left:10px">否&nbsp;:&nbsp;</td>
                        <td><input type="radio" name="computer" value="1"></td>

                    </tr>
                </table>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;关注问题&nbsp;:&nbsp;</td>
            <td colspan="5">
                <textarea name="concern" style="width: 100%">
                    ${entity.concern}
                </textarea>
            </td>

        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;备注&nbsp;:&nbsp;</td>
            <td colspan="5">
                <textarea name="remark" style="width: 100%">
                    ${entity.remark}
                </textarea>
            </td>

        </tr>
      <tr>
          <td colspan="6">&nbsp;</td>
      </tr>
    </table>

    <script>
        $(function () {

            $('.date-picker').daterangepicker({
                singleDatePicker: true,
                format: 'YYYY-MM-DD'
            }, function (start, end, label) {
                /*console.log(start.toISOString(), end.toISOString(), label);*/
            });

            $(".btn_datadictionary").click(function () {

                var form = $(this).closest("form");
                var action = form.attr("action");
                $.post(action,form.serialize(),function (data) {
                    if (data.success) {
                        $("#dialog_content").html("操作成功");
                        $('.dialog_info').modal('toggle');
                        $(".btn_close").click(function () {
                            window.location.reload();
                        });
                    }
                });
            });
        });

    </script>



</font></font></div>
<div class="modal-footer">
    <button type="button" class="btn btn-white" data-dismiss="modal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">关闭</font></font></button>
    <button type="button" class="btn btn-default btn_datadictionary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" id="customerSubmit" data-dismiss="modal">保存更改</font></font></button>
</div>
</form>