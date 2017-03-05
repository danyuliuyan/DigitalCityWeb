<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/2/27
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/Picture/add" data-toggle="validate" data-reload-navtab="true" method="post">
        <input type="hidden" name="id" value="${picture.id}" id="id">
        <input type="hidden" name="type" value="${type}" id="type">
        <input type="hidden" name="parentId" value="${parentId}" id="parentId">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">图片名称：</label>
                        <input type="text" name="name" value="${picture.name}" size="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">描述信息：</label>
                        <textarea name="description" value="${picture.description}" cols="30" rows="5">${picture.description}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">图片：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="fileInput-custom"
                                 data-toggle="upload"
                                 data-uploader="${pageContext.request.contextPath}/Picture/upload?type=${type}"
                                 data-file-size-limit="1024000000"
                                 data-button-text="选择上传图片"
                                 data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                 data-multi="false"
                                 data-on-upload-success="doc_upload_success"
                                 data-icon="cloud-upload">
                            </div>
                        </div>
                        <div id="pic_uploaded">
                            <c:if test="${picture.source!=null&&!picture.source.equals('')}">
                                <input type="hidden" name="source" value="${picture.source}">
                                <img src="${pageContext.request.contextPath}/${picture.source}" style="width: 40%;margin-left: 20%">
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
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#pic_uploaded').html('<img src="${pageContext.request.contextPath}/'+ json.filepath +
                    '"  style="width: 40%;margin:10px 0 10px 105px;display:block;border:1px solid #ccc"> ' +
                    '<input type="hidden" name="source" value="'+json.filepath+'">');
        }
    }
</script>