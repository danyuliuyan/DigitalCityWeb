<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 16/11/27
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="navbar navbar-inverse navbar-fixed-top">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/header.css" rel="stylesheet">
    <div class="container">
        <div class="navbar-header">
            <!-- responsive nav button -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">导航栏开关</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- /responsive nav button -->

            <!-- logo -->
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
                <h1 id="logo">
                    <img src="${pageContext.request.contextPath}/frontAsset/images/logo.png" alt="数字文化五城" />
                </h1>
            </a>
            <!-- /logo -->
        </div>

        <!-- main nav -->
        <nav class="collapse navbar-collapse navbar-right" role="navigation">
            <ul id="nav" class="nav navbar-nav">
                <li data-tab="1" class="current-tab"><a href="${pageContext.request.contextPath}/index">首页</a></li>
                <li data-tab="2" class="slide-menu"><a href="javascript:void(0)">大学之城</a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/history?type=1">数字校史馆</a> </li>
                    <li><a href="${pageContext.request.contextPath}/library?type=2">数字图书馆</a> </li>
                    <li><a href="${pageContext.request.contextPath}/lab?type=3">数字实验室</a> </li>
                    <li><a href="${pageContext.request.contextPath}/university">数字校园</a> </li>
                </ul>
                </li>
                <li data-tab="3"><a href="${pageContext.request.contextPath}/museum">博物馆之城</a></li>
                <li data-tab="4"><a href="http://www.cjzww.com/" target="_blank">阅读之城</a></li>
                <li data-tab="5" class="slide-menu"><a href="javascript:void(0)">艺术之城</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/art">音乐创作平台</a> </li>
                        <li><a href="${pageContext.request.contextPath}/sceneList#exhibition">数字展览馆</a></li>
                        <li><a href="${pageContext.request.contextPath}/sceneList#gallery">数字艺术馆</a> </li>
                    </ul>
                </li>
                <li data-tab="6" class="slide-menu"><a href="javascript:void(0)">创意之城</a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/digitalscene" target="_self">三维数字场景</a></li>
                        <li><a href="${pageContext.request.contextPath}/digitalart" target="_self">数字美术</a></li>
                    </ul>
                </li>
                <c:if test="${user==null}"><li class="login-option"><a href="${pageContext.request.contextPath}/login">登录/注册</a></li></c:if>
                <c:if test="${user!=null}">
                <li class="user-info">
                    <c:if test="${user.avatarSrc!=null}"><img src="${pageContext.request.contextPath}/${user.avatarSrc}"></c:if>
                    <c:if test="${user.avatarSrc==null}"><img src="${pageContext.request.contextPath}/frontAsset/images/avatar-default.jpg"></c:if>
                    <p title="user.username">${user.username}</p>
                    <ul class="user-list">
                        <li><a href="${pageContext.request.contextPath}/userCenter"><i class="fa fa-user" aria-hidden="true"></i><span>个人中心</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i><span>注销登录</span></a></li>
                    </ul>
                </li>
                </c:if>
            </ul>
        </nav>
        <!-- /main nav -->
    </div>

</header>