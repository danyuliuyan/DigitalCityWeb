<%--
  Created by IntelliJ IDEA.
  User: liuyan
  Date: 2017/8/29
  Time: 17:06
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
  }
  .scene-list{
    min-width: 230px;
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

</style>
<div class="main-container">
    <section>
      <h1 id="originality">三维数字场景</h1>
      <div class="scene-lists">
        <ul class="scene-list">
          <li class="title">数字剧场</li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shuzijuchang/index.html" target="_blank">虹桥艺术中心</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shuzijuchang/index.html" target="_blank">人民大舞台</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shuzijuchang/index.html" target="_blank">上海音乐厅</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shuzijuchang/index.html" target="_blank">美琪大剧院</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shuzijuchang/index.html" target="_blank">百乐门</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shuzijuchang/index.html" target="_blank">湖北省京剧院</a></li>
        </ul>
      <%--  <ul class="scene-list">
          <li class="title">数字全景新闻(无数据)</li>
          <li><a href="javascript:void(0)" target="_blank">2015年CEDC中日韩三国大学生科技创新竞赛</a></li>
          <li><a href="javascript:void(0)" target="_blank">2015年大学生创新创业训练计划及大学生节能减排竞赛作品成果展示&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学南湖新图书馆开馆</a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学艺术馆的开馆仪式</a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学西院樱花灿烂</a></li>
        </ul>--%>
        <ul class="scene-list">
          <li class="title">数字企业</li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/shanghaihuyue/index.html" target="_blank">上海虎跃舞台设备科技有限公司</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/guangdongshengshifeiyang/index.html" target="_blank">广东盛世飞扬光电科技有限公司</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/wuhanlingyun/index.html" target="_blank">武汉凌云科技集团</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/honglianwutaiwang/index.html" target="_blank">红脸舞台网</a></li>
        </ul>
        <ul class="scene-list">
          <li class="title">三维场景(无数据)</li>
          <li><a href="javascript:void(0)" target="_blank">水面船、半潜船、全潜船巡游场景</a></li>
          <li><a href="javascript:void(0)" target="_blank">根雕</a></li>
          <li><a href="javascript:void(0)" target="_blank">蕲春泥塑</a></li>
          <li><a href="javascript:void(0)" target="_blank">藏族服饰</a></li>
          <li><a href="javascript:void(0)" target="_blank">江苏大学机械学院 </a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学南湖新图书馆</a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学管院大楼</a></li>
        </ul>
        <ul class="scene-list">
          <li class="title">VR视频(无数据)</li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学东院校区 </a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学南湖校区</a></li>
          <li><a href="javascript:void(0)" target="_blank">武汉理工大学新一教学楼</a></li>
          <li><a href="" target="_blank">孝感金卉庄园(无数据)</a></li>
          <li><a href="" target="_blank">双桥古镇(无数据)</a></li>
          <li><a href="http://720yun.com/t/d4021j86juv" target="_blank">九房沟</a></li>
        </ul>
      </div>
    </section>
    <section>
      <div class="scene-lists">
        <ul class="scene-list">
          <li class="title">数字商品展示(无数据)</li>
          <li><a href="javascript:void(0)" target="_blank">鼎充新能源汽车充电桩</a></li>
        </ul>



        <ul class="scene-list">
          <li class="title">数字扬州</li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/yangzhoukejiju/index.html" target="_blank">扬州邗江区科技孵化楼</a></li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/yangzhougaoxinqu/index.html" target="_blank">扬州高新区</a></li>
        </ul>
        <ul class="scene-list">
          <li class="title">数字古村落</li>
          <li><a href="http://720yun.com/t/d4021j86juv" target="_blank">大悟九房沟村</a></li>
          <li><a href="" target="_blank">双桥古镇(无数据)</a></li>
          <li><a href="" target="_blank">砖窑(无数据)</a></li>
        </ul>
        <ul class="scene-list">
          <li class="title">数字街景</li>
          <li><a href="http://www.ourinnovate.com:82/scenelists/lihuangpilu/index.html" target="_blank">黎黄陂路街头博物馆</a></li>
          <li><a href="" target="_blank">孝感金卉庄园(无数据)</a></li>
        </ul>


      </div>
    </section>
</div>

<!--尾部-->
<jsp:include page="include/footer.jsp"></jsp:include>
<script>var contextPath="${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/art-main"></script>

</body>
</html>
