/**
 * Created by dushang on 17/1/23.
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
        $('#registerImg').animate({
            marginLeft:"50px"
        },"slow","swing",function () {
            $('.register-form').fadeIn("slow","linear");
        });

        /*提示框*/
        $("[data-toggle='tooltip']").tooltip();


        /*清除输入框内容按钮显示隐藏控制*/
        $('.register-form').find('input').on('focus',function () {
            $(this).parent().find('.fa-times-circle').show();
        });
        $('.register-form').find('input').on('blur',function () {
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
                registerCheck();
                return false;
            }
        };

        function registerCheck() {

            /*禁用按钮点击*/
            $('#registerBtn').attr({"disabled":"disabled"});
            /*正则表达式验证用户名格式*/
            var regUsername = /^[\w\u4e00-\u9fa5]{2,16}$/;
            /*正则表达式验证邮箱格式*/
            var regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            /*正则表达式验证密码格式*/
            var regPassword= /^[A-Za-z0-9\x21-\x7e]{6,16}$/;


            var username=$('.register-form form input[name=username]').val();
            var email=$('.register-form form input[name=email]').val();
            var password=$('.register-form form input[name=password]').val();
            var passwordConfirm=$('.register-form form input[name=passwordConfirm]').val();
            if(username==""){
                $('#warningInfo').text("用户名不能为空！");
            }else if(!regUsername.test(username)){
                $('#warningInfo').text("用户名格式错误！");
            }else if(email==""){
                $('#warningInfo').text("邮箱不能为空！");
            }else if(!regEmail.test(email)){
                $('#warningInfo').text("邮箱格式错误！");
            }else if(password==""){
                $('#warningInfo').text("密码不能为空！");
            }else if(!regPassword.test(password)){
                $('#warningInfo').text("密码格式错误！");
            }else if(password!=passwordConfirm){
                $('#warningInfo').text("两次输入的密码不一致！");
            }else{
                /*连接后台验证用户名密码是否正确*/

                /*测试*/
                $.ajax({
                    url:contextPath+"/register",
                    method:"post",
                    cache:false,
                    dataType:"json",
                    data:{
                        username:username,
                        email:email,
                        password:password
                    },
                    success:function (data) {
                        if(data["message"]=="success"){
                            /*页面跳转*/
                            $('#successInfo').css({
                                visibility:"visible"
                            });

                            setTimeout(function () {
                                window.location.href=contextPath+"/login";
                            },3000);

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
                                    $("#registerBtn").removeAttr("disabled");//将按钮可用
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
                        $("#registerBtn").removeAttr("disabled");//将按钮可用
                    });
                },2000);
            }

            return false;
        }

        $('#registerBtn').on('click',registerCheck)
    }
);
