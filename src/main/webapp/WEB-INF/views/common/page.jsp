<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/static/plugins/bootstarp/js/jquery.min.js"></script>
<script src="/static/plugins/bootstarp/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/plugins/bootstarp/js/plugins.js"></script>


<div class="panel-body" style="float: right">
    <nav>
        <ul class="pagination">
            <li><span href="#" style="cursor:pointer;" class="btn_page" data-page="1">首页</span></li>
            <li><span href="#" style="cursor:pointer;" class="btn_page" data-page="${result.prevPage}">上一页</span></li>
            <li><span href="#" style="cursor:pointer;" class="btn_page" data-page="${result.nextPage}">下一页</span></li>
            <li><span href="#" style="cursor:pointer;" class="btn_page" data-page="${result.endPage}">末页</span></li>
        </ul>
        <span style=" padding:18px 0px;height: 32px;float: right">

                    &nbsp;&nbsp;&nbsp;&nbsp;每页显示&nbsp;&nbsp;<select name="pageSize" id="pageSize" class="ui_select02"
                                                                    style="margin-top:3px;height: 29.5px;">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                    </select>&nbsp;&nbsp;条
                    <script>
                        $.each($("#pageSize option"), function (index, item) {
                            if (item.value == ${qo.pageSize}) {
                                item.selected = true;
                            }
                        });
                    </script>
                   转到第&nbsp;&nbsp;<input type="text" name="currentPage" id="currentPage"
                                         style="height: 30px;width: 40px" value="${qo.currentPage}"
                                         class="ui_input_txt01"/>&nbsp;&nbsp;页
                    &nbsp;&nbsp;<input type="button" class="ui_input_btn01 btn_page" style="height: 29px"
                                       value="跳转&nbsp;"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;


                       <span class="ui_txt_bold04">
                        当前第${result.currentPage}/${result.endPage}页&nbsp;&nbsp;
                        共有
                    <span class="ui_txt_bold04">${result.rows}</span>
                    条记录</span>
                </span>

    </nav>
</div>

