<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/2/23
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>数字大学之城-${university.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/gallery/css/jquery.ad-gallery.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/custom-scrollbar/css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
</head>

<body>

<jsp:include page="include/header.jsp"></jsp:include>

<%--<div id="canvas" class="gradient" ></div>--%>

<div class="main-container" style="margin-top: 65px">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/university-detail.css">

    <%--<canvas id="c"></canvas>--%>

    <h1 class="title">${university.name}</h1>

    <div class="column-title">基本介绍</div>
    <div class="introduction">
        ${university.introduction}
    </div>
    <div class="column-title">图片集锦</div>
    <div class="photos">
        <div id="gallery" class="ad-gallery">
            <div class="ad-image-wrapper">
            </div>
            <div class="ad-controls">
            </div>
            <div class="ad-nav">
                <div class="ad-thumbs">
                    <ul class="ad-thumb-list">

                        <c:forEach var="listItem" items="${pictureList}">
                            <li>
                                <a href="${pageContext.request.contextPath}/${listItem.source}">
                                    <img data-src="${pageContext.request.contextPath}/${listItem.source}"title="${listItem.name}" alt="${listItem.description}" height="66" class="image0">
                                </a>
                            </li>
                        </c:forEach>
                        <%--
                        <li>
                            <a href="${pageContext.request.contextPath}/frontAsset/images/9.jpg">
                                <img src="${pageContext.request.contextPath}/frontAsset/images/thumbs/t9.jpg" title="A title for 9.jpg" alt="This is a nice, and incredibly descriptive, description of the image 9.jpg" class="image13">
                            </a>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="column-title">三维场景</div>
    <div class="scene">
        <div class="left-menu">
            <h3>场景列表</h3>
            <ul class="scene-list">
                <c:if test="${sceneList.size()==0}">
                    暂无场景
                </c:if>
                <c:forEach var="listItem" items="${sceneList}">
                    <li data-url="${listItem.source}"><i class="fa fa-square" aria-hidden="true"></i><span>${listItem.name}</span></li>
                </c:forEach>

                <%--<li><i class="fa fa-square" aria-hidden="true"></i><span>三峡大学</span></li>--%>
            </ul>
        </div>
        <div class="right-content">
            <button id="fullScreenBtn" title="点击查看全屏效果"><i class="fa fa-expand" aria-hidden="true"></i></button>
            <iframe id="sceneBox" width="800px" height="650px" frameborder="0" src=""></iframe>
        </div>
    </div>
</div>

<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>

<%--<script src="http://api.map.baidu.com/api?v=2.0&ak=BfUtbnZGGKU91gbZcRVYfnelh4ICnIQ3" rel="script"></script>--%>
<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/university-detail-main"></script>
</body>
</html>
