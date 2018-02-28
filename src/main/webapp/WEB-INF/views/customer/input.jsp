<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="/customer/saveOrUpdate.do" method="post" id="editForm">
    <table style="margin-left: 50px">
        <tr>
            <td>&nbsp;&nbsp;姓名&nbsp;:&nbsp;</td>
            <td><input type="text" name="name" value="${entity.name}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄&nbsp;:&nbsp;</td>
              <td><input type="text" name="age" value="${entity.age}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别&nbsp;:&nbsp;</td>
              <td><input type="text" name="gender" value="${entity.gender}"></td>
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
              <td><input type="text" name="diplomas" value="${entity.diplomas}"></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;省份&nbsp;:&nbsp;</td>
              <td><input type="text" name="province" value="${entity.province}"></td>
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;毕业时间&nbsp;:&nbsp;</td>
               <td><input type="text" name="graduateTime" value="${entity.graduateTime}"></td>
           </tr>
        <tr>
             <td colspan="6">&nbsp;</td>
         </tr>
        <tr>
            <td>&nbsp;&nbsp;工作年限&nbsp;:&nbsp;</td>
            <td><input type="text" name="workSeniority" value="${entity.workSeniority}"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户来源&nbsp;:&nbsp;</td>
            <td><input type="text" name="source" value="${entity.source}"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合作高校&nbsp;:&nbsp;</td>
            <td><input type="text" name="collegeClient" value="${entity.collegeClient}"></td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;客户类型&nbsp;:&nbsp;</td>
            <td><input type="text" name="clientType" value="${entity.clientType}"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向校区&nbsp;:&nbsp;</td>
            <td><input type="text" name="intentionCampus" value="${entity.intentionCampus}"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向学科&nbsp;:&nbsp;</td>
            <td><input type="text" name="intentionSubject" value="${entity.intentionSubject}"></td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;意向班级&nbsp;:&nbsp;</td>
            <td><input type="text" name="intentionClass" value="${entity.intentionClass}"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意向程度&nbsp;:&nbsp;</td>
            <td><input type="text" name="intentionExtent" value="${entity.intentionExtent}"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前状态&nbsp;:&nbsp;</td>
            <td><input type="text" name="state" value="${entity.state}"></td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
       <tr>
            <td>&nbsp;&nbsp;携带电脑&nbsp;:&nbsp;</td>
            <td><input type="text" name="computer" value="${entity.computer}"></td>
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
</form>


