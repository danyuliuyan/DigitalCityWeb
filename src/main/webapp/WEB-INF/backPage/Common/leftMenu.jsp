<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="bjui-leftside">
    <div id="bjui-sidebar-s">
        <div class="collapse"></div>
    </div>
    <div id="bjui-sidebar">
        <div class="toggleCollapse"><h2><i class="fa fa-bars"></i> 导航栏 <i class="fa fa-bars"></i></h2><a href="javascript:;" class="lock"><i class="fa fa-lock"></i></a></div>
        <div class="panel-group panel-main" data-toggle="accordion" id="bjui-accordionmenu" data-heightbox="#bjui-sidebar" data-offsety="26">

            <%--管理员列表 start--%>
            <div class="panel panel-default">
                <div class="panel-heading panelContent">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#bjui-accordionmenu" href="#bjui-collapse1" class=""><i class="fa fa-caret-square-o-down"></i>&nbsp;业务管理</a></h4>
                </div>
                <div id="bjui-collapse1" class="panel-collapse panelContent collapse in">
                    <div class="panel-body" >
                        <ul id="bjui-tree1" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true">
<%--                            <li data-id="university" data-pid="1">大学之城</li>
                            <li data-id="university_0" data-pid="university" data-url="<%=request.getContextPath()%>/University/universityList" data-tabid="university_0" data-fresh="true" data-reloadWarn="true">高校列表</li>
                            <li data-id="museum" data-pid="1">博物馆之城</li>
                            <li data-id="museum_0" data-pid="museum" data-url="<%=request.getContextPath()%>/Museum/museumList" data-tabid="museum_0" data-fresh="true" data-reloadWarn="true">博物馆列表</li>--%>
                            <li data-id="art" data-pid="1">虚拟乐器及乐器管理</li>
                            <li data-id="art_0" data-pid="art" data-url="<%=request.getContextPath()%>/Art/instrumentList" data-tabid="art_0" data-fresh="true" data-reloadWarn="true">乐器列表</li>
                            <li data-id="art_1" data-pid="art" data-url="<%=request.getContextPath()%>/Art/musicList" data-tabid="art_1" data-fresh="true" data-reloadWarn="true">试听音乐列表</li>
                            <%--<li data-id="innovate" data-pid="1">创新之城</li>
                            <li data-id="innovate_0" data-pid="innovate" data-url="<%=request.getContextPath()%>/Innovate/organizationList" data-tabid="innovate_0" data-fresh="true" data-reloadWarn="true">单位列表</li>
                            <li data-id="innovate_1" data-pid="innovate" data-url="<%=request.getContextPath()%>/Innovate/articleList" data-tabid="innovate_1" data-fresh="true" data-reloadWarn="true">博文列表</li>--%>
                        </ul>
                    </div>
                </div>
                <div class="panelFooter"><div class="panelFooterContent"></div></div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading panelContent">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#bjui-accordionmenu" href="#bjui-collapse2" class=""><i class="fa fa-caret-square-o-down"></i>&nbsp;用户管理</a></h4>
                </div>
                <div id="bjui-collapse2" class="panel-collapse panelContent collapse">
                    <div class="panel-body" >
                        <ul id="bjui-tree2" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true">
                            <li data-id="user" data-pid="2">普通用户</li>
                            <li data-id="user_0" data-pid="user" data-url="<%=request.getContextPath()%>/admin/User/userList" data-tabid="user_0" data-fresh="true" data-reloadWarn="true">用户列表</li>
                        </ul>
                    </div>
                </div>
                <div class="panelFooter"><div class="panelFooterContent"></div></div>
            </div>
        </div>
    </div>
</div>