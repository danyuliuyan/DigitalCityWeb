<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/2/21
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${pageContext.request.contextPath}/University/universityList" method="post">
        <input type="hidden" name="pageSize" value="${universityList.size}">
        <input type="hidden" name="pageCurrent" value="${universityList.number+1}">
        <%--<input type="hidden" name="orderField" value="{$Think.session.orderField}">--%>
        <%--<input type="hidden" name="orderDirection" value="{$Think.session.orderDirection}">--%>
        <div class="bjui-searchBar">
            <label>高校名称：</label><input type="text" name="name" value="${name}" class="form-control" size="10" />
            <label>状态：</label>
            <select data-toggle="selectpicker" name="status" class="selectpicker" data-width="100">
                <option value="" <c:if test="${param.status!=0&&param.status!=1&&param.status!=-1}">selected</c:if>>全部</option>
                <option value="0" <c:if test="${param.status==0}">selected</c:if>>正常</option>
                <option value="-1" <c:if test="${param.status==-1}">selected</c:if>>删除</option>
            </select>
            <%--<input type="hidden" name="search[type]" value="<php>echo $search['type'] ? $search['type'] : I('get.type')</php>">--%>
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <div class="btn-group">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/University/add" data-toggle="dialog" data-width="900" data-height="600" data-id="universityDialog" data-mask="true" style="text-decoration: none;"><i class="fa fa-plus"></i> 新增高校</a>
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
            <th>高校名称</th>
            <th>坐标经度</th>
            <th>坐标纬度</th>
            <th width="200px">基本介绍</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="listItem" items="${universityList.content}">
            <tr>
                <td>${listItem.id}</td>
                <td>${listItem.name}</td>
                <td>${listItem.longitude}</td>
                <td>${listItem.latitude}</td>
                <td width="200px">${listItem.introduction}</td>
                <td><c:if test="${listItem.status==0}">正常</c:if><c:if test="${listItem.status==-1}">删除</c:if></td>
                <td>
                    <a href="${pageContext.request.contextPath}/University/add?id=${listItem.id}" class="btn btn-default" data-toggle="dialog" data-width="900" data-height="600" data-id="universityDialog" data-mask="true">编辑</a>
                    <a href="${pageContext.request.contextPath}/University/delete?id=${listItem.id}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
                </td>
            </tr>
        </c:forEach>


        <c:if test="${universityList==null}">
            <tr><td colspan="7" style="text-align: center;color: red;font-size: 14px">没有要显示的数据</td></tr>
        </c:if>
        </tbody>
    </table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="5" <c:if test="${universityList.size==5}">selected</c:if>>5</option>
                <option value="10" <c:if test="${universityList.size==10}">selected</c:if>>10</option>
                <option value="20" <c:if test="${universityList.size==20}">selected</c:if>>20</option>
                <option value="50" <c:if test="${universityList.size==50}">selected</c:if>>50</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${universityList.totalElements} <c:if test="${universityList==null}">0</c:if>条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${universityList.totalElements}" data-page-size="${universityList.size}" data-page-current="${universityList.number+1}">
    </div>
</div>