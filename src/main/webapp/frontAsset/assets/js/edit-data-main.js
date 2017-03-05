/**
 * Created by dushang on 17/2/4.
 */
require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "bootstrapDatetimepicker":"bootstrap-datetimepicker/js/bootstrap-datetimepicker.min",
        "bootstrapDatetimepickerZH":"bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN",
        "jQueryCity":"js/common/jquery.citys",
        "header":"js/common/header"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]},
        "bootstrapDatetimepicker":{deps:["jQuery"]},
        "jQueryCity":{deps:["jQuery"]},
        "bootstrapDatetimepickerZH":{deps:["jQuery",'bootstrapDatetimepicker']}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "bootstrapDatetimepicker",
        "jQueryCity",
        "bootstrapDatetimepickerZH",
        "header"
    ],
    function ($) {
        /*提示框*/
        $("[data-toggle='tooltip']").tooltip();

        /*生日插件*/
        $(".birthday").datetimepicker({
            language: 'zh-CN',
            autoclose: true,
            // todayBtn: true,
            todayHighlight: true,
            minView: 2,
            pickerPosition: 'bottom-left'
        });
        /*设置结束时间*/
        var nowDate = new Date();
        nowDate = nowDate.getFullYear()+"-"+(parseInt(nowDate.getMonth())+1)+"-"+nowDate.getDate();
        $('.birthday').datetimepicker('setEndDate', nowDate);
        /*地址联动下拉框*/
        if(oldArea==""||oldArea==null){
            $('#address').citys({
                province:oldProvince,
                city:oldCity
            });
        }else{
            $('#address').citys({
                province:oldProvince,
                city:oldCity,
                area:oldArea
            });
        }


        /*初始化个性签名可输入字数*/
        $('#checkNum>div>span').text(300-$('#selfDesc').val().length);
        $('#selfDesc').on("input propertychange",function () {
            // console.log($('#selfDesc').val().length);
            var content = $('#selfDesc').val();
            var wordLeft = 300-content.length;
            if(wordLeft>=0){
                $('#checkNum>div>span').text(wordLeft);
            }else{
                $('#selfDesc').val(content.substring(0,content.length-1));
                $('#checkNum>div>span').text(0);
            }
        });


        /*重置按钮点击事件*/
        $('#resetBtn').click(function () {
            // $('#email').val(oldEmail);
            // $('#username').val(oldName);
            // $('#phone').val(oldPhone);
            // $('#qq').val(oldQq);
            // if(oldSex==0){
            //     $('#woman').removeAttr("checked");
            //     $('#man').attr("checked","checked");
            // }else if(oldSex==1){
            //     $('#man').removeAttr("checked");
            //     $('#woman').attr("checked","checked");
            // }else{
            //     $('#man').removeAttr("checked");
            //     $('#woman').removeAttr("checked");
            // }
            // $('#birthday').val(oldBirthday);
            // $('#birthdayRead').val(oldBirthday);
            // $('#selfDesc').val(oldSelfDesc);
            //
            // if(oldArea==""||oldArea==null){
            //     $('#address').citys({
            //         province:oldProvince,
            //         city:oldCity
            //     });
            // }else{
            //     $('#address').citys({
            //         province:oldProvince,
            //         city:oldCity,
            //         area:oldArea
            //     });
            // }
            location.reload();
        });

        /*保存按钮点击事件*/
        $('#saveBtn').click(function () {

            $('.error-msg').hide();
            $('.success-msg').hide();

            var email = $('#email').val();
            var username = $('#username').val();
            var phone = $('#phone').val();
            var qq = $('#qq').val();
            var sex = $('input[name=sex]:checked').val();
            var birthday = $('#birthday').val();
            var province = $('#province option:selected').text();
            var city = $('#city option:selected').text();
            var area = $('#area option:selected').text();
            var selfDesc = $('#selfDesc').val();

            if(phone==undefined||phone==null){
                phone="";
            }
            if(qq==undefined||qq==null){
                qq="";
            }
            if(sex==undefined||sex==null){
                sex="";
            }
            if(birthday==undefined||birthday==null){
                birthday="";
            }
            if(selfDesc==undefined||selfDesc==null){
                selfDesc="";
            }


            var regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            var regUsername = /^[\w\u4e00-\u9fa5]{2,16}$/;
            var regPhone = /^1[34578]\d{9}$/;
            var regQq = /^[1-9][0-9]{4,14}$/;

            if(email == ""|| email == null){
                $('.error-msg').text("邮箱不能为空！").show();
                return false;
            }else if(!regEmail.test(email)){
                $('.error-msg').text("邮箱格式错误，请重新输入！").show();
                return false;
            }else if(username == "" || username == null){
                $('.error-msg').text("用户名不能为空！").show();
                return false;
            }else if(!regUsername.test(username)){
                $('.error-msg').text("用户名格式错误，请重新输入！").show();
                return false;
            }else{
                if(phone != null && phone != "" && !regPhone.test(phone)){
                    $('.error-msg').text("手机号格式错误，请重新输入！").show();
                    return false;
                }

                if(qq != null && qq != "" && !regQq.test(qq)){
                    $('.error-msg').text("QQ号格式错误，请重新输入！").show();
                    return false;
                }

                if(selfDesc.length>300){
                    $('.error-msg').text("个性签名字数超出限制！").show();
                    return false;
                }

                $.ajax({
                    url:contextPath+"/editData",
                    method:"post",
                    cache:false,
                    dataType:"json",
                    data:{
                        id:id,
                        email:email,
                        username:username,
                        phone:phone,
                        qq:qq,
                        sex:sex,
                        birthday:birthday,
                        province:province,
                        city:city,
                        area:area,
                        selfDesc:selfDesc
                    },
                    success:function (data) {
                        if(data["message"]=="success"){
                            $('.success-msg').text("信息修改成功！").show();
                        }else{
                            $('.error-msg').text(data["message"]).show();
                        }
                    },
                    error:function (e) {
                        console.log(e);
                    }

                });
            }



            console.log("email:"+email+",username:"+username+",phone:"+phone+",qq:"+qq+",sex:"+sex+",birthday:"+birthday+",province:"+province+",city:"+city+",area:"+area+",selfDesc:"+selfDesc);
        });

    }
);