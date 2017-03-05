<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/2/28
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>数字艺术之城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>

<jsp:include page="include/header.jsp"></jsp:include>

<%--<div id="canvas" class="gradient" ></div>--%>

<div class="main-container">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/art.css">
    <div class="page-welcome">
        <p>欢迎使用虚拟乐器平台</p>
    </div>
    <div class="introduction">
        <div>
            <div class="intro-content">
                <h2>平台介绍</h2>
                <p>
                    虚拟乐器平台介绍...虚拟乐器平台介绍...虚拟乐器平台介绍...虚拟乐器平台介绍...虚拟乐器平台介绍...虚拟乐器平台介绍...虚拟乐器平台介绍...
                </p>
            </div>
            <div class="intro-picture">
                <div class="pic-row">
                    <div class="art-pi01"><img src="${pageContext.request.contextPath}/frontAsset/images/art-intro-pic01.png" alt=""></div>
                    <div class="art-pi02"><img src="${pageContext.request.contextPath}/frontAsset/images/art-intro-pic02.png" alt=""></div>
                </div>
                <div class="pic-row">
                    <div class="art-pi03"><img src="${pageContext.request.contextPath}/frontAsset/images/art-intro-pic03.png" alt=""></div>
                    <div class="art-pi04"><img src="${pageContext.request.contextPath}/frontAsset/images/art-intro-pic04.png" alt=""></div>
                </div>
            </div>
        </div>
    </div>
    <div class="instrument">
        <div>
            <h2>乐器列表</h2>

            <ul id="instrumentList" class="instrument-list">

                <c:forEach var="listItem" items="${instrumentList}">
                    <li>
                        <a href="${pageContext.request.contextPath}/artDetail?id=${listItem.id}">
                            <img src="${pageContext.request.contextPath}/${listItem.thumb}" alt="" />
                            <div>
                                <h5>${listItem.name}</h5>
                                <span>点击进入${listItem.name}详情页面</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <%--
                <li>
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/frontAsset/images/dahao.png" alt="" />
                        <div>
                            <h5>Music</h5>
                            <span>non suscipit leo fringilla non suscipit leo fringilla molestie</span>
                        </div>
                    </a>
                </li>--%>
            </ul>
        </div>
    </div>
</div>



<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>

<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/art-main"></script>

</body>
</html>
