<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/6/26
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/Innovate/addArticle" data-toggle="validate" data-reload-navtab="true" method="post">
        <input type="hidden" name="id" value="${article.id}" id="id">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">博文名称：</label>
                        <input type="text" name="name" value="${article.name}" size="20">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">博文链接：</label>
                        <input type="text" name="link" value="${article.link}" size="40">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">状态：</label>
                        <select data-toggle="selectpicker" data-width="100" name="status">
                            <option value="1" <c:if test="${article.status==1}">selected</c:if>>显示</option>
                            <option value="0" <c:if test="${article.status==0}">selected</c:if>>隐藏</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="control-label x120">所属组织：</label>
                        <select data-toggle="selectpicker" data-width="100" name="organizationId">
                            <c:forEach var="organizationItem" items="${organizationList}">
                                <option value="${organizationItem.id}" <c:if test="${article.organizationId==organizationItem.id}">selected</c:if>>${organizationItem.name}</option>
                            </c:forEach>
                        </select>
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