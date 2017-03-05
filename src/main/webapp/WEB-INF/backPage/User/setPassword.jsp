<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/3/1
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/admin/User/setPassword" data-toggle="validate" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%" >
                <thead>

                </thead>
                <tbody>
                <tr >
                    <td colspan="2">
                        <label class="control-label x100">用户名：</label>
                        <input type="text" data-rule="required" name="username" placeholder="${user.username}" value="${user.username}" size="20" disabled>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">密码：</label>
                        <input type="password" data-rule="密码:required;password" data-rule-password="[/^[A-Za-z0-9\x21-\x7e]{6,16}$/, '密码由数字、字母或字符（除空格）组成，6到16个字符']" name="password" value="" size="40">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x100">确认密码：</label>
                        <input type="password" data-rule="确认密码:required;match(password)" value="" size="40">
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