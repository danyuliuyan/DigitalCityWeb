/**
 * Created by dushang on 17/1/24.
 */
require.config({

    baseUrl:contextPath+"/frontAsset/assets/",
    paths:{
        "jQuery":"js/common/jquery-2.2.4.min",
        "bootstrapJs":"bootstrap/js/bootstrap.min",
        "header":"js/common/header",
        "cropper":"cropper/dist/cropper.min"
    },

    shim:{
        "jQuery":{exports:"$"},
        "bootstrapJs":{deps:["jQuery"]},
        "cropper":{deps:["jQuery"]}
    }
});


require(
    [
        "jQuery",
        "bootstrapJs",
        "header",
        "cropper"
    ],
    function ($) {

        /*初始化页面*/
        editSeldesc();
        editAvatar();


        /*个性签名编辑部分*/
        function editSeldesc() {
            /*显示编辑按钮*/
            $('.user-avatar').hover(function () {
                $('.edit-avatar').show();
            },function () {
                $('.edit-avatar').hide();
            });


            /*编辑个性签名提交按钮点击事件*/
            // $('#selfDescBtn').click(function () {
            //     console.log($('#selfDesc').val());
            // });
            $('#editSelfdescBtn').click(function () {
                $('#showArea').hide();
                $('#editArea').show();
            });

            $('#editSelfdescCancel').click(function () {
                $('#showArea').show();
                $('#editArea').hide();
            });

            /*初始化个性签名可输入字数*/
            $('#editArea>div>span').text(300-$('#selfDesc').val().length);
            $('#selfDesc').on("input propertychange",function () {
                // console.log($('#selfDesc').val().length);
                var content = $('#selfDesc').val();
                var wordLeft = 300-content.length;
                if(wordLeft>=0){
                    $('#editArea>div>span').text(wordLeft);
                }else{
                    $('#selfDesc').val(content.substring(0,content.length-1));
                    $('#editArea>div>span').text(0);
                }
            });

            $('#editSelfdescSave').click(function () {
                var content = $('#selfDesc').val();
                var userid = $('input[name=userid]').val();

                if(content.length>300){
                    $('#promptInfo').html("个性签名字数超出限制，请重新编辑！").show();

                    setTimeout(function () {
                        $('#promptInfo').fadeOut();
                    },3000);
                }else{
                    $.ajax({
                        url:contextPath+"/updateSelfdesc",
                        method:"post",
                        cache:false,
                        data:{
                            id:userid,
                            selfDesc:content
                        },
                        success:function (data) {
                            if(data.message=="success"){
                                $('#showArea').text(content).show();
                                $('#selfDesc').text(content).val(content);
                                $('#editArea').hide();
                            }else{
                                $('#promptInfo').html(data.message).show();

                                setTimeout(function () {
                                    $('#promptInfo').fadeOut();
                                },3000);
                            }
                        }

                    });
                }

                // console.log(content+userid);
            });
        }



        /*头像编辑部分*/
        function editAvatar() {
            var $img= $('#image');
            var options = {
                aspectRatio: 1,           //长宽比
                preview: '.img-preview'
            };

            $img.cropper(options);

            // Import image
            var $importImg = $('#importImg');
            var URL = window.URL || window.webkitURL;
            var blobURL;

            if (URL) {
                $importImg.change(function () {
                    var files = this.files;
                    var file;

                    if (!$img.data('cropper')) {
                        return;
                    }

                    if (files && files.length) {
                        file = files[0];

                        if (/^image\/\w+$/.test(file.type)) {
                            blobURL = URL.createObjectURL(file);
                            $img.one('built.cropper', function () {

                                // Revoke when load complete
                                URL.revokeObjectURL(blobURL);
                            }).cropper('reset').cropper('replace', blobURL);
                            $importImg.val('');
                        } else {
                            window.alert('Please choose an image file.');
                        }
                    }
                });
            } else {
                $importImg.prop('disabled', true).parent().addClass('disabled');
            }

            /*模态框隐藏时触发事件*/
            $('#editAvatar').on('hidden.bs.modal', function () {
                // 图片恢复初始url
                $img.cropper('reset').cropper('replace',$('.user-avatar').find("img").attr("src"));
            });

            // Upload cropped image to server if the browser supports `HTMLCanvasElement.toBlob`
            $('#uploadBtn').on('click',function () {
                var userid = $('input[name=userid]').val();

                $.ajax({
                    url:contextPath+"/editAvatar",
                    type: "POST",
                    enctype:"multipart/form-data",
                    data:{
                        userid:userid,
                        imgContent:$img.cropper('getCroppedCanvas',{width:200,height:200}).toDataURL()//表示把base64的图片字符格式提交到后台
                    },
                    success: function (data) {
                        if(data.message=="success"){
                            // console.log('Upload success');
                            $("#closeBtn").click();    //手动因此修改头像模态框
                            $img.cropper('destroy');    //销毁头像裁剪插件实例

                            //ajax回调刷新头像显示内容和模态框头像内容
                            $('.user-avatar').find("img").attr({"src":contextPath+"/"+data.avatarSrc});
                            $('header .user-info').find("img").attr({"src":contextPath+"/"+data.avatarSrc});
                            $('#editAvatar .modal-body .img-container').find('img').attr({"src":contextPath+"/"+data.avatarSrc});

                            $img.cropper(options);      //重新初始化头像裁剪插件实例

                        }else{
                            $('#promptInfo').html(data.message).show();

                            setTimeout(function () {
                                $('#promptInfo').fadeOut();
                            },30000);
                        }
                    },
                    error: function (e) {
                        $('#promptInfo').html("修改头像失败，请稍后再试！").show();

                        setTimeout(function () {
                            $('#promptInfo').fadeOut();
                        },30000);
                        // console.log(e);
                        // console.log('Upload error');
                    }
                });
                // console.log("hello");
            });
        }

    }
);