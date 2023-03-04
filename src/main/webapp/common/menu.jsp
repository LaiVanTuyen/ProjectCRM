<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header" class="mdk-header bg-dark js-mdk-header m-0" data-fixed
     data-effects="waterfall">
    <div class="mdk-header__content">
        <div
                class="navbar navbar-expand-sm navbar-main navbar-light bg-light pr-0"
                id="navbar" data-primary>
            <div class="container">
                <!-- Navbar toggler -->

                <button
                        class="navbar-toggler navbar-toggler-right d-block d-md-none"
                        type="button" data-toggle="sidebar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar Brand -->
                <a href='<c:url value="/admin/home"></c:url>' class="navbar-brand"> <img
                        class="navbar-brand-icon" src="/assets/images/CRM.png" height="70"
                        alt="CRM" />
                </a> <span class="mr-3"></span>
                <ul
                        class="nav navbar-nav d-none d-sm-flex border-left navbar-border navbar-height align-items-center">
                    <li class="nav-item dropdown"><a href="#account_menu"
                                                     class="nav-link dropdown-toggle" data-toggle="dropdown"
                                                     data-caret="false"> <span class="avatar avatar-sm"> <span
                            class="avatar-title rounded-circle bg-warning">${USERMODEL.fullname}</span>
						</span>
                    </a>
                        <div id="account_menu" class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-item-text dropdown-item-text--lh">
                                <div>
                                    <strong>${USERMODEL.fullname}</strong>
                                </div>
                                <div>${USERMODEL.email}</div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item active"
                               href='/admin/home'>
                                Homepage </a>
                            <a class="dropdown-item" href="#"> Edit account </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item"
                               href="/login?action=logout" role="button">Logout</a>
                        </div></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="mdk-header-layout__content page">
    <div class="page__header mb-0">
        <div class="container page__container">
            <div
                    class="navbar navbar-secondary navbar-light navbar-expand-sm p-0">
                <button class="navbar-toggler navbar-toggler-right"
                        data-toggle="collapse" data-target="#navbarsExample03"
                        type="button">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="navbar-collapse collapse" id="navbarsExample03">
                    <ul class="nav navbar-nav flex">
                        <li class="nav-item" style="margin-right:10px"><a class="nav-link active"
                                                                          href='/admin/home'> Home</a></li>
                        <li class="nav-item dropdown"><a href="#"
                                                         class="nav-link dropdown-toggle" data-toggle="dropdown" <c:if test="${USERMODEL.role_id==3}">hidden</c:if>>
                            Project </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href='/admin/project?type=list&keyword=&page=1&maxPageItem=10&sortName=name&sortBy=desc'> Project List </a> <a
                                    class="dropdown-item" href='/admin/project?type=edit'> Create Project </a>
                            </div></li>
                        <li class="nav-item dropdown"><a href="#"
                                                         class="nav-link dropdown-toggle" data-toggle="dropdown" <c:if test="${USERMODEL.role_id!=1}">hidden</c:if>> User
                        </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href='/admin/user?type=list&keyword=&page=1&maxPageItem=10&sortName=fullname&sortBy=desc'> User List </a>
                                <a class="dropdown-item" href='/admin/user?type=edit'> Create User </a>
                            </div></li>
                        <li class="nav-item dropdown"><a href="#"
                                                         class="nav-link dropdown-toggle" data-toggle="dropdown">
                            Task </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href='/admin/task?type=list&keyword=&page=1&maxPageItem=10&sortName=name&sortBy=desc'> Task List </a> <a
                                    class="dropdown-item" href='/admin/task?type=edit'> Create Task </a>
                            </div></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
