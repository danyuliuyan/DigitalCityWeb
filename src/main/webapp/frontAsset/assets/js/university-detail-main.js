/**
 * Created by dushang on 17/2/23.
 */
require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "gallery":"gallery/js/jquery.ad-gallery",
        "customerScrollbar":"custom-scrollbar/js/jquery.mCustomScrollbar",
        "dotBg":"js/common/dot-bg"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]},
        "gallery":{deps:["jQuery"]},
        "customerScrollbar":{deps:["jQuery"]},
        "dotBg":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "header",
        "gallery",
        "dotBg",
        "customerScrollbar"
    ],
    function ($) {
        
        InitPage();

        function InitPage() {
            gallery();
            // jsGrow();

            //初始化场景
            $('.scene-list li').first().addClass('current');
            $('#sceneBox').attr('src',$('.scene-list li').first().attr('data-url'));
            // $('.scene-list li').first().click();
        }

        /*场景列表滚动条设置*/
        $('.scene-list').mCustomScrollbar({
            theme:"dark"
        });

        /*js生长动画效果*/
        function jsGrow() {
            'use strict';

            var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

            function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

            var Line = function () {
                function Line(x, y, a) {
                    _classCallCheck(this, Line);

                    this.x = x;
                    this.y = y;
                    this.ang = a;
                    this.angVel = 0;
                    this.angAcc = 0.4;
                }

                _createClass(Line, [{
                    key: 'anim',
                    value: function anim() {
                        ctx.moveTo(this.x, this.y + 1);
                        this.x += 6 * Math.cos(this.ang);
                        this.y += 6 * Math.sin(this.ang);
                        this.angVel += 0.2 * (Math.random() - Math.random());
                        this.angVel *= this.angAcc;
                        this.ang += this.angVel;
                        if (Math.random() > 0.98) {
                            if (this.angAcc === 0.4) this.angAcc = 0.98;else this.angAcc = 0.4;
                        }
                        ctx.lineTo(this.x, this.y);
                        if (Math.random() > 0.96 && numLines < 20) {
                            lines.add(new Line(width / 2, height, -Math.PI / 2));
                            numLines++;
                        }
                        if (this.x < -20 || this.x > width + 20 || this.y > height || this.y < 30) {
                            if (numLines > 1) {
                                numLines--;
                                lines.delete(this);
                                ctx.beginPath();
                                for (var i = 0; i < 2 * Math.PI; i += 0.314) {
                                    ctx.moveTo(this.x, this.y);
                                    ctx.lineTo(this.x + (5 * Math.random() + 12) * Math.cos(i), this.y + (5 * Math.random() + 12) * Math.sin(i));
                                }
                                ctx.stroke();
                            }
                        }
                    }
                }]);

                return Line;
            }();

            var canvas = document.getElementById('c');
            var ctx = canvas.getContext('2d');
            var width = canvas.width = canvas.offsetWidth * 1;
            var height = canvas.height = canvas.offsetHeight * 1;
            ctx.strokeStyle = "#654";
            var lines = new Set();
            var numLines = 0;
            var y = 0;
            ctx.fillStyle = "#fff";
            ctx.fillRect(0, 0, width, height);
            lines.add(new Line(width / 2, height, -Math.PI / 2));
            function run() {
                requestAnimationFrame(run);
                ctx.drawImage(canvas, 0, 1);
                var _iteratorNormalCompletion = true;
                var _didIteratorError = false;
                var _iteratorError = undefined;

                try {
                    for (var _iterator = lines[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
                        var line = _step.value;

                        ctx.beginPath();
                        line.anim();
                        ctx.stroke();
                    }
                } catch (err) {
                    _didIteratorError = true;
                    _iteratorError = err;
                } finally {
                    try {
                        if (!_iteratorNormalCompletion && _iterator.return) {
                            _iterator.return();
                        }
                    } finally {
                        if (_didIteratorError) {
                            throw _iteratorError;
                        }
                    }
                }
            }
            run();
        }

        /*图片轮播动画*/
        function gallery(){
            $('img.image1').data('ad-desc', 'Whoa! This description is set through elm.data("ad-desc") instead of using the longdesc attribute.<br>And it contains <strong>H</strong>ow <strong>T</strong>o <strong>M</strong>eet <strong>L</strong>adies... <em>What?</em> That aint what HTML stands for? Man...');
            $('img.image1').data('ad-title', 'Title through $.data');
            $('img.image4').data('ad-desc', 'This image is wider than the wrapper, so it has been scaled down');
            $('img.image5').data('ad-desc', 'This image is higher than the wrapper, so it has been scaled down');

            $('.ad-thumb-list li').each(function () {
                var img = $(this).find('img');
                var source = img.attr('data-src');
                if(source){
                    var thumbSource = source.split('.')[0]+'.thumb.'+source.split('.')[1];
                    img.attr('src',thumbSource);
                }
            });
            var galleries = $('.ad-gallery').adGallery();
            $('#switch-effect').change(
                function() {
                    galleries[0].settings.effect = $(this).val();
                    return false;
                }
            );
            $('#toggle-slideshow').click(
                function() {
                    galleries[0].slideshow.toggle();
                    return false;
                }
            );
            $('#toggle-description').click(
                function() {
                    if(!galleries[0].settings.description_wrapper) {
                        galleries[0].settings.description_wrapper = $('#descriptions');
                    } else {
                        galleries[0].settings.description_wrapper = false;
                    }
                    return false;
                }
            );
        }


        $('.scene-list li').click(function () {
            var sceneUrl = $(this).attr('data-url');
            $(this).addClass('current').siblings().removeClass('current');

            $('#sceneBox').attr('src',sceneUrl);
        });

        /*三维场景全屏效果*/
        $('#fullScreenBtn').click(function () {
            // var ele = document.getElementById('sceneBox');
            var ele = $('#sceneBox')[0];
            fullScreen(ele);
            // exitFullScreen();
        });

        function fullScreen(element) {
            // 判断各种浏览器，找到正确的方法
            var requestMethod = element.requestFullScreen || //W3C
                element.webkitRequestFullScreen ||    //Chrome等
                element.mozRequestFullScreen || //FireFox
                element.msRequestFullScreen; //IE11
            if (requestMethod) {
                requestMethod.call(element);
            }
            else if (typeof window.ActiveXObject !== "undefined") {//for Internet Explorer
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
        }

        //退出全屏 判断浏览器种类
        function exitFullScreen() {
            // 判断各种浏览器，找到正确的方法
            var exitMethod = document.exitFullscreen || //W3C
                document.mozCancelFullScreen ||    //Chrome等
                document.webkitExitFullscreen || //FireFox
                document.webkitExitFullscreen; //IE11
            if (exitMethod) {
                exitMethod.call(document);
            }
            else if (typeof window.ActiveXObject !== "undefined") {//for Internet Explorer
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
        }
    }
);