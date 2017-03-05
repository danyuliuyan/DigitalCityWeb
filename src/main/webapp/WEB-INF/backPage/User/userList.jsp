<%--
  Created by IntelliJ IDEA.
  User: dushang
  Date: 17/1/15
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${pageContext.request.contextPath}/admin/User/userList" method="post">
        <input type="hidden" name="pageSize" value="${userList.size}">
        <input type="hidden" name="pageCurrent" value="${userList.number+1}">
        <%--<input type="hidden" name="orderField" value="{$Think.session.orderField}">--%>
        <%--<input type="hidden" name="orderDirection" value="{$Think.session.orderDirection}">--%>
        <div class="bjui-searchBar">
            <label>用户名：</label><input type="text" name="username" value="${username}" class="form-control" size="10" />
            <label>邮箱：</label><input type="text" name="email" value="${email}" class="form-control" size="10" />
            <label>手机：</label><input type="text" name="phone" value="${phone}" class="form-control" size="10" />
            <label>QQ：</label><input type="text" name="qq" value="${qq}" class="form-control" size="10" />
            <label>性别：</label>
            <select data-toggle="selectpicker" name="sex" class="selectpicker" data-width="100">
                <option value="" <c:if test="${sex!=0&&sex!=1}">selected</c:if>>全部</option>
                <option value="0" <c:if test="${sex==0}">selected</c:if>>男</option>
                <option value="1" <c:if test="${sex==1}">selected</c:if>>女</option>
            </select>
            <label>状态：</label>
            <select data-toggle="selectpicker" name="status" class="selectpicker" data-width="100">
                <option value="" <c:if test="${status!=0&&status!=1&&status!=-1}">selected</c:if>>全部</option>
                <option value="0" <c:if test="${status==0}">selected</c:if>>正常</option>
                <option value="1" <c:if test="${status==1}">selected</c:if>>锁定</option>
                <option value="-1" <c:if test="${status==-1}">selected</c:if>>删除</option>
            </select>
            <%--<input type="hidden" name="search[type]" value="<php>echo $search['type'] ? $search['type'] : I('get.type')</php>">--%>
            <button type="submit" class="btn-default" data-icon="search">查询</button>
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <div class="btn-group">
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/User/add" data-toggle="dialog" data-width="900" data-height="600" data-id="dialog-mask" data-mask="true" style="text-decoration: none;"><i class="fa fa-plus"></i> 新增用户</a>
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
            <th>用户名</th>
            <th>邮箱</th>
            <th>省</th>
            <th>市</th>
            <th>区/县</th>
            <th>性别</th>
            <th>生日</th>
            <th>手机</th>
            <th>QQ</th>
            <th>个人描述</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="listItem" items="${userList.content}">
            <tr>
                <td>${listItem.id}</td>
                <td>${listItem.username}</td>
                <td>${listItem.email}</td>
                <td>${listItem.province}</td>
                <td>${listItem.city}</td>
                <td>${listItem.area}</td>
                <td><c:if test="${listItem.sex==0}">男</c:if><c:if test="${listItem.sex==1}">女</c:if></td>
                <td>${listItem.birthday}</td>
                <td>${listItem.phone}</td>
                <td>${listItem.qq}</td>
                <td>${listItem.selfDesc}</td>
                <td><c:if test="${listItem.status==0}">正常</c:if><c:if test="${listItem.status==1}">锁定</c:if><c:if test="${listItem.status==-1}">删除</c:if></td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/User/add?id=${listItem.id}" class="btn btn-default" data-toggle="dialog" data-width="900" data-height="600" data-id="dialog-mask" data-mask="true">编辑</a>
                    <a href="${pageContext.request.contextPath}/admin/User/setPassword?id=${listItem.id}" class="btn btn-default" data-toggle="dialog" data-width="900" data-height="600" data-id="dialog-mask" data-mask="true">设置密码</a>
                    <a href="${pageContext.request.contextPath}/admin/User/delete?id=${listItem.id}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除吗？">删除</a>
                </td>
            </tr>
        </c:forEach>

        <%--用户列表为空时--%>
        <c:if test="${userList==null}">
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
                <option value="5" <c:if test="${userList.size==5}">selected</c:if>>5</option>
                <option value="10" <c:if test="${userList.size==10}">selected</c:if>>10</option>
                <option value="20" <c:if test="${userList.size==20}">selected</c:if>>20</option>
                <option value="50" <c:if test="${userList.size==50}">selected</c:if>>50</option>

            </select>
        </div>
        <span>&nbsp;条，共 ${userList.totalElements} <c:if test="${userList==null}">0</c:if>条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${userList.totalElements}" data-page-size="${userList.size}" data-page-current="${userList.number+1}">
    </div>
</div>