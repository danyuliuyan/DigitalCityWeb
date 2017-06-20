<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/6/19
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${pageContext.request.contextPath}/Art/musicList" method="post">
        <input type="hidden" name="pageSize" value="${musicList.size}">
        <input type="hidden" name="pageCurrent" value="${musicList.number+1}">
        <div class="bjui-searchBar">
            <label>歌曲名：</label><input type="text" name="name" value="${name}" class="form-control" size="10" />
            <label>歌手名：</label><input type="text" name="singer" value="${singer}" class="form-control" size="10" />
            <label>状态：</label>
            <select data-toggle="selectpicker" name="status" class="selectpicker" data-width="100">
                <option value="" <c:if test="${status!=0&&status!=1}">selected</c:if>>全部</option>
                <option value="0" <c:if test="${status==0}">selected</c:if>>隐藏</option>
                <option value="1" <c:if test="${status==1}">selected</c:if>>显示</option>
            </select>
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <div class="btn-group">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/Art/addMusic"
                       data-toggle="dialog" data-width="600" data-height="400" data-id="musicDialog" data-mask="true"
                       style="text-decoration: none;"><i class="fa fa-plus"></i>添加音乐</a>
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
            <th>歌曲名</th>
            <th>歌手名</th>
            <th>歌曲地址</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="listItem" items="${musicList.content}">
            <tr>
                <td>${listItem.id}</td>
                <td>${listItem.name}</td>
                <td>${listItem.singer}</td>
                <td>${listItem.source}</td>
                <td><c:if test="${listItem.status==0}">隐藏</c:if><c:if test="${listItem.status==1}">显示</c:if></td>
                <td>
                    <a href="${pageContext.request.contextPath}/Art/addMusic?id=${listItem.id}" class="btn btn-default" data-toggle="dialog" data-width="600" data-height="400" data-id="musicDialog" data-mask="true">编辑</a>
                    <a href="${pageContext.request.contextPath}/Art/deleteMusic?id=${listItem.id}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
                </td>
            </tr>
        </c:forEach>


        <c:if test="${musicList==null}">
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
                <option value="30" <c:if test="${musicList.size==30}">selected</c:if>>30</option>
                <option value="50" <c:if test="${musicList.size==50}">selected</c:if>>50</option>
                <option value="100" <c:if test="${musicList.size==100}">selected</c:if>>100</option>
                <option value="150" <c:if test="${musicList.size==150}">selected</c:if>>150</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${musicList.totalElements} <c:if test="${musicList==null}">0</c:if>条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${musicList.totalElements}" data-page-size="${musicList.size}" data-page-current="${musicList.number+1}">
    </div>
</div>