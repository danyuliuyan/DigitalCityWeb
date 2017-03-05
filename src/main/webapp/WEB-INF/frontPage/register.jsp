<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/1/23
  Time: 0:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<header class="navbar navbar-inverse navbar-fixed-top">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/header.css" rel="stylesheet">
    <div class="container">
        <div class="navbar-header">

            <!-- logo -->
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
                <h1 id="logo">
                    <img src="${pageContext.request.contextPath}/frontAsset/images/logo.png" alt="数字文化五城" />
                </h1>
            </a>
            <!-- /logo -->
        </div>

    </div>
</header>


<%--登录表单部分--%>
<div class="register-container">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/register.css">

    <%--注册成功提示信息--%>
    <div class="alert alert-success" id="successInfo">
        <i class="fa fa-check-circle" aria-hidden="true"></i><strong>注册成功，正在跳转到登录页面！</strong>
    </div>

    <div>
        <img src="${pageContext.request.contextPath}/frontAsset/images/dancer02.png" id="registerImg">
        <div class="register-form">
            <div class="title">注册</div>
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-triangle" aria-hidden="true"></i><strong id="warningInfo"></strong>
            </div>
            <form class="bs-example bs-example-form" role="form" method="post" action="#">
                <div data-toggle="tooltip" data-placement="left" title="用户名可由汉字、字母、数字或下划线组成，2到16个字符">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                        <input type="text" id="username" name="username" class="form-control" placeholder="用户名">
                        <i class="fa fa-times-circle" aria-hidden="true"></i>
                    </div>
                </div>
                    <div data-toggle="tooltip" data-placement="left" title="请输入常用有效邮箱，作为登录账户名使用">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                        <input type="email" id="email" name="email" class="form-control" placeholder="邮箱">
                        <i class="fa fa-times-circle" aria-hidden="true"></i>
                    </div>
                </div>
                <div data-toggle="tooltip" data-placement="left" title="密码可由数字、字母或字符（除空格）组成，6到16个字符">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                        <input type="password" id="password" name="password" class="form-control" placeholder="密码">
                        <i class="fa fa-times-circle" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                    <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" placeholder="确认密码">
                    <i class="fa fa-times-circle" aria-hidden="true"></i>
                </div>
                <div class="option">
                    <%--<a data-target="#forgetPwdModal" id="forgetPwd" data-toggle="modal">忘记密码</a>--%>
                    <a href="${pageContext.request.contextPath}/login">返回登录</a>
                </div>
                <button type="submit" class="btn btn-block" id="registerBtn">确&nbsp;&nbsp;&nbsp;&nbsp;认</button>
            </form>

        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp"></jsp:include>

<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/register-main"></script>

</body>
</html>
