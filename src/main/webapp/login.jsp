<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wolfcode</title>

    <!-- ========== Css Files ========== -->
    <link href="/css/root.css" rel="stylesheet">
    <style type="text/css">
        body {
            background: #F5F5F5;
        }
    </style>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <%--<script src="/js/jquery-form/ajaxForm.js"></script>--%>
    <script>
        $(function () {
            $("#login_sub").click(function () {

                $.post('/login.do', $("form").serialize(), function (data) {
                    if (data.success) {
                        window.location.href = "/main.do";
                    } else {
                        $("span").html(data.msg)
                    }
                },'json');

               /* $("#submitForm").ajaxSubmit(function (data) {
                    if (data.success) {
                        window.location.href = "/main.do";
                    } else {
                        $("#login_err").html(data.msg);
                    }
                },'json');*/
            });
        });
    </script>
</head>
<body>
<div class="login-form">
    <form id="submitForm" action="/login.do" method="post">
        <div class="top">
            <img src="/img/wolf2.png" alt="icon" class="icon">
            <h1>Wolf</h1>
            <h4>Welcome to wolfcode</h4>
        </div>
        <div class="form-area">
            <span id="login_err"></span>
            <div class="group">
                <input name="username" type="text" class="form-control" placeholder="账户名">
                <i class="fa fa-user"></i>
            </div>
            <div class="group">
                <input name="password" type="password" class="form-control" placeholder="密码">
                <i class="fa fa-key"></i>
            </div>
            <div class="checkbox checkbox-primary">
                <input id="checkbox101" type="checkbox" checked>
                <label for="checkbox101">记住我</label>
            </div>
            <button id="login_sub" type="button" class="btn btn-default btn-block">登录</button>
        </div>
    </form>
    <div class="footer-links row">
        <div class="col-xs-6"><a href="#"><i class="fa fa-external-link"></i>新用户注册</a></div>
        <div class="col-xs-6 text-right"><a href="#"><i class="fa fa-lock"></i>忘记密码</a></div>
    </div>
</div>
</body>
</html>