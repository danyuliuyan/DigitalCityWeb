require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "customerScrollbar":"custom-scrollbar/js/jquery.mCustomScrollbar",
        "three":"js/common/three.min",
        "projector":"js/common/projector",
        "canvasRenderer":"js/common/canvas-renderer",
        "baiduMap":"js/common/baidu.map.min"
    },

    shim:{
        "jQuery":{exports:"$"},
        "customerScrollbar":{deps:["jQuery"]},
        "bootstrapJs":{deps:["jQuery"]},
        "projector":{deps:["three"]},
        "canvasRenderer":{deps:["three"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "customerScrollbar",
        "header",
        "three",
        "projector",
        "canvasRenderer",
        "baiduMap"
    ],
    function ($) {

        initPage();
        //初始化页面
        function initPage() {

            //直接初始化地图
            initMap();

            setLeftMenuPosition();

            $('.university-list').mCustomScrollbar();

        }


        //初始化地图
        function  initMap() {
            // 百度地图API功能
            var map = new BMap.Map("allmap");    // 创建Map实例

            var initialPoint = new BMap.Point($('.left-menu li').first().attr('data-lng'),$('.left-menu li').first().attr('data-lat'));       //创建初始地图中心，列表第一个
            map.centerAndZoom(initialPoint,13);        //设置中心点坐标和地图级别


            var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});// 左下角，添加比例尺
            var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
            var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
            /*缩放控件type有四种类型:
             BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
            map.addControl(top_left_control);       //添加缩放比例尺
            map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

            var navigationControl = new BMap.NavigationControl({
                // 靠左上角位置
                anchor: BMAP_ANCHOR_TOP_LEFT,
                // LARGE类型
                type: BMAP_NAVIGATION_CONTROL_LARGE,
                // 启用显示定位
                enableGeolocation: true
            });
            map.addControl(navigationControl);
            // 添加定位控件

            leftMenuClick();
            setOverlay();

            // 编写自定义函数,创建标注
            function addMarker(point,label,id,type,animate){
                var marker = new BMap.Marker(point);
                map.addOverlay(marker);
                marker.setLabel(label);
                if(animate){
                    marker.setAnimation(BMAP_ANIMATION_BOUNCE);
                }
                label.addEventListener('click',function () {
                    //页面跳转
                    if(type==1){
                        location.href=contextPath+"/universityDetail?id="+id;
                    }else if(type==2){
                        location.href=contextPath+"/museumDetail?id="+id;
                    }else{
                        location.href=contextPath+"/index";
                    }
                });
                marker.addEventListener('click',function () {
                    //页面跳转
                    if(type==1){
                        location.href=contextPath+"/universityDetail?id="+id;
                    }else if(type==2){
                        location.href=contextPath+"/museumDetail?id="+id;
                    }else{
                        location.href=contextPath+"/index";
                    }
                })
            }

            function setOverlay(currentPoint) {
                $('.left-menu li').each(function () {

                    var label = new BMap.Label($(this).find('a').text(),{offset:new BMap.Size(20,-10)});

                    label.setStyle({
                        color : "#CC5522",
                        position: "relative",
                        fontSize : "14px",
                        height : "20px",
                        fontWeight: "bold",
                        lineHeight : "20px",
                        fontFamily:"微软雅黑",
                        border:"1px solid #ccc",
                        borderRadius:"5px",
                        padding:"5px 10px"
                    });

                    var lng = $(this).attr('data-lng');
                    var lat = $(this).attr('data-lat');
                    var id = $(this).attr('data-id');
                    var type = $(this).attr('data-type');
                    var animate = false;

                    /*判断当前点是否要添加动画效果*/
                    if(currentPoint!=null&&currentPoint.lng==lng&&currentPoint.lat==lat){
                        animate = true;
                    }

                    var point = new BMap.Point(lng, lat);

                    addMarker(point,label,id,type,animate);
                });
            }

            /*左侧菜单点击事件*/
            function leftMenuClick() {

                $('.left-menu li').click(function () {
                    $('.left-menu li').removeClass('current');
                    $(this).addClass('current');

                    /*获取当前选定大学的坐标*/
                    var lng = $(this).attr('data-lng');
                    var lat = $(this).attr('data-lat');

                    //清除所有覆盖点
                    map.clearOverlays();

                    // alert(lng+","+lat);
                    /*重新设置当前地图中心点*/
                    var newCenterPoint = new BMap.Point(lng, lat);
                    setOverlay(newCenterPoint);
                    map.panTo(newCenterPoint);
                })
            }
        }

        function setLeftMenuPosition() {
            $(document).scrollTop(0);
            $(window).scroll(function() {
                // console.log($(document).scrollTop());
                $('.left-menu').css({top:64+$(document).scrollTop()+"px"});
                $('#hideArrow').css({top:329+$(document).scrollTop()+"px"});
                $('#showArrow').css({top:329+$(document).scrollTop()+"px"});
            });

            $('#hideArrow').click(function () {
                $('#hideArrow').fadeOut();
                $('.left-menu').animate({
                    left:"-240px"
                },"slow","swing",function () {
                    $('.left-menu').hide();
                    $('#showArrow').fadeIn();
                })
            });
            $('#showArrow').click(function () {
                $('#showArrow').fadeOut();
                $('.left-menu').show().animate({
                    left:"0"
                },"slow","swing",function () {
                    $('#hideArrow').fadeIn();
                })
            })
        }


        /*3d背景图相关代码*/
        function init3dBackground() {
            /*3d背景图部分*/
            var mouseX = 0, mouseY = 0,
                windowHalfX = window.innerWidth / 2,
                windowHalfY = window.innerHeight / 2,
                SEPARATION = 200,
                AMOUNTX = 1,
                AMOUNTY = 1,
                camera, scene, renderer;

            init();
            animate();

            function init() {
                /*
                 *   Define variables
                 */
                var container, separation = 1000, amountX = 50, amountY = 50, color = 0xffffff,
                    particles, particle;

                container = document.getElementById("canvas");


                camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 10000 );
                camera.position.z = 100;

                scene = new THREE.Scene();

                renderer = new THREE.CanvasRenderer({ alpha: true });
                renderer.setPixelRatio( window.devicePixelRatio );
                renderer.setClearColor( 0x000000, 0 );   // canvas background color
                renderer.setSize( window.innerWidth, window.innerHeight );
                container.appendChild( renderer.domElement );



                var PI2 = Math.PI * 2;
                var material = new THREE.SpriteCanvasMaterial( {

                    color: color,
                    opacity: 0.5,
                    program: function ( context ) {

                        context.beginPath();
                        context.arc( 0, 0, 0.5, 0, PI2, true );
                        context.fill();

                    }

                } );

                var geometry = new THREE.Geometry();

                /*
                 *   Number of particles
                 */
                for ( var i = 0; i < 150; i ++ ) {

                    particle = new THREE.Sprite( material );
                    particle.position.x = Math.random() * 2 - 1;
                    particle.position.y = Math.random() * 2 - 1;
                    particle.position.z = Math.random() * 2 - 1;
                    particle.position.normalize();
                    particle.position.multiplyScalar( Math.random() * 10 + 600 );
                    particle.scale.x = particle.scale.y = 5;

                    scene.add( particle );

                    geometry.vertices.push( particle.position );

                }

                /*
                 *   Lines
                 */

                var line = new THREE.Line( geometry, new THREE.LineBasicMaterial( { color: color, opacity: 0.2 } ) );
                scene.add( line );

                document.addEventListener( 'mousemove', onDocumentMouseMove, false );
                document.addEventListener( 'touchstart', onDocumentTouchStart, false );
                document.addEventListener( 'touchmove', onDocumentTouchMove, false );

                //

                window.addEventListener( 'resize', onWindowResize, false );

            }

            function onWindowResize() {

                windowHalfX = window.innerWidth / 2;
                windowHalfY = window.innerHeight / 2;

                camera.aspect = window.innerWidth / window.innerHeight;
                camera.updateProjectionMatrix();

                renderer.setSize( window.innerWidth, window.innerHeight );

            }

            //

            function onDocumentMouseMove(event) {

                mouseX = (event.clientX - windowHalfX) * 0.05;
                mouseY = (event.clientY - windowHalfY) * 0.2;

            }

            function onDocumentTouchStart( event ) {

                if ( event.touches.length > 1 ) {

                    event.preventDefault();

                    mouseX = (event.touches[ 0 ].pageX - windowHalfX) * 0.7;
                    mouseY = (event.touches[ 0 ].pageY - windowHalfY) * 0.7;

                }

            }

            function onDocumentTouchMove( event ) {

                if ( event.touches.length == 1 ) {

                    event.preventDefault();

                    mouseX = event.touches[ 0 ].pageX - windowHalfX;
                    mouseY = event.touches[ 0 ].pageY - windowHalfY;

                }

            }

            //

            function animate() {

                requestAnimationFrame( animate );

                render();

            }

            function render() {

                camera.position.x += ( mouseX - camera.position.x ) * 0.1;
                camera.position.y += ( - mouseY + 200 - camera.position.y ) * 0.05;
                camera.lookAt( scene.position );

                renderer.render( scene, camera );

            }

            /*3d背景图颜色变化*/
            var colors = [
                [62,35,255],
                [60,255,60],
                [255,35,98],
                [45,175,230],
                [255,0,255],
                [255,128,0]
            ];
