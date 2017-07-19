/**
 * Created by dushang on 17/1/22.
 */

define(["jQuery"], function($) {
    $(function() {

        /*用户列表鼠标悬停下拉显示*/
        $('.user-info').hover(function() {
            $('.user-info').css({
                borderBottom: "1px solid #fab707"
            });
            $('.user-list').stop().slideDown();
        }, function() {
            $('.user-list').stop().slideUp(function() {
                $('.user-info').css({
                    borderBottom: "none"
                });
            });
        });

        $('.slide-menu').hover(function() {
            var $this = $(this);
            $this.find('ul').css({
                borderTop: "1px solid #fab707"
            });
            $this.find('ul').stop().slideDown();
        }, function() {
            var $this = $(this);
            $this.find('ul').stop().slideUp(function() {
                $this.css({
                    borderBottom: "none"
                })
            });
        });

        /*获取当前点击的tab标签*/

        var currentTab = 1;

        if (window.location.href.indexOf("index") > 0) {
            currentTab = 1;
        }
        if (window.location.href.indexOf("university") > 0) {
            currentTab = 2;
        }
        if (window.location.href.indexOf("museum") > 0) {
            currentTab = 3;
        }
        if (window.location.href.indexOf("art") > 0) {
            currentTab = 5;
        }
        if (window.location.href.indexOf("originality") > 0) {
            currentTab = 6;
        }

        $('.navbar-nav').find('li').each(function() {
            if ($(this).attr('data-tab') == currentTab) {
                $(this).addClass('current-tab').siblings().removeClass('current-tab');
            }
        });
        $('.navbar-nav').find('li').on('click', function() {
            if ($(this).attr('data-tab') != 4) {
                $(this).addClass('current-tab').siblings().removeClass('current-tab');
                window.location.href = $(this).find('a').attr('href');
            }
        });
    });
});