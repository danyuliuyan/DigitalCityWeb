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

        $('.instrument h2 span').click(function(){
            $(this).addClass('selected').siblings().removeClass('selected');
            var listName = $(this).attr('data-ul-target');
            // alert(listName);
            $("#"+listName).slideDown().siblings('ul').slideUp();
        });

        $('#musicList > li').on('click','.fa-play',function(){
            var parentEle = $(this).parent().parent().parent();
            parentEle.siblings().find('label').removeClass('rotate');
            parentEle.siblings().find('audio').each(function(index,ele){
              ele.pause();
              //   console.log(index+ele);
            });
            parentEle.find('label').addClass('rotate');
            parentEle.find('audio')[0].play();
        });

        $('#musicList > li').on('click','.fa-pause',function(){
            var parentEle = $(this).parent().parent().parent();
            parentEle.find('label').removeClass('rotate');
            parentEle.find('audio')[0].pause();
        });

        $('#musicList > li').on('click','.fa-stop',function(){
            var parentEle = $(this).parent().parent().parent();
            parentEle.find('label').removeClass('rotate');
            parentEle.find('audio')[0].currentTime = 0;
            parentEle.find('audio')[0].pause();
        })
    }
);