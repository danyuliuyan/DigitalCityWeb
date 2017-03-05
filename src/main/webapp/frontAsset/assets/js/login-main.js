/**
 * Created by dushang on 17/1/20.
 */
require.config({
    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs"
    ],
    function ($) {
        /*图片动画*/
        $('#loginImg').animate({
            marginLeft:"50px"
        },"slow","swing",function () {
            $('.login-form').fadeIn("slow","linear");
        });



        $('.login-form').find('input').on('focus',function () {
            $(this).parent().find('.fa-times-circle').show();
        });
        $('.login-form').find('input').on('blur',function () {
            $(this).parent().find('.fa-times-circle').hide();
        });

        /*注意事件的触发顺序mousedown>blur>mouseup>click*/
        $('.fa-times-circle').on('mousedown',function (e) {
            $(this).parent().find('input').val("");
            /*阻止blur事件的发生*/
            e.preventDefault();
        });

        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13){ // enter 键
                loginCheck();
                return false;
            }
        };

        function loginCheck() {

            /*禁用按钮点击*/
            $('#loginBtn').attr({"disabled":"disabled"});
            /*正则表达式验证邮箱格式*/
            var regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;

            var username=$('.login-form form input[name=username]').val();
            var password=$('.login-form form input[name=password]').val();
            if(username==""){
                $('#warningInfo').text("账号不能为空！");
            }else if(!regEmail.test(username)){
                $('#warningInfo').text("邮箱格式错误！");
            }else if(password==""){
                $('#warningInfo').text("密码不能为空！");
            }else{
                /*连接后台验证用户名密码是否正确*/

                /*测试*/
                $.ajax({
                    url:contextPath+"/login",
                    method:"post",
                    cache:false,
                    dataType:"json",
                    data:{
                        email:username,
                        password:password
                    },
                    success:function (data) {
                        if(data["message"]=="success"){
                            /*页面跳转*/
                            if(document.referrer.indexOf("login")>0||document.referrer.indexOf("register")>0){
                                window.location.href=contextPath+"/index";
                            }else{
                                window.location.href=document.referrer;
                            }

                            $('#warningInfo').text("");
                        }else{
                            $('#warningInfo').text(data.message);
                            $('.alert').css({
                                visibility:"visible"
                            }).animate({
                                height:"30px"
                            },"slow","swing");

                            setTimeout(function () {
                                $('.alert').animate({
                                    height:"0"
                                },"slow",function () {
                                    $('.alert').css({
                                        visibility:"hidden"
                                    });
                                    /*回调*/
                                    $("#loginBtn").removeAttr("disabled");//将按钮可用
                                });
                            },2000);
                        }
                    },
                    error:function (e) {
                        console.log(e);
                    }

                });
            }

            if($("#warningInfo").text()!=""){
                $('.alert').css({
                    visibility:"visible"
                }).animate({
                    height:"30px"
                },"slow","swing");

                setTimeout(function () {
                    $('.alert').animate({
                        height:"0"
                    },"slow",function () {
                        $('.alert').css({
                            visibility:"hidden"
                        });
                        /*回调*/
                        $("#loginBtn").removeAttr("disabled");//将按钮可用
                    });
                },2000);
            }

            return false;
        }

        $('#loginBtn').on('click',loginCheck)
    }
);
