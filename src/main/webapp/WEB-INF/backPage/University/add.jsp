<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/2/21
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 16/11/7
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/University/add" data-toggle="validate" data-reload-navtab="true" method="post">
        <input type="hidden" name="id" value="${university.id}" id="university">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">大学名称：</label>
                        <input type="text" name="name" value="${university.name}" size="60">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">坐标经度：</label>
                        <input type="text" name="longitude" value="${university.longitude}" size="60">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">坐标纬度：</label>
                        <input type="text" name="latitude" value="${university.latitude}" size="60">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">状态：</label>
                        <input type="radio" name="status" data-toggle="icheck" data-label="正常" value="0" <c:if test="${university.status==0}">checked</c:if>/>
                        <input type="radio" name="status" data-toggle="icheck" data-label="删除" value="-1" <c:if test="${university.status==-1}">checked</c:if>/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">相关图片：</label>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/Picture/pictureList?type=1&parentId=${university.id}" data-toggle="dialog"
                           data-width="800" data-height="500" data-id="pictureDialog1" data-mask="true" style="text-decoration: none;"> 查看/编辑图片列表</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">三维场景：</label>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/Scene/sceneList?type=1&parentId=${university.id}" data-toggle="dialog"
                           data-width="900" data-height="600" data-id="sceneDialog1" data-mask="true" style="text-decoration: none;"> 查看/编辑场景列表</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">基本介绍：<br></label>
                        <div style="display: inline-block;vertical-align: middle;">
                            <p style="width: 700px; color: red">提示：不能在编辑器中插入文件。</p>
                            <textarea name="introduction" style="width:700px;height:50px" data-toggle="kindeditor" >${university.introduction}</textarea>
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