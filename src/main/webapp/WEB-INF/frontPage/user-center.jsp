<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/1/23
  Time: 0:20
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
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/user-center.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="include/header.jsp"></jsp:include>

    <div class="main-container">

        <%--注册成功提示信息--%>
        <div class="alert alert-danger" id="promptInfo">

        </div>


        <div class="left-menu">
            <div class="inner-menu">
                <h3><i class="fa fa-address-card" aria-hidden="true"></i>我的资料</h3>
                <ul>
                    <li class="chosen">基本信息</li>
                    <li><a href="${pageContext.request.contextPath}/editData">编辑资料</a></li>
                    <li><a href="${pageContext.request.contextPath}/editPassword">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="right-content">
            <%--基本信息部分--%>
            <div class="basic-info">
                <div>
                    <div class="info-part-1">
                        <h3>${user.username}</h3>
                        <div class="info-detail">
                            <div>所在地：</div>
                            <c:if test="${user.province==null||user.province.equals('')}">未填写</c:if>
                            <c:if test="${user.province!=null&&!user.province.equals('')}">${user.province}&nbsp;-&nbsp;${user.city}<c:if test="${user.area!=null&&!user.area.equals('')}">&nbsp;-&nbsp;${user.area}</c:if></c:if>
                        </div>
                        <div class="info-detail">
                            <div>Q&nbsp;Q：</div>
                            <c:if test="${user.qq==null||user.qq.equals('')}">未填写</c:if>
                            <c:if test="${user.qq!=null&&!user.qq.equals('')}">${user.qq}</c:if>
                        </div>
                        <div class="info-detail">
                            <div>生日：</div>
                            <c:if test="${user.birthday==null||user.birthday.equals('')}">未填写</c:if>
                            <c:if test="${user.birthday!=null&&!user.birthday.equals('')}">${user.birthday}</c:if>
                        </div>
                    </div>
                    <div class="user-avatar">
                        <c:if test="${user.sex==null}"><div class="user-sex unknown" title="性别未填写"><i class="fa fa-question" aria-hidden="true"></i></div></c:if>
                        <c:if test="${user.sex==0}"><div class="user-sex male" title="性别男"><i class="fa fa-mars" aria-hidden="true"></i></div></c:if>
                        <c:if test="${user.sex==1}"><div class="user-sex female" title="性别女"><i class="fa fa-venus" aria-hidden="true"></i></div></c:if>
                        <c:if test="${user.avatarSrc==null}"><img src="${pageContext.request.contextPath}/frontAsset/images/avatar-default.jpg" title="默认头像，点击右上角编辑按钮更换"></c:if>
                        <c:if test="${user.avatarSrc!=null}"><img src="${pageContext.request.contextPath}/${user.avatarSrc}"></c:if>
                        <div class="edit-avatar"><i class="fa fa-pencil-square-o" aria-hidden="true" title="编辑头像" data-toggle="modal" data-target="#editAvatar"></i></div>
                    </div>
                </div>
                <div class="info-part-1">
                    <div class="info-detail">
                        <div>邮箱：</div>${user.email}
                    </div>
                    <div class="info-detail">
                        <div>手机：</div>
                        <c:if test="${user.phone==null||user.phone.equals('')}">未填写</c:if>
                        <c:if test="${user.phone!=null&&!user.phone.equals('')}">${user.phone}</c:if>
                    </div>
                    <div class="self-desc">
                        <span>个性签名</span><i class="fa fa-pencil-square-o" aria-hidden="true" title="编辑个性签名" id="editSelfdescBtn"></i>
                        <p id="showArea">
                            <c:if test="${user.selfDesc==null||user.selfDesc.equals('')}"><span style="color: #666;font-weight: bold;margin-right: 10px">${user.username}</span>很懒，什么都没有写……</c:if>
                            <c:if test="${user.selfDesc!=null&&!user.selfDesc.equals('')}">${user.selfDesc}</c:if>
                        </p>
                        <div id="editArea">
                            <input type="hidden" name="userid" value="${user.id}">
                            <textarea id="selfDesc" name="selfDesc">${user.selfDesc}</textarea>
                            <div>还能输入<span style="color: red">300</span>字<button class="btn" id="editSelfdescCancel">取消</button><button class="btn" id="editSelfdescSave">保存</button></div>
                        </div>
                    </div>
                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="editAvatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        更换头像
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="img-cropper">
                                        <div class="img-container">
                                            <c:if test="${user.avatarSrc==null}"><img id="image" src="${pageContext.request.contextPath}/frontAsset/images/avatar-default.jpg" alt="default-img"></c:if>
                                            <c:if test="${user.avatarSrc!=null}"><img id="image" src="${pageContext.request.contextPath}/${user.avatarSrc}"></c:if>
                                        </div>
                                        <div class="preview-container">
                                            <div class="img-preview"></div>
                                            <p>200px*200px</p>
                                            <label class="btn btn-primary btn-block" for="importImg" title="Upload image file">
                                                <input type="file" class="sr-only" id="importImg" name="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/ico">
                                                选择图片
                                            </label>
                                            <%--<button id="chooseImg" class="btn btn-primary btn-block">选择图片</button>--%>
                                            <%--<button id="uploadBtn" class="btn btn-success btn-block">确认添加</button>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeBtn">关闭
                                    </button>
                                    <button type="button" class="btn btn-success" id="uploadBtn">
                                        提交更改
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="include/footer.jsp"></jsp:include>

    <%--引入js文件--%>
    <script>var contextPath="${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/user-center-main"></script>

</body>
</html>
