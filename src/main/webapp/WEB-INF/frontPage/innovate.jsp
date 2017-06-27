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
    <title>数字创意之城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/custom-scrollbar/css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
</head>


<body>

<jsp:include page="include/header.jsp"></jsp:include>

<%--<div id="canvas" class="gradient" ></div>--%>
<style>
    .navbar-inverse{
        background-color: #222;
    }
    .user-list li{
        background-color: #222;
        border-bottom: 1px solid rgba(255,255,255,0.08);
        text-align: center;
        height: 40px;
        font-size: 14px;
        line-height: 30px;
    }
    footer{
        background-color: #222 !important;
    }
</style>
<%--<div class="main-container" style="margin-top: 65px">--%>
    <%--<div style="width: 1200px;margin: 0 auto;height: 500px;padding: 50px;font-size: 24px">--%>
        <%--数字创意之城，内容维护中……--%>
    <%--</div>--%>
<%--</div>--%>

<div class="main-container" style="margin-top: 65px">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/innovate.css">
    <!--左侧大学菜单-->
    <canvas id="bg_show"></canvas>
    <%--<i class="fa fa-angle-double-left" aria-hidden="true" id="hideArrow" title="点击隐藏高校列表"></i>--%>
    <%--<i class="fa fa-angle-double-right" aria-hidden="true" id="showArrow" title="点击显示高校列表"></i>--%>

    <div class="left-menu">
        <h3><i class="fa fa-book" aria-hidden="true"></i>资源列表</h3>
        <ul class="resources-list">
            <c:if test="${articleList.size()==0}">暂无数据</c:if>
            <c:forEach var="listItem" items="${articleList}">
                <li data-organization-id="${listItem.organizationId}" data-url="${listItem.link}" title="${listItem.name}；点击查看详情"><a href="javascript:;">${listItem.name}</a></li>
            </c:forEach>
        </ul>
    </div>

    <div class="resource-content">
        <%--<div id="viewer"></div>--%>
        <iframe src="" frameborder="0" id="iframeDetail" height="auto" width="100%"></iframe>
    </div>
    <div>
        <div class="intro">
            <h3 data-toggle="tooltip" data-placement="bottom" title=""><a href="" target="_blank"></a></h3>
        </div>
    </div>
</div>

<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>

<%--<script src="http://api.map.baidu.com/api?v=2.0&ak=BfUtbnZGGKU91gbZcRVYfnelh4ICnIQ3" rel="script"></script>--%>
<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/innovate-main"></script>

</body>
</html>
