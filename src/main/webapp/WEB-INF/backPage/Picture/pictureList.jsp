<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/2/27
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${pageContext.request.contextPath}/Picture/pictureList" method="post">
        <input type="hidden" name="pageSize" value="${pictureList.size}">
        <input type="hidden" name="pageCurrent" value="${pictureList.number+1}">
        <input type="hidden" name="type" value="${param.type}">
        <input type="hidden" name="parentId" value="${param.parentId}">
        <div class="bjui-searchBar">
            <label>图片名：</label><input type="text" name="name" value="${name}" class="form-control" size="10" />
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <div class="btn-group">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/Picture/add?type=${type}&parentId=${parentId}"
                       data-toggle="dialog" data-width="600" data-height="400" data-id="pictureDialog2" data-mask="true"
                       style="text-decoration: none;"><i class="fa fa-plus"></i> 添加图片</a>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="bjui-pageContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
        <tr>
            <th>id</th>
            <th>图片名称</th>
            <th width="200px">描述信息</th>
            <th>图片</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="listItem" items="${pictureList.content}">
            <tr>
                <td>${listItem.id}</td>
                <td>${listItem.name}</td>
                <td width="200px">${listItem.description}</td>
                <td><img src="${pageContext.request.contextPath}/${listItem.source}" width="80" /></td>
                <td>
                    <a href="${pageContext.request.contextPath}/Picture/add?id=${listItem.id}&type=${type}&parentId=${parentId}" class="btn btn-default" data-toggle="dialog" data-width="600" data-height="400" data-id="pictureDialog2" data-mask="true">编辑</a>
                    <a href="${pageContext.request.contextPath}/Picture/delete?id=${listItem.id}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
                </td>
            </tr>
        </c:forEach>


        <c:if test="${pictureList==null}">
            <tr><td colspan="6" style="text-align: center;color: red;font-size: 14px">没有要显示的数据</td></tr>
        </c:if>
        </tbody>
    </table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="30" <c:if test="${pictureList.size==30}">selected</c:if>>30</option>
                <option value="50" <c:if test="${pictureList.size==50}">selected</c:if>>50</option>
                <option value="100" <c:if test="${pictureList.size==100}">selected</c:if>>100</option>
                <option value="150" <c:if test="${pictureList.size==150}">selected</c:if>>150</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${pictureList.totalElements} <c:if test="${pictureList==null}">0</c:if>条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pictureList.totalElements}" data-page-size="${pictureList.size}" data-page-current="${pictureList.number+1}">
    </div>
</div>