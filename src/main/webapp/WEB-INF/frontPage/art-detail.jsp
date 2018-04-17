
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/art-detail.css">
    <div class="page-welcome">
        <img src="${pageContext.request.contextPath}/${instrument.detailPicture}" alt="">
        <%--<img src="${pageContext.request.contextPath}/frontAsset/images/key-rule.png" alt="">--%>
    </div>

    <div class="each-part instrument-frame">
        <div>
            <h2>乐器界面</h2>
            <h3>Instrument interface</h3>
            <div id="instrumentFrame">
                <iframe src="${instrument.pageSource}" frameborder="0" id="iframeDetail"></iframe>
            </div>
        </div>
    </div>
    <div class="each-part key-rule">
        <div>
            <h2>基本按键规则</h2>
            <h3>The basic rules of the keys</h3>
            <img src="${pageContext.request.contextPath}/frontAsset/images/key-rule.jpg" alt="">
        </div>
    </div>
    <div class="each-part teach-video">
        <div>
            <h2>使用教学动画案例</h2>
            <h3>Teaching animation case</h3>
                <video src="${pageContext.request.contextPath}/frontAsset/video/movie.mp4" width="800" height="400" controls autobuffer></video>
        </div>
    </div>
</div>




<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>

<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/art-detail-main"></script>



</body>
</html>

