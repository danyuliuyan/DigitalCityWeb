<%--
  Created by IntelliJ IDEA.
  User: liuyan
  Date: 2017/8/30
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
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
  <title>数字大学之城</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/frontAsset/assets/custom-scrollbar/css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
</head>


<body>

<jsp:include page="include/header.jsp"></jsp:include>


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

<div class="main-container" style="margin-top: 65px">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontAsset/assets/css/innovate.css">
  <!--左侧大学菜单-->
  <canvas id="bg_show"></canvas>

  <div class="left-menu">
    <h3><i class="fa fa-book" aria-hidden="true"></i>资源列表</h3>
    <ul class="resources-list" id="resources-list">
      <c:if test="${sceneList.size()==0}">暂无数据</c:if>
      <c:forEach var="listItem" items="${sceneList}">
        <li  data-url="${listItem.source}" title="${listItem.name}；点击查看详情"><a href="javascript:;">${listItem.name}</a></li>
      </c:forEach>
    </ul>
  <%--  <ul class="resources-list" id="pictureList">
        <c:forEach var="pisture" items="${pictureList}">
          <li data-url="${picture.source}" title="${pisture.name};点击查看详情"><a href="javascript:void(0)">${picture.name}</a> </li>
        </c:forEach>
    </ul>--%>
  </div>

  <div class="resource-content">
    <iframe src="" frameborder="0" id="iframeDetail" height="auto" width="100%"></iframe>
  </div>

</div>

<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>
<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/innovate-main"></script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/jquery-2.2.4.min.js"></script>
<script>
  $("#resources-list li").click(function(){
    let src=$(this).attr("data-url");
    $("#iframeDetail").attr("src",src);
  })
</script>
</body>
</html>
