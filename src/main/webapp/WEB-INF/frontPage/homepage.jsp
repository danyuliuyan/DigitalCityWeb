<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 16/11/27
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/frontAsset/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/frontAsset/assets/css/homepage.css" rel="stylesheet">

</head>
<body>
    <jsp:include page="include/header.jsp"></jsp:include>

    <section class="wrapper">
        <div class="home-slider">
            <!-- Carousel -->
            <div id="home-slider" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#home-slider" data-slide-to="0" class="active"></li>
                    <li data-target="#home-slider" data-slide-to="1"></li>
                    <li data-target="#home-slider" data-slide-to="2"></li>
                    <li data-target="#home-slider" data-slide-to="3"></li>
                    <li data-target="#home-slider" data-slide-to="4"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <!-- Slide #1 -->
                    <div class="item active" id="item-1">
                        <div class="bg-wrapper"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h1 class="first-child animated slideInDown delay-2"><strong><span class="text-blue">数字大学之城</span></strong> <small>武汉高校</small></h1>
                                    <h4 class="animated fadeInUpBig delay-4"><span>大学基本信息及概况介绍</span></h4>
                                    <h4 class="animated fadeInUpBig delay-5"><span>地图模式展示高校地理位置分布</span></h4>
                                    <h4 class="animated fadeInUpBig delay-6"><span>校园风光数字场景再现</span></h4>
                                    <br><br><br><br>
                                    <a class="btn-animate btn-style btn-lg btn-f btn-primary animated bounceInDown delay-8" href="${pageContext.request.contextPath}/university"> >> 查看详情</a>
                                </div>
                            </div> <!-- / .row -->
                        </div> <!-- / .container -->
                    </div> <!-- / .item -->
                    <!-- Slide #2 -->
                    <div class="item" id="item-2">
                        <div class="bg-wrapper"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h1 class="first-child animated fadeInUpBig delay-2"><strong><span class="text-red">数字博物馆之城</span></strong> <small><span class="text-white">武汉博物馆</span></small></h1>
                                    <ul class="string">
                                        <li class="animated bounceInRight delay-6"><h2>纵览武汉博物馆</h2></li>
                                        <li class="animated slideInDown delay-4"><span><strong>数字三维场景</strong></span></li>
                                        <li class="animated slideInDown delay-4"><span><strong>场景重现快速游览</strong></span></li>
                                        <li><h4 class="animated fadeInUpBig delay-5"><span>地图模式分类展示</span></h4></li>
                                        <li><br><br><br><a class="btn-animate btn-style btn-lg btn-f btn-primary animated bounceInDown delay-6" href="${pageContext.request.contextPath}/museum"> >> 查看详情</a></li>
                                    </ul>
                                </div>
                            </div> <!-- / .row -->
                        </div> <!-- / .container -->
                    </div> <!-- / .item -->
                    <!-- Slide #3 -->
                    <div class="item" id="item-3">
                        <div class="bg-wrapper"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h1 class="first-child animated slideInRight delay-2">数字阅读之城<strong><span class="text-blue"> 读书</span></strong> <small>体验</small></h1>
                                    <ul class="string">
                                        <li class="animated slideInRight delay-4"><i class="fa fa-star"></i>丰富的图书资源</li>
                                        <li class="animated slideInDown delay-5"><i class="fa fa-star"></i>酣畅淋漓的阅读体验</li>
                                        <li class="animated slideInRight delay-7"><i class="fa fa-star"></i>引人入胜的图书分类</li>
                                        <li><h4 class="animated fadeInUpBig delay-5"><span>长江中文</span></h4></li>
                                        <li><br><br><br><a class="btn-animate btn-style btn-lg btn-f btn-primary animated bounceInDown delay-6" href="http://www.cjzww.com/" target="_blank"> >> 查看详情</a></li>
                                    </ul>
                                </div>
                            </div> <!-- / .row -->
                        </div> <!-- / .container -->
                    </div> <!-- / .item -->
                    <div class="item" id="item-4">
                        <div class="bg-wrapper"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h1 class="first-child animated slideInRight delay-2">数字艺术之城<strong><span class="text-blue"> </span></strong> <small>虚拟乐器</small></h1>
                                    <ul>
                                        <li class="animated slideInRight delay-5"><i class="fa fa-star"></i>在线音乐欣赏</li>
                                        <li><h4 class="animated fadeInUpBig delay-4"><span>在线乐器个人演奏</span></h4></li>
                                        <li class="animated slideInRight delay-6"><i class="fa fa-star"></i>个人音乐发布收藏</li>
                                        <li><h4 class="animated fadeInUpBig delay-4"><span>在线乐器多人协奏</span></h4></li>
                                        <li><br><br><a class="btn-animate btn-style btn-lg btn-f btn-primary animated bounceInDown delay-6" href="${pageContext.request.contextPath}/art"> >> 查看详情</a></li>
                                    </ul>
                                </div>
                            </div> <!-- / .row -->
                        </div> <!-- / .container -->
                    </div> <!-- / .item -->
                    <div class="item" id="item-5">
                        <div class="bg-wrapper"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h1 class="first-child animated slideInRight delay-2">数字创意之城<strong><span class="text-blue"></span></strong> <small>创新创意</small></h1>
                                    <ul>
                                        <li class="animated bounceInRight delay-6"><h2>大学生科技创新</h2></li>
                                        <li class="animated slideInDown delay-4"><i class="fa fa-star"></i>文艺创作</li>
                                        <li class="animated slideInRight delay-5"><i class="fa fa-star"></i>工业创新</li>
                                        <li><br><br><br><a class="btn-animate btn-style btn-lg btn-f btn-primary animated bounceInDown delay-6" href="${pageContext.request.contextPath}/originality"> >> 查看详情</a></li>
                                    </ul>
                                </div>
                            </div> <!-- / .row -->
                        </div> <!-- / .container -->
                    </div> <!-- / .item -->
                </div> <!-- / .carousel -->
                <!-- Controls -->
                <a class="carousel-arrow carousel-arrow-prev hidden-xs hidden-sm" href="#home-slider" data-slide="prev">
                    <i class="fa fa-angle-left fa-2x"></i>
                </a>
                <a class="carousel-arrow carousel-arrow-next hidden-xs hidden-sm" href="#home-slider" data-slide="next">
                    <i class="fa fa-angle-right fa-2x"></i>
                </a>
            </div>
        </div> <!-- / .home-slider -->
    </section>

    <jsp:include page="include/footer.jsp"></jsp:include>

    <%--引入js文件--%>
    <script>var contextPath="${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/frontAsset/assets/js/common/require.min.js" rel="script" defer data-main="${pageContext.request.contextPath}/frontAsset/assets/js/homepage-main"></script>
</body>
</html>
