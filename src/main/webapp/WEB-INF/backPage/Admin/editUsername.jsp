<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 16/11/17
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/admin/Admin/editUsername" data-toggle="validate" method="post">
        <input type="hidden" name="id" value="${admin.id}">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%" >
                <thead>
                </thead>
                <tbody>
                <tr >
                    <td colspan="2" style="width: 50%;">
                        <label class="control-label x70">用户名：</label>
                        <input type="text" data-rule="required" name="username" placeholder="${admin.username}" value="${admin.username}" size="20">
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
