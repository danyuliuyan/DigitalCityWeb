<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>数字大学之城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/custom-scrollbar/css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
</head>

<body>

    <jsp:include page="include/header.jsp"></jsp:include>

    <%--<div id="canvas" class="gradient" ></div>--%>

    <div class="main-container" style="margin-top: 65px">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/university.css">
        <!--左侧大学菜单-->

        <i class="fa fa-angle-double-left" aria-hidden="true" id="hideArrow" title="点击隐藏高校列表"></i>
        <i class="fa fa-angle-double-right" aria-hidden="true" id="showArrow" title="点击显示高校列表"></i>

        <div class="left-menu">
            <h3><i class="fa fa-graduation-cap" aria-hidden="true"></i>高校列表</h3>
            <ul class="university-list">
                <c:if test="${universityList.size()==0}">暂无数据</c:if>
                <c:forEach var="listItem" items="${universityList}">
                    <li data-lng="${listItem.longitude}" data-lat="${listItem.latitude}" data-id="${listItem.id}" data-type="1" title="点击地图可查看详细信息"><a href="javascript:;">${listItem.name}</a></li>
                </c:forEach>
            </ul>
        </div>
        <%--右侧地图信息--%>
        <div class="map-content">
            <div id="allmap">
            </div>
        </div>
    </div>

    <!--尾部-->
    <jsp:include page="include/footer.jsp"></jsp:include>

    <%--<script src="http://api.map.baidu.com/api?v=2.0&ak=BfUtbnZGGKU91gbZcRVYfnelh4ICnIQ3" rel="script"></script>--%>
    <script>var contextPath="${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/university-main"></script>
</body>
</html>
