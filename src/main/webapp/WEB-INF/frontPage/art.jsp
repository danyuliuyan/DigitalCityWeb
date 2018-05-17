<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/jquery-2.2.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>

<jsp:include page="include/header.jsp"></jsp:include>

<%--<div id="canvas" class="gradient" ></div>--%>

<div class="main-container">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/art.css">
    <div class="page-welcome">
        <p>欢迎使用网络原创音乐平台</p>
    </div>
    <div class="introduction">
        <div>
            <div class="intro-content">
                <h2>平台介绍</h2>
                <p>
                    舒曼曾经说过“音乐是灵魂的完美表现”,确实音乐可以使人轻松、愉悦、但由于传统的乐器不便于携带，所以使得音乐创作这一愉悦的体验在越来越快节奏的生活中变得更为难得。 虚拟乐器平台是一个将网页制作技术和传统音乐演奏结合起来的一个在线音乐创作平台，本平台提供了各类钢琴、提亲、风琴、以及架子鼓等打击乐器共50余种，让您能够随时随地通过网络进入我们的网站进行音乐创作！
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
            <h2><span class="selected" data-ul-target="instrumentList">乐器列表</span><span data-ul-target="musicList">音乐试听</span></h2>

            <ul id="instrumentList" class="instrument-list">

                <c:forEach var="listItem" items="${instrumentList}">
                    <li class="preLoad" data-url="${listItem.name}">
                        <a href="${pageContext.request.contextPath}/artDetail?id=${listItem.id}" >
                            <img src="${pageContext.request.contextPath}/${listItem.thumb}" alt="" />
                            <div>
                                <h5>${listItem.name}</h5>
                                <span>点击进入${listItem.name}详情页面</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>

            <ul id="musicList" class="music-list">
                <c:forEach var="listItem" items="${musicList}">
                    <li>
                        <label><i class="fa fa-music" aria-hidden="true"></i></label>
                        <span>${listItem.name} --- ${listItem.singer}</span>
                        <div class="options">
                            <span><i class="fa fa-play" aria-hidden="true" title="点击播放"></i></span>
                            <span><i class="fa fa-pause" aria-hidden="true" title="点击暂停"></i></span>
                            <span><i class="fa fa-stop" aria-hidden="true" title="点击停止"></i></span>
                            <%--<span><i class="fa fa-heart" aria-hidden="true" title="点击收藏/取消收藏"></i></span>--%>
                        </div>
                        <audio src="${pageContext.request.contextPath}/${listItem.source}" hidden></audio>
                    </li>
                </c:forEach>
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
