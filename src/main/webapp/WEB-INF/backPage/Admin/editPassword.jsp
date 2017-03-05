<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 16/11/17
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/admin/Admin/editPassword" data-toggle="validate" method="post">
        <input type="hidden" name="id" value="${admin.id}">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%" >
                <thead>

                </thead>
                <tbody>
                    <tr >
                        <td colspan="2">
                            <label class="control-label x100">用户名：</label>
                            <input type="text" data-rule="required" name="username" placeholder="${admin.username}" value="${admin.username}" size="20" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">原密码：</label>
                            <input type="password" data-rule="原密码:required" name="passwordOld" value="" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">新密码：</label>
                            <input type="password" data-rule="新密码:required" name="passwordNew" value="" size="60">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label class="control-label x100">确认密码：</label>
                            <input type="password" data-rule="确认密码:required;match(passwordNew)" value="" size="60">
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