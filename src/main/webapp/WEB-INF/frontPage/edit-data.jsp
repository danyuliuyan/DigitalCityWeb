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
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/cropper/dist/cropper.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/edit-data.css" rel="stylesheet">
</head>
<body>

<jsp:include page="include/header.jsp"></jsp:include>

<div class="main-container">

    <div class="left-menu">
        <div class="inner-menu">
            <h3><i class="fa fa-address-card" aria-hidden="true"></i>我的资料</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/userCenter">基本信息</a></li>
                <li class="chosen">编辑资料</li>
                <li><a href="${pageContext.request.contextPath}/editPassword">修改密码</a></li>
            </ul>
        </div>
    </div>
    <div class="right-content">
        <form action="" class="form-horizontal container"  role="form">
            <fieldset>
                <div class="form-group">
                    <label for="email" class="col-md-2 control-label">登录账号&nbsp;<span style="color: red;">*</span></label>
                    <div class="col-md-4" data-toggle="tooltip" data-placement="right" title="请输入常用有效邮箱，作为登录账户名使用">
                        <input class="form-control" size="16" id="email" type="email" value="${user.email}" name="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username" class="col-md-2 control-label">昵称&nbsp;<span style="color: red;">*</span></label>
                    <div class="col-md-4" data-toggle="tooltip" data-placement="right" title="用户名可由汉字、字母、数字或下划线组成，2到16个字符">
                        <input class="form-control" size="16" id="username" type="text" value="${user.username}" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone" class="col-md-2 control-label">手机</label>
                    <div class="col-md-4">
                        <input class="form-control" size="16" id="phone" type="text" value="${user.phone}" name="phone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="qq" class="col-md-2 control-label">Q&nbsp;Q</label>
                    <div class="col-md-4">
                        <input class="form-control" size="16" id="qq" type="text" value="${user.qq}" name="qq">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username" class="col-md-2 control-label">性别</label>
                    <div class="col-md-5">
                        <div class="radio">
                            <label style="margin-right: 20px">
                                <c:if test="${user.sex==0}"><input id="man" type="radio" name="sex" value="0" checked></c:if>
                                <c:if test="${user.sex!=0}"><input id="man" type="radio" name="sex" value="0"></c:if>男
                            </label>
                            <label>
                                <c:if test="${user.sex==1}"><input id="woman" type="radio" name="sex" value="1" checked></c:if>
                                <c:if test="${user.sex!=1}"><input id="woman" type="radio" name="sex" value="1"></c:if>女
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-md-2 control-label">生日</label>
                    <div class="input-group date birthday col-md-4" data-date="" data-date-format="yyyy-mm-dd" data-link-field="birthday" data-link-format="yyyy-mm-dd">
                        <input class="form-control" id="birthdayRead" size="16" type="text" value="${user.birthday}" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="hidden" id="birthday" name="birthday" value="${user.birthday}">
                </div>
                <div class="form-group">
                    <label for="address" class="col-md-2 control-label">所在地区</label>
                    <div id="address" class="col-md-6">
                            <div class="col-md-4">
                                <select class="ui-btn form-control" data-role="none" name="province" id="province"> </select>
                            </div>
                            <div class="col-md-4">
                                <select class="ui-btn form-control" data-role="none" name="city" id="city"> </select>
                            </div>
                            <div class="col-md-4">
                                <select class="ui-btn form-control" data-role="none" name="area" id="area"> </select>
                            </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="selfDesc" class="col-md-2 control-label">个性签名</label>
                    <div class="col-md-6">
                        <textarea class="form-control" rows="3" id="selfDesc" placeholder="写点什么吧……"><c:if test="${user.selfDesc!=null}">${user.selfDesc}</c:if></textarea>
                    </div>
                </div>
                <div id="checkNum">
                    <label class="col-md-2"></label>
                    <div class="col-md-6 col-md-offset-4">还能输入<span style="color: red">300</span>字</div>
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
    var oldEmail = "${user.email}";
    var oldName = "${user.username}";
    var oldPhone = "${user.phone}";
    var oldQq = "${user.qq}";
    var oldSex = "${user.sex}";
    var oldBirthday = "${user.birthday}";
    var oldProvince="${user.province}";
    var oldCity="${user.city}";
    var oldArea="${user.area}";
    var oldSelfDesc = "${user.selfDesc}";
    var id = "${user.id}";
</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/edit-data-main"></script>

</body>
</html>