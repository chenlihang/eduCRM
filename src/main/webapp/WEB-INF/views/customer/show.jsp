<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/plugins.jsp"%>
<form action="#" method="post" id="editForm">
    <input type="hidden" name="id" value="${entity.id}">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></span></button>
    <h4 class="modal-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">潜在客户编辑</font></font></h4>
</div>
<div class="modal-body" style="text-align:center"><font style="vertical-align: inherit; text-align: center"><font style="vertical-align: inherit;">

    <table style="margin-left: 50px">
        <tr>
            <td>&nbsp;&nbsp;姓名&nbsp;:&nbsp;</td>
            <td><input readonly type="text" name="name" value="${entity.name}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="age" value="${entity.age}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别&nbsp;:&nbsp;</td>
              <td>
                  <table>
                      <tr>
                          <td style="padding-left:10px "> 男&nbsp;:&nbsp;</td>
                          <td> <input readonly type="radio" name="gender" id="gender0" value="0"></td>
                          <td style="padding-left:10px">女&nbsp;:&nbsp;</td>
                          <td><input readonly type="radio" name="gender" id="gender1" value="1"></td>

                      </tr>
                  </table>
              </td>
          </tr>
          <tr><td colspan="6">&nbsp;</td></tr>
          <tr>
              <td>&nbsp;&nbsp;电话&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="tel" value="${entity.tel}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="QQ" value="${entity.QQ}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;微信&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="weChat" value="${entity.weChat}"></td>
          </tr>
          <tr>
              <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
              <td>&nbsp;&nbsp;邮箱&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="email" value="${entity.email}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学校&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="school" value="${entity.school}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业&nbsp;:&nbsp;</td>
              <td><input readonly type="text" name="major" value="${entity.major}"></td>
          </tr>
          <tr>
              <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
              <td>&nbsp;&nbsp;学历&nbsp;:&nbsp;</td>
              <td>
                  <select name="diplomas.id" id="diplomasId" style="width: 166px">
                      <c:forEach items="${dataItemList}" var="list">
                          <c:if test="${list.sn=='DIPLOMAS'}">
                              <c:forEach items="${list.items}" var="dataItem">
                                      <option value="${dataItem.id}">${dataItem.name}</option>
                              </c:forEach>
                          </c:if>
                      </c:forEach>
                  </select>
              </td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;省份&nbsp;:&nbsp;</td>
              <td>
                  <select name="province.id" id="provinceId" style="width: 166px">
                      <c:forEach items="${dataItemList}" var="list">
                          <c:if test="${list.sn=='PROVINCE'}">
                              <c:forEach items="${list.items}" var="dataItem">
                                      <option value="${dataItem.id}">${dataItem.name}</option>
                              </c:forEach>
                          </c:if>
                      </c:forEach>
                  </select>
              </td>
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;毕业时间&nbsp;:&nbsp;</td>
               <td>
                   <div class="input-group" style="width: 168px">
                       <fmt:formatDate value="${entity.graduateTime}" pattern="yyyy-MM-dd" var="graduateTime"/>
                       <input readonly type="text" class="form-control date-picker" name="graduateTime" value="${graduateTime}">
                       <span class="add-on input-group-addon"><i class="fa fa-calendar"></i></span>
                   </div>
               </td>
           </tr>
        <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
        <tr>
             <td>&nbsp;&nbsp;工作年限&nbsp;:&nbsp;</td>
             <td>
                 <input readonly type="text" name="workSeniority" value="${entity.workSeniority}">
             </td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户来源&nbsp;:&nbsp;</td>
             <td>
                 <select name="source.id" id="sourceId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='SOURCE'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                     <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
             </td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合作高校&nbsp;:&nbsp;</td>
             <td>
                 <select name="collegeClient.id" id="collegeClientId" style="width: 166px">
                     <c:forEach items="${keyaccounts}" var="obj">
                         <option value="${obj.id}">${obj.name}</option>
                     </c:forEach>
                 </select>


             </td>
         </tr>
         <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
         <tr>
             <td>&nbsp;&nbsp;客户类型&nbsp;:&nbsp;</td>
             <td>
                 <select name="clientType.id" id="clientTypeId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='CLIENTTYPE'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                     <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
                 </td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向校区&nbsp;:&nbsp;</td>
             <td>
                 <select name="intentionCampus.id" id="intentionCampusId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='INTENTIONCAMPUS'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                     <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
             </td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向学科&nbsp;:&nbsp;</td>
             <td>
                 <select name="intentionSubject.id" id="intentionSubjectId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='subject'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                     <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
             </td>
         </tr>
         <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
         <tr>
             <td>&nbsp;&nbsp;意向班级&nbsp;:&nbsp;</td>
             <td>
                 <select name="intentionClass.id" id="intentionClassId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='INTENTIONCLASS'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                 <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
             </td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向程度&nbsp;:&nbsp;</td>
             <td>
                 <select name="intentionExtent.id" id="intentionExtentId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='intentionLevel'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                 <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
             </td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前状态&nbsp;:&nbsp;</td>
             <td>
                 <select name="state.id" id="stateId" style="width: 166px">
                     <c:forEach items="${dataItemList}" var="list">
                         <c:if test="${list.sn=='STATE'}">
                             <c:forEach items="${list.items}" var="dataItem">
                                 <option value="${dataItem.id}">${dataItem.name}</option>
                             </c:forEach>
                         </c:if>
                     </c:forEach>
                 </select>
             </td>
         </tr>
         <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
        <tr>
             <td>&nbsp;&nbsp;携带电脑&nbsp;:&nbsp;</td>
             <td>
                 <table>
                     <tr>
                         <td style="padding-left:10px"> 是&nbsp;:&nbsp;</td>
                         <td> <input readonly type="radio" id="computer1" name="computer" value="1"></td>
                         <td style="padding-left:10px">否&nbsp;:&nbsp;</td>
                         <td><input readonly type="radio" id="computer0" name="computer" value="0"></td>

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
                 <textarea readonly name="concern" style="width: 100%">${entity.concern}</textarea>
             </td>

         </tr>
         <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
         <tr>
             <td>&nbsp;&nbsp;备注&nbsp;:&nbsp;</td>
             <td colspan="5">
                 <textarea readonly name="remark" style="width: 100%">${entity.remark}</textarea>

             </td>

         </tr>
       <tr>
           <td colspan="6">&nbsp;</td>
       </tr>

    </table>

    <script>
        $("#provinceId option[value='${entity.province.id}']").prop("selected", true);
        $("#diplomasId option[value='${entity.diplomas.id}']").prop("selected", true);
        $("#sourceId option[value='${entity.source.id}']").prop("selected", true);
        $("#clientTypeId option[value='${entity.clientType.id}']").prop("selected", true);
        $("#intentionCampusId option[value='${entity.intentionCampus.id}']").prop("selected", true);
        $("#intentionSubjectId option[value='${entity.intentionSubject.id}']").prop("selected", true);
        $("#intentionClassId option[value='${entity.intentionClass.id}']").prop("selected", true);
        $("#intentionExtentId option[value='${entity.intentionExtent.id}']").prop("selected", true);
        $("#stateId option[value='${entity.state.id}']").prop("selected", true);
        $("#collegeClientId option[value='${entity.collegeClient.id}']").prop("selected", true);


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
</div>
</form>