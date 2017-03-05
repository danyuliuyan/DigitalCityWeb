<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/1/27
  Time: 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/cropper/dist/cropper.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/edit-password.css" rel="stylesheet">
</head>
<body>

<jsp:include page="include/header.jsp"></jsp:include>

<div class="main-container">

    <%--注册成功提示信息--%>
    <div class="alert alert-success" id="promptInfo">

    </div>


    <div class="left-menu">
        <div class="inner-menu">
            <h3><i class="fa fa-address-card" aria-hidden="true"></i>我的资料</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/userCenter">基本信息</a></li>
                <li><a href="${pageContext.request.contextPath}/editData">编辑资料</a></li>
                <li class="chosen">修改密码</li>
            </ul>
        </div>
    </div>
    <div class="right-content">
        <form action="" class="form-horizontal container"  role="form">
            <fieldset>
                <div class="form-group">
                    <label for="passwordOld" class="col-md-2 control-label">原始密码&nbsp;<span style="color: red;">*</span></label>
                    <div class="col-md-4" data-toggle="tooltip" data-placement="right" title="请输入现在正在使用的密码">
                        <input class="form-control" size="16" id="passwordOld" type="password" value="" name="passwordOld">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passwordNew" class="col-md-2 control-label">新密码&nbsp;<span style="color: red;">*</span></label>
                    <div class="col-md-4" data-toggle="tooltip" data-placement="right" title="新密码可由数字、字母或字符（除空格）组成，6到16个字符">
                        <input class="form-control" size="16" id="passwordNew" type="password" value="" name="passwordNew">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passwordConfirm" class="col-md-2 control-label">确认密码&nbsp;<span style="color: red;">*</span></label>
                    <div class="col-md-4" data-toggle="tooltip" data-placement="right" title="请再次输入新密码">
                        <input class="form-control" size="16" id="passwordConfirm" type="password" value="" name="passwordConfirm">
                    </div>
                </div>
            </fieldset>
            <div class="warning-info">
                <label class="col-md-2"></label>
                <p class="error-msg" style="display: none"></p>
                <p class="success-msg" style="display: none"></p>
            </div>
            <div class="option-btn">
                <label class="col-md-2"></label>
                <button class="btn" id="resetBtn" type="button">重置</button>
                <button class="btn" id="saveBtn" type="button">保存</button>
            </div>
        </form>
    </div>
</div>


<jsp:include page="include/footer.jsp"></jsp:include>

<%--引入js文件--%>
<script>
    var contextPath="${pageContext.request.contextPath}";
    var id = "${user.id}";
</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/edit-password-main"></script>

</body>
</html>