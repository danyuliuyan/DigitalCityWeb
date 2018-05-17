<%--
  Created by IntelliJ IDEA.
  User: liuyan
  Date: 2018/5/17
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>数字场景</title>
    <style>
        .main{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        .vr{
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-image: url("${digitalScence.url}");
        }
        .message{
            color: black;
            text-align: center;
            padding-top: 200px;
            font-size: 20px;
        }
    </style>
</head>

<body class="main" >
<c:if test="${message == 0}">
    <div class="vr"  play2vr="${digitalScence.play2vr}"></div>
</c:if>
<c:if test="${message == -1}">
    <div class="message">
        数据加载失败，请稍后重新加载！！！
    </div>
</c:if>">
<script src="//v2.play2vr.com/js/play2VR.js"></script>
</body>
</html>
