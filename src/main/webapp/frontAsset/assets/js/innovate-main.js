/**
 * Created by dushang on 17/6/26.
 */

require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "customerScrollbar":"custom-scrollbar/js/jquery.mCustomScrollbar",
        "dotBg":"js/common/dot-bg"
    },

    shim:{
        "jQuery":{exports:"$"},
        "customerScrollbar":{deps:["jQuery"]},
        "bootstrapJs":{deps:["jQuery"]},
        "dotBg":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "customerScrollbar",
        "header",
        "dotBg"
    ],
    function ($) {

        initPage();
        //初始化页面
        function initPage() {

            /*提示框*/
            // $("[data-toggle='tooltip']").tooltip();

            $('.resources-list li:eq(0)').addClass('selected');
            loadIframe($('.resources-list li:eq(0)').attr('data-url'),$('.resources-list li:eq(0)').attr('data-organization-id'));

            function loadIframe(url,organizationId){
                if(url.indexOf('ourinnovate')>=0){
                    $("iframe").attr("src" , url).load(function(){
                        console.log(document.getElementById('iframeDetail').contentWindow.document.body.scrollHeight);
                    });
                }else{
                    $.ajaxPrefilter( function (options) {
                        if (options.crossDomain && jQuery.support.cors) {
                            var http = (window.location.protocol === 'http:' ? 'http:' : 'https:');
                            options.url = http + '//cors-anywhere.herokuapp.com/' + options.url;
                            //options.url = "http://cors.corsproxy.io/url=" + options.url;
                        }
                    });
                    $.get(url, function (response) {
                        response = response.replace(/data-src/g, "src");
                        var html_src = 'data:text/html;charset=utf-8,' + response;
                        $("iframe").attr("src" , html_src).load(function(){
                            console.log(document.getElementById('iframeDetail').contentWindow.document.body.scrollHeight);
                        });
                    });
                }

                $.ajax({
                    method:'post',
                    url:contextPath+"/originality/getOrganization",
                    data:{
                        organizationId:organizationId
                    },
                    success:function(data){
                        $('.intro h3 a').html(data.organization.name).attr('href',data.organization.website);
                        $('.intro h3').attr('data-title',data.organization.description);
                        $("[data-toggle='tooltip']").tooltip();
                    }
                })
            }
            $('.resources-list li').click(function () {
                var url = $(this).attr('data-url');
                var organizationId = $(this).attr('data-organization-id');
                $(this).addClass('selected').siblings().removeClass('selected');
                loadIframe(url, organizationId);
            });
            $('.resources-list').mCustomScrollbar();


            setIframeSize();
            $(window).resize(function(){
                setIframeSize();
            });
            function setIframeSize(){
                var clientHeight = document.body.clientHeight;
                var clientWidth = document.body.clientWidth;
                // alert(clientHeight);
                if(clientHeight >= 1014){
                    $('#iframeDetail').css({
                        height:'800px',
                        width:'1200px'
                    });

                }else if(clientHeight >= 922){

                    $('#iframeDetail').css({
                        height:'700px',
                        width:'1100px'
                    });
                }else if(clientHeight >= 811){
                    $('#iframeDetail').css({
                        height:'600px',
                        width:'1000px'
                    });
                }else{
                    $('#iframeDetail').css({
                        height:clientHeight*0.75+'px',
                        width:clientWidth*0.75+'px'
                    });
                }
            }

            setLeftMenuPosition();
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

    }
);