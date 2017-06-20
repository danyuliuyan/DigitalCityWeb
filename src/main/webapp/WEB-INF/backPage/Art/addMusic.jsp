<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/6/19
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/Art/addMusic" data-toggle="validate" data-reload-navtab="true" method="post">
        <input type="hidden" name="id" value="${music.id}" id="id">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">歌曲名：</label>
                        <input type="text" name="name" value="${music.name}" size="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">歌手名：</label>
                        <input type="text" name="singer" value="${music.singer}" size="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">状态：</label>
                        <select data-toggle="selectpicker" data-width="100" name="status">
                            <option value="1" <c:if test="${music.status==1}">selected</c:if>>显示</option>
                            <option value="0" <c:if test="${music.status==0}">selected</c:if>>隐藏</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">音频文件：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="fileInput-custom"
                                 data-toggle="upload"
                                 data-uploader="${pageContext.request.contextPath}/Art/uploadMusic"
                                 data-file-size-limit="1024000000"
                                 data-button-text="选择上传音乐"
                                 data-file-type-exts="*.mp3;*.ogg;*.wave;"
                                 data-multi="false"
                                 data-on-upload-success="doc_upload_success"
                                 data-icon="cloud-upload">
                            </div>
                        </div>
                        <div id="music_uploaded" style="padding: 20px;text-align: center">
                            <c:if test="${music.source!=null&&!music.source.equals('')}">
                                <h4>${music.name}</h4>
                                <input type="hidden" name="source" value="${music.source}">
                                <audio src="${pageContext.request.contextPath}/${music.source}" controls></audio>
                            </c:if>
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

    function doc_upload_success(file, data) {
        var json = $.parseJSON(data);
        $(this).bjuiajax('ajaxDone', json);
//        console.log(json);
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#music_uploaded').html('<h4>'+json.filename+'</h4>' +
                    '<audio controls src="${pageContext.request.contextPath}/'+ json.filepath +
                    '"></audio>' +
                    '<input type="hidden" name="source" value="'+json.filepath+'">');
        }
    }
</script>