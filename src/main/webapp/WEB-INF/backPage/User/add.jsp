<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/1/15
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/admin/User/add" data-toggle="validate" method="post" id="userForm" data-reload-navtab="true">
        <input type="hidden" name="id" value="${user.id}">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">用户名：</label>
                        <input type="text" data-rule="用户名:required"  name="username" value="${user.username}" size="30">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">邮箱：</label>
                        <input type="email" data-rule="邮箱:required;email" name="email" id="email" value="${user.email}" size="60" class="form-control">
                        <a href="javascript:;" id="checkEmail" class="btn btn-info" style="margin-left: 30px">检测邮箱是否可用</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class=" control-label x100">所在地：</label>
                        <div id="address" style="display: inline-block">
                            <select class="ui-btn form-control" data-role="none" name="province" id="province"> </select>
                            <select class="ui-btn form-control" data-role="none" name="city" id="city"> </select>
                            <select class="ui-btn form-control" data-role="none" name="area" id="area"> </select>
                            <input type="hidden" name="province">
                            <input type="hidden" name="city">
                            <input type="hidden" name="area">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">性别：</label>
                        <select data-toggle="selectpicker" data-width="100" name="sex">
                            <option value="0" <c:if test="${user.sex==0}">selected</c:if>>男</option>
                            <option value="1" <c:if test="${user.sex==1}">selected</c:if>>女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">手机：</label>
                        <input type="text" name="phone" value="${user.phone}" size="30" data-rule="mobile">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">QQ：</label>
                        <input type="text" name="qq" value="${user.qq}" size="30" data-rule="qq">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">生日：</label>
                        <input type="text" name="birthday" value="${user.birthday}" data-toggle="datepicker" placeholder="点击选择日期" data-rule="date">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">头像：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="fileInput-custom"
                                 data-toggle="upload"
                                 data-uploader="${pageContext.request.contextPath}/admin/User/upload"
                                 data-file-size-limit="1024000000"
                                 data-button-text="选择上传头像"
                                 data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                 data-multi="false"
                                 data-on-upload-success="doc_upload_success"
                                 data-icon="cloud-upload">
                            </div>
                            <%--<input type="hidden" name="avatarSrc" value="${user.avatarSrc}" id="j_custom_pic">--%>
                            <%--<span id="doc_span_pic" style="margin-top: 10px;">--%>
                               <%--<c:if test="${user.avatarSrc!=null&&!user.avatarSrc.equals('')}">--%>
                                   <%----%>
                               <%--</c:if>--%>
                           <%--</span>--%>
                        </div>
                        <div id="pic_uploaded">
                            <c:if test="${user.avatarSrc!=null&&!user.avatarSrc.equals('')}">
                                <input type="hidden" name="avatarSrc" value="${user.avatarSrc}">
                                <img src="${pageContext.request.contextPath}/${user.avatarSrc}" style="width: 40%;margin-left: 20%">
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">个人描述：</label>
                        <textarea name="selfDesc" value="${user.selfDesc}" cols="60" rows="5">${user.selfDesc}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">状态：</label>
                        <input type="radio" name="status" data-toggle="icheck" data-label="正常" value="0" <c:if test="${user.status==0}">checked</c:if>/>
                        <input type="radio" name="status" data-toggle="icheck" data-label="锁定" value="1" <c:if test="${user.status==1}">checked</c:if>/>
                        <input type="radio" name="status" data-toggle="icheck" data-label="删除" value="-1" <c:if test="${user.status==-1}">checked</c:if>/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
        <li><button type="button" class="btn-default" data-icon="save" id="saveBtn">保存</button></li>
    </ul>
</div>
<script>
    var contextPath = "${pageContext.request.contextPath}";
    $("#checkEmail").on("click",function () {
        var regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        if(regEmail.test($('#email').val())){
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}"+"/admin/User/checkEmail",
                dataType:"json",
                data:{
                    email:$("#email").val(),
                    id:$('input[name=id]').val()
                },

                success:function (data) {
                    $(this).bjuiajax('ajaxDone',data);
                },
                error:function (data) {
                    alert("函数访问失败");
                }
            })
        }

    });

    /*省市区三级联动*/
    var oldProvince="${user.province}";
    var oldCity="${user.city}";
    var oldArea="${user.area}";
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

    /*用户头像上传*/
    function doc_upload_success(file, data) {
        var json = $.parseJSON(data);
        $(this).bjuiajax('ajaxDone', json);
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#pic_uploaded').html('<img src="${pageContext.request.contextPath}/'+ json.filepath +
                    '"  style="width: 40%;margin:10px 0 10px 105px;display:block;border:1px solid #ccc"> ' +
                    '<input type="hidden" name="avatarSrc" value="'+json.filepath+'">');
        }
    }

    /*手动提交表单*/
    $('#saveBtn').click(function () {
        $('#userForm input[name=province]').val($('#province option:selected').text());
        $('#userForm input[name=city]').val($('#city option:selected').text());
        $('#userForm input[name=area]').val($('#area option:selected').text());

        $('#userForm').submit();
    })

</script>


