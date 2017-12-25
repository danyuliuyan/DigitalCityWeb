<%--
  Created by IntelliJ IDEA.
  User: liuyan
  Date: 2017/8/28
  Time: 16:28
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
    margin: 40px 0;
    display: flex;
    display: -webkit-flex;
    /*justify-content: space-between;*/
    align-content: flex-start;
    list-style-type: none;
    padding: 0;
  }
  .scene-list{
    min-width: 80%;
    list-style-type: none;
    margin: 0 auto;
    padding: 0;
    border: 1px solid #ccc;
  }
  .scene-list .title{
    background: rgba(41,196,202,0.5);
    font-size: 16px;
    /*color: #fab707;*/
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid #ccc;
  }
  .scene-list li{
    width: 100%;
    height: 40px;
    line-height: 40px;
    padding: 0 10px;
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
  #exhibition{
    border-top: solid;
    border-top-width: 50px;
    border-top-color: #111;
  }
</style>
<div class="main-container">
 <div id="exhibition">
  <section>
    <h1 style="display: block">数字展览馆</h1>
    <div class="scene-lists">
      <ul class="scene-list">
        <li class="title">三维数字艺术展</li>
        <li><a href="http://www.ourinnovate.com:82/jhu/biyezuopin/index.html" target="_blank">江汉大学毕业设计展</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/canlianliuchunbing/index.html" target="_blank">武汉市残疾人艺术馆刘春冰艺术展</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/canlianshenwei/index.html" target="_blank">武汉市残疾人艺术馆沈伟艺术展</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/wenliansishihuayu/index.html" target="_blank">武汉市文联—“四时花雨”（第二回）沈伟水墨花鸟作品展</a></li>
        <li><a href="http://720yun.com/t/f0523u8kjlv" target="_blank">武汉市文联—“墨道君行晚”曾雪萍 陈复荣 陈东旭书画展</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/wenlianyuanjiewuhan/index.html" target="_blank">武汉市文联—缘结 武汉 韩威生 高鸣书画作品展</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/daqishijie/index.html" target="_blank">湖北省美术馆—“大漆世界：时序”2016湖北国际漆艺三年展</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/shengshibainian/index.html" target="_blank">湖北省艺术馆—“百年纵横”20世纪湖北省美术文献展</a></li>
      </ul>
    </div>
   </section>
 </div>
  <div>
  <section id="gallery">
    <h1 >数字艺术馆</h1>
    <div class="scene-lists">
      <ul class="scene-list">
        <li class="title">三维数字艺术馆</li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/daqishijie/index.html" target="_blank">湖北省美术馆(无数据)</a></li>
        <li><a href="http://www.ourinnovate.com:82/scenelists/shengshibainian/index.html" target="_blank">武汉市残疾人艺术馆(无数据)</a></li>
        <li><a href="http://www.ourinnovate.com:82/whut/artMuseum/index.html" target="_blank">武汉理工大学艺术馆</a></li>
      </ul>
    </div>
  </section>
  </div>
</div>

<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>
<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/art-main"></script>

</body>
</html>
