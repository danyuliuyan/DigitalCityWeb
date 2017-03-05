<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/3/2
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/Art/addInstrument" data-toggle="validate" data-reload-navtab="true" method="post">
        <input type="hidden" name="id" value="${instrument.id}" id="id">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">乐器名称：</label>
                        <input type="text" name="name" value="${instrument.name}" data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">状态：</label>
                        <input type="radio" name="status" data-toggle="icheck" data-label="正常" value="0" <c:if test="${instrument.status==0}">checked</c:if>/>
                        <input type="radio" name="status" data-toggle="icheck" data-label="删除" value="-1" <c:if test="${instrument.status==-1}">checked</c:if>/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">缩略图：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="fileInput-thumb"
                                 data-toggle="upload"
                                 data-uploader="${pageContext.request.contextPath}/Art/upload?type=thumb"
                                 data-file-size-limit="1024000000"
                                 data-button-text="选择上传图片"
                                 data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                 data-multi="false"
                                 data-on-upload-success="thumb_upload_success"
                                 data-icon="cloud-upload">
                            </div>
                        </div>
                        <div id="thumb_uploaded">
                            <c:if test="${instrument.thumb!=null&&!instrument.thumb.equals('')}">
                                <input type="hidden" name="thumb" value="${instrument.thumb}">
                                <img src="${pageContext.request.contextPath}/${instrument.thumb}" style="width: 40%;margin-left: 20%">
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">详情图：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="fileInput-detail"
                                 data-toggle="upload"
                                 data-uploader="${pageContext.request.contextPath}/Art/upload?type=detail"
                                 data-file-size-limit="1024000000"
                                 data-button-text="选择上传图片"
                                 data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                 data-multi="false"
                                 data-on-upload-success="detail_upload_success"
                                 data-icon="cloud-upload">
                            </div>
                        </div>
                        <div id="detailPic_uploaded">
                            <c:if test="${instrument.detailPicture!=null&&!instrument.detailPicture.equals('')}">
                                <input type="hidden" name="detailPicture" value="${instrument.detailPicture}">
                                <img src="${pageContext.request.contextPath}/${instrument.detailPicture}" style="width: 40%;margin-left: 20%">
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">描述信息：</label>
                        <textarea name="description" value="${instrument.description}" cols="60" rows="5">${instrument.description}</textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <label class="control-label x120">上传压缩包：</label>
                        <div id="fileInput-zip"
                             data-toggle="upload"
                             data-uploader="${pageContext.request.contextPath}/Art/uploadZip"
                             <%--data-form-data={}--%>
                             data-file-size-limit="1024000000"
                             data-button-text="选择上传压缩包"
                             data-file-type-exts="*.zip;"
                             data-multi="false"
                             data-on-upload-success="zip_upload_success"
                             data-icon="cloud-upload" style="display: inline-block">
                        </div>
                        <input id="zipFilePath" type="hidden" name="zipFilePath" value="">
                        <input type="text" name="directoryName" value="${instrument.directoryName}" size="30" data-rule="required;directory" data-rule-directory="[/^[A-Za-z0-9]{2,16}$/, '目录名由字母和数字组成，2到16个字符']" placeholder="请先输入压缩包保存的目录名" data-tip="目录名只能包含字母和数字，2-16个字符">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120"></label>
                        <div style="display: inline-block;padding: 20px;line-height: 24px;margin:20px 0;border: 2px dashed #1F73B6">
                            <span style="font-size: 20px">压缩包上传说明</span><br>
                            1. 压缩包上传后将自动生成乐器主页访问地址： <code>/目录名/index.html；  </code><br>
                            2. 请保证压缩包解压后 <code>index.html</code> 文件位于一级目录下；<br>
                            3. 点击“选择上传压缩包”按钮后，请稍等3-5秒，将打开文件选择弹窗。
                        </div>
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
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>

<script>
    function thumb_upload_success(file, data) {
        var json = $.parseJSON(data);
        $(this).bjuiajax('ajaxDone', json);
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#thumb_uploaded').html('<img src="${pageContext.request.contextPath}/'+ json.filepath +
                    '"  style="width: 40%;margin:10px 0 10px 105px;display:block;border:1px solid #ccc"> ' +
                    '<input type="hidden" name="thumb" value="'+json.filepath+'">');
        }
    }

    function detail_upload_success(file, data) {
        var json = $.parseJSON(data);
        $(this).bjuiajax('ajaxDone', json);
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#detailPic_uploaded').html('<img src="${pageContext.request.contextPath}/'+ json.filepath +
                    '"  style="width: 40%;margin:10px 0 10px 105px;display:block;border:1px solid #ccc"> ' +
                    '<input type="hidden" name="detailPicture" value="'+json.filepath+'">');
        }
    }

    /*压缩文件上传按钮点击事件*/
    $('#fileInput-zip').click(function () {
        var directoryName = $('input[name=directoryName]').val();

        if(directoryName==""||directoryName==null){
            $(this).alertmsg('error', '上传压缩文件前，请先输入压缩文件的保存目录');
            return false;
        }else{
//            var fromData={"directoryName":directoryName};
//            console.log(formData);
//            console.log(typeof($(this).attr('data-form-data')));
//            $(this).find("attr","data-form-data").val(formData);
//            console.log($(this).find("attr","data-form-data").val(formData));
        }
    });

    function zip_upload_success(file, data) {
        var json = $.parseJSON(data);
        $(this).bjuiajax('ajaxDone', json);
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $(this).alertmsg('success','压缩包上传成功');
            $("#zipFilePath").val(json.filepath);
        }
    }


</script>