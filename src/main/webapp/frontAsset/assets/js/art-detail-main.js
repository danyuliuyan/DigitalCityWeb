/**
 * Created by dushang on 17/3/5.
 */
require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "customerScrollbar":"custom-scrollbar/js/jquery.mCustomScrollbar"
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
        "customerScrollbar"
    ],
    function ($) {

        /*场景列表滚动条设置*/
        $('#instrumentFrame').mCustomScrollbar({
            theme:"light"
        });

        window.onload=function () {
            // console.log($("iframe").contents().find("body").height());
            var iframeHeight = $("iframe").contents().find("body").height();
            $('#iframeDetail').height(parseFloat(iframeHeight)+150);
            $('#instrumentFrame').height(parseFloat(iframeHeight)+150);
            $('.instrument-frame').height(parseFloat(iframeHeight)+400);
        }
    }
);