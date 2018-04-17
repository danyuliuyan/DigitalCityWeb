
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${pageContext.request.contextPath}/Art/instrumentList" method="post">
        <input type="hidden" name="pageSize" value="${instrumentList.size}">
        <input type="hidden" name="pageCurrent" value="${instrumentList.number+1}">

        <div class="bjui-searchBar">
            <label>乐器名：</label><input type="text" name="username" value="${name}" class="form-control" size="10" />
            <label>状态：</label>
            <select data-toggle="selectpicker" name="status" class="selectpicker" data-width="100">
                <option value="" <c:if test="${param.status!=0&&param.status!=-1}">selected</c:if>>全部</option>
                <option value="0" <c:if test="${param.status==0}">selected</c:if>>正常</option>
                <option value="-1" <c:if test="${param.status==-1}">selected</c:if>>删除</option>
            </select>
            <%--<input type="hidden" name="search[type]" value="<php>echo $search['type'] ? $search['type'] : I('get.type')</php>">--%>
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <div class="btn-group">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/Art/addInstrument" data-toggle="dialog" data-width="900" data-height="600" data-id="dialog-mask" data-mask="true" style="text-decoration: none;"><i class="fa fa-plus"></i> 新增乐器</a>
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
            <th>乐器名</th>
            <th>缩略图</th>
            <th>详情图</th>
            <th>描述</th>
            <th>目录名</th>
            <th>主页地址</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="listItem" items="${instrumentList.content}">
            <tr>
                <td>${listItem.id}</td>
                <td>${listItem.name}</td>
                <td>
                    <c:if test="${listItem.thumb==null||listItem.thumb.equals(\"\")}">无</c:if>
                    <c:if test="${listItem.thumb!=null&&!listItem.thumb.equals(\"\")}">
                        <img src="${pageContext.request.contextPath}/${listItem.thumb}" width="80" />
                    </c:if>
                </td>
                <td>
                    <c:if test="${listItem.detailPicture==null||listItem.detailPicture.equals(\"\")}">无</c:if>
                    <c:if test="${listItem.detailPicture!=null&&!listItem.detailPicture.equals(\"\")}">
                        <img src="${pageContext.request.contextPath}/${listItem.detailPicture}" width="80" />
                    </c:if>
                </td>
                <td>${listItem.description}</td>
                <td>${listItem.directoryName}</td>
                <td>${listItem.pageSource}</td>
                <td><c:if test="${listItem.status==0}">正常</c:if><c:if test="${listItem.status==-1}">删除</c:if></td>
                <td>
                    <a href="${pageContext.request.contextPath}/Art/addInstrument?id=${listItem.id}" class="btn btn-default" data-toggle="dialog" data-width="900" data-height="600" data-id="dialog-mask" data-mask="true">编辑</a>
                    <a href="${pageContext.request.contextPath}/Art/deleteInstrument?id=${listItem.id}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
                </td>
            </tr>
        </c:forEach>

        <%--用户列表为空时--%>
        <c:if test="${instrumentList==null}">
            <tr><td colspan="13" style="text-align: center;color: red;font-size: 14px">没有要显示的数据</td></tr>
        </c:if>
        </tbody>
    </table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="5" <c:if test="${instrumentList.size==5}">selected</c:if>>5</option>
                <option value="10" <c:if test="${instrumentList.size==10}">selected</c:if>>10</option>
                <option value="20" <c:if test="${instrumentList.size==20}">selected</c:if>>20</option>
                <option value="50" <c:if test="${instrumentList.size==50}">selected</c:if>>50</option>

            </select>
        </div>
        <span>&nbsp;条，共 ${instrumentList.totalElements} <c:if test="${instrumentList==null}">0</c:if>条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${instrumentList.totalElements}" data-page-size="${instrumentList.size}" data-page-current="${userList.number+1}">
    </div>
</div>