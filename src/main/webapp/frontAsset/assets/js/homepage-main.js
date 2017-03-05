/**
 * Created by dushang on 17/1/22.
 */
require.config({
    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "header"
    ],
    function ($) {
        //do something here
    }
);