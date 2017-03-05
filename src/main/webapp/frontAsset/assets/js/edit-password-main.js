/**
 * Created by dushang on 17/2/20.
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
        "bootstrapJs":{deps:["jQuery"]},
        "bootstrapDatetimepicker":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "header"
    ],
    function ($) {
        /*提示框*/
        $("[data-toggle='tooltip']").tooltip();

        /*重置按钮点击事件*/
        $('#resetBtn').click(function () {
            $('#passwordOld').val("");
            $('#passwordNew').val("");
            $('#passwordConfirm').val("");
        });

        $('#saveBtn').click(function () {

            $('.error-msg').hide();
            $('.success-msg').hide();

            var passwordOld = $('#passwordOld').val();
            var passwordNew = $('#passwordNew').val();
            var passwordConfirm = $('#passwordConfirm').val();

            var regPassword= /^[A-Za-z0-9\x21-\x7e]{6,16}$/;

            if(passwordOld==""){
                $('.error-msg').text("原密码不能为空！").show();
            }else if(passwordNew == ""){
                $('.error-msg').text("新密码不能为空！").show();
            }else if(!regPassword.test(passwordNew)){
                $('.error-msg').text("新密码格式错误，请重新输入！").show();
            }else if(passwordNew!=passwordConfirm){
                $('.error-msg').text("两次输入的密码不一致！").show();
            }else{
                $.ajax({
                    url:contextPath+"/editPassword",
                    method:"post",
                    cache:false,
                    dataType:"json",
                    data:{
                        id:id,
                        passwordOld:passwordOld,
                        passwordNew:passwordNew
                    },
                    success:function (data) {
                        if(data["message"]=="success"){
                            $('.success-msg').text("密码修改成功！").show();
                        }else{
                            $('.error-msg').text(data["message"]).show();
                        }
                    },
                    error:function (e) {
                        console.log(e);
                    }

                });
            }
        })
    }
);