//

            var step = 0;
//color table indices for:
// current color left
// next color left
// current color right
// next color right
            var colorIndices = [0,1,2,3];

//transition speed
            var gradientSpeed = 0.002;

            function updateGradient()
            {

                if ( $===undefined ) return;

                var c0_0 = colors[colorIndices[0]];
                var c0_1 = colors[colorIndices[1]];
                var c1_0 = colors[colorIndices[2]];
                var c1_1 = colors[colorIndices[3]];

                var istep = 1 - step;
                var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
                var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
                var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
                var color1 = "rgb("+r1+","+g1+","+b1+")";

                var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
                var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
                var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
                var color2 = "rgb("+r2+","+g2+","+b2+")";

                $('.gradient').css({
                    background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
                    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});

                step += gradientSpeed;
                if ( step >= 1 )
                {
                    step %= 1;
                    colorIndices[0] = colorIndices[1];
                    colorIndices[2] = colorIndices[3];

                    //pick two new target color indices
                    //do not pick the same as the current one
                    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
                    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;

                }
            }

            setInterval(updateGradient,10);


            // 三维选择页面动画
            $("#ball1,#ball2").addClass("animatednormal pulsespecial");
            $("#ball1").mouseover(function(){
                $(this).removeClass("animatednormal pulsespecial");
                $(this).css({"background":"url(./image/3D/select1_hover.png) center center no-repeat","opacity":"0.6","width":"400px","height":"400px"}).animate({top:'22%'},'fast').addClass("animated shake");
            });
            $("#ball1").mouseout(function(){
                $(this).addClass("animatednormal pulsespecial");
                $(this).css({"background":"url(./image/3D/select1.png) center center no-repeat","opacity":"1","width":"240px","height":"240px"}).animate({top:'30%'},'normal').removeClass("animated shake");
            });
            $("#ball2").mouseover(function(){
                $(this).removeClass("animatednormal pulsespecial");
                $(this).css({"background":"url(./image/3D/select2_hover.png) center center no-repeat","opacity":"0.6","width":"400px","height":"400px"}).animate({top:'22%'},'fast').addClass("animated shake");
            });
            $("#ball2").mouseout(function(){
                $(this).addClass("animatednormal pulsespecial");
                $(this).css({"background":"url(./image/3D/select2.png) center center no-repeat","opacity":"1","width":"240px","height":"240px"}).animate({top:'30%'},'normal').removeClass("animated shake");
            });
        }
    }
);