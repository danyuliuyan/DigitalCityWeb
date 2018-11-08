<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/1/20
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
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
                    <%--<img src="${pageContext.request.contextPath}/frontAsset/images/logo.png" alt="数字文化五城" />--%>
                    <p style="color: white;">虚拟乐器平台</p>
                </h1>
            </a>
            <!-- /logo -->
        </div>

    </div>
</header>

<%--登录表单部分--%>
<div class="login-container">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/login.css">
    <div>
        <img src="${pageContext.request.contextPath}/frontAsset/images/dancer01.png" id="loginImg">
        <div class="login-form">
            <div class="title">登录</div>
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-triangle" aria-hidden="true"></i><strong id="warningInfo"></strong>
            </div>
            <form class="bs-example bs-example-form" role="form" method="post" action="#">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    <input type="text" id="username" name="username" class="form-control" placeholder="账号（邮箱）">
                    <i class="fa fa-times-circle" aria-hidden="true"></i>
                </div>

                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                    <input type="password" id="password" name="password" class="form-control" placeholder="密码">
                    <i class="fa fa-times-circle" aria-hidden="true"></i>
                </div>
                <div class="option">
                    <a data-target="#forgetPwdModal" id="forgetPwd" data-toggle="modal">忘记密码</a>

                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="forgetPwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">忘记密码？</h4>
                                </div>
                                <div class="modal-body">请联系管理员申请重新设置密码!</div>
                                <div class="admin-contact">
                                    <div class="contact-title"><hr><span>联系方式</span><hr></div>
                                    <button class="btn admin-email" type="button"><i class="fa fa-envelope" aria-hidden="true"></i>adminEmail@123.com</button><p>或</p>
                                    <button class="btn admin-phone" type="button"><i class="fa fa-phone" aria-hidden="true"></i>+86&nbsp;12345678912</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>


                    <a href="${pageContext.request.contextPath}/register">免费注册</a>
                </div>
                <button type="submit" class="btn btn-block" id="loginBtn">确&nbsp;&nbsp;&nbsp;&nbsp;认</button>
            </form>

        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp"></jsp:include>

<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/login-main"></script>

</body>
</html>
