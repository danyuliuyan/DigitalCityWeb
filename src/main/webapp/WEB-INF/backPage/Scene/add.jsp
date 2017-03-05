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
    <form action="${pageContext.request.contextPath}/Scene/add" data-toggle="validate" data-reload-navtab="true" method="post">
        <input type="hidden" name="id" value="${scene.id}" id="id">
        <input type="hidden" name="type" value="${type}" id="type">
        <input type="hidden" name="parentId" value="${parentId}" id="parentId">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">场景名称：</label>
                        <input type="text" name="name" value="${scene.name}" size="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">描述信息：</label>
                        <textarea name="description" value="${scene.description}" cols="30" rows="5">${scene.description}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">场景地址：</label>
                        <input type="text" name="source" value="${scene.source}" size="20">
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