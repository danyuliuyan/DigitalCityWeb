/**
 * Created by dushang on 17/3/2.
 */

require.config({
    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "modernizr":"js/common/modernizr.custom.97074",
        "hoverdir":"js/common/jquery.hoverdir"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]},
        "hoverdir":{deps:["jQuery","modernizr"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "modernizr",
        "hoverdir",
        "header"
    ],
    function ($) {
        //do something here
        $('.page-welcome p').animate({
            marginTop:"320px"
        },"slow","swing");

        $(' #instrumentList > li ').each( function() { $(this).hoverdir(); } );
    }
);