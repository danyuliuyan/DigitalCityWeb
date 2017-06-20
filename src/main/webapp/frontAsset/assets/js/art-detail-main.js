/**
 * Created by dushang on 17/3/5.
 */
require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "customerScrollbar":"custom-scrollbar/js/jquery.mCustomScrollbar",
        "html5media":"js/common/html5media.min"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]},
        "customerScrollbar":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "header",
        "customerScrollbar",
        "html5media"
    ],
    function ($) {

        /*场景列表滚动条设置*/
        $('#instrumentFrame').mCustomScrollbar({
            theme:"light"
        });
        setTimeout(function () {
            setIframeSize();
        },500);
        setTimeout(function () {
            setIframeSize();
        },1000);
        setTimeout(function () {
            setIframeSize();
        },1500);
        setTimeout(function () {
            setIframeSize();
        },2000);
        setTimeout(function () {
            setIframeSize();
        },2500);
        setTimeout(function () {
            setIframeSize();
        },3000);
        function setIframeSize(){
            var iframeHeight = $("iframe").contents().find("body").height();
            $('#iframeDetail').height(parseFloat(iframeHeight)+200);
            $('#instrumentFrame').height(parseFloat(iframeHeight)+200);
            $('.instrument-frame').height(parseFloat(iframeHeight)+450);
        }
        window.onload=function () {
            // console.log($("iframe").contents().find("body").height());
            setIframeSize();
        }
    }
);