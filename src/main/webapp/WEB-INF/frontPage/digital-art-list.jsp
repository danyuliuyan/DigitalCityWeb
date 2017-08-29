<%--
  Created by IntelliJ IDEA.
  User: liuyan
  Date: 2017/8/29
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/7/19
  Time: 12:33
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

<style>
  *{
    font-family: 'Microsoft YaHei', 'Arial', sans-serif;
  }
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
    position: static!important;
    background-color: #222 !important;
  }
  body{
    background: #111111;
  }
  .main-container{
    padding-top: 60px;
    padding-bottom: 100px;
  }
  .main-container section{
    width: 1200px;
    margin: 0 auto;
    color: #eee;
  }
  .main-container section h1{
    color: #29C4CA;
  }

  .scene-lists{
    margin: 40px auto;
    display: flex;
    display: -webkit-flex;
    /*justify-content: space-between;*/
    align-content: flex-start;
    list-style-type: none;
    padding: 0;
    width: 80%;
  }
  .scene-list{
    min-width: 80%;
    list-style-type: none;
    margin: 20px auto;
    padding: 0;
    border: 1px solid #ccc;
  }
  .scene-list .title{
    background: rgba(41,196,202,0.5);
    font-size: 16px;
    /*color: #fab707;*/
    height: 60px;
    line-height: 60px;
    border-bottom: 1px solid #ccc;
  }
  .scene-list li{
    width: 100%;
    height: auto;
    padding: 0 20px;
    font-size: 14px;
    text-align: center;
    cursor: pointer;

  }
  .scene-list li:nth-of-type(2n){
    background: #222;
  }
  .scene-list li a{
    color: #ccc;
  }
  .scene-list li a:hover{
    color: #fab707;
  }

</style>
<div class="main-container">

    <section>
      <h1 style="display: block">数字美术</h1>
      <div class="scene-lists">
        <ul class="scene-list" id="organizationList">
          <c:forEach items="${organizationList}" var="organization">
           <li class="title" data-organizationid="${organization.id}">${organization.name}</li>
          </c:forEach>

        </ul>
      </div>
    </section>
  </div>


<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>
<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/art-main"></script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/jquery-2.2.4.min.js"></script>
<script>
  $("#organizationList li").click(function(){
    var organizationId=$(this).attr("data-organizationid");
    alert(organizationId);
  })
</script>
</body>
</html>

