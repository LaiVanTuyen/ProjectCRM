<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api/v1/task"/>
<c:url var="Taskurl" value="/admin/task"/>
<html>
<head>
    <title>List Task</title>
</head>
<body>
<!-- Header Layout Content -->
<div class="container page__heading-container">
    <div class="page__heading">
        <div class="d-flex align-items-center">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a  href='/admin/home'>Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            List Task</li>
                    </ol>
                </nav>

            </div>
            <div class="ml-auto">
                <a href="" class="btn btn-light"><i
                        class="material-icons icon-16pt text-muted mr-1">settings</i>
                    Settings</a>
            </div>
        </div>
    </div>
</div>
<div class="container page__container">
    <!-- Page Content -->
    <div class="iq-card-header d-flex justify-content-between">
        <div class="iq-header-title">
            <h5 class="card-header">List Of Task</h5>
        </div>
        <c:if test="${not empty messageResponse }">
            <div class="alert alert-${alert}" >
                    ${messageResponse}
            </div>
        </c:if>
    </div>
    <div class="row justify-content-between">
        <div class="col-sm-12 col-md-3">
            <form class="mr-3 position-relative">
                <div class="form-group mb-0">
                    <input type="search"  value="<%= request.getParameter("keyword")!=null ? request.getParameter("keyword"): "" %>" class="form-control" name="keyword" id="exampleInputSearch" placeholder="Search" aria-controls="user-list-table">
                    <input type="hidden" name="page" value="1">
                    <input type="hidden" name="maxPageItem" value="10">
                    <input type="hidden" name="sortName" value="name">
                    <input type="hidden" name="sortBy" value="asc">
                    <input type="hidden" name="type" value="list">
                </div>
            </form>
        </div>
        <div class="col-sm-12 col-md-2">
            <div class="form-group mb-0">

                <a class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add" href="/admin/task?type=edit"><i class='fa fa-user-plus'></i></a>
                <button type="button" class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" id="btnDelete" style="border: 0" ><i class='fa fa-trash'></i></button>
            </div>
        </div>
    </div>
    <div class="card card-form">
        <div class="row no-gutters">
            <div class="col-lg-8 card-form__body border-left"
                 style="flex: 100%; max-width: 100%">
                <div class="table-responsive border-bottom" data-toggle="lists"
                     data-lists-values='["js-lists-values-employee-name"]'>
                    <table class="table mb-0 thead-border-top-0">
                        <thead>
                        <tr>
                            <th class="hidden" style="width: 15px;">
                                <input type="checkbox" id="checkAll"   />
                            </th>
                            <th>Name</th>
                            <th>Descriptions</th>
                            <th>Project</th>
                            <th>Status</th>
                            <th>User</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody class="list" id="staff">
                        <c:forEach var="item" items="${taskModel.listResult}">
                            <tr class="selected">
                                <td class="center">
                                    <input type="checkbox"  id="checkbox_${item.id}" value="${item.id}"/>
                                </td>
                                <td>${item.name}</td>
                                <td>${item.descriptions}</td>
                                <c:forEach var="items" items="${projectModel}">
                                    <c:if test="${items.id == item.project_id }">
                                        <td><span class="badge badge-pill badge-dark">${items.name}</span></td>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${ item.project_id==''}">
                                    <td><span class="badge badge-pill badge-danger">null</span></td>
                                </c:if>
                                <c:forEach var="items" items="${statusModel}">
                                    <c:if test="${items.id == item.status_id && item.status_id==1}">
                                        <td><span class="badge badge-pill badge-success">${items.name}</span></td>
                                    </c:if>
                                    <c:if test="${items.id == item.status_id && item.status_id==2}">
                                        <td><span class="badge badge-pill badge-danger">${items.name}</span></td>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="items" items="${userModel}">
                                    <c:if test="${items.id == item.user_id }">
                                        <td><span class="badge badge-pill badge-secondary">${items.fullname}</span></td>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${item.user_id==''}">
                                    <td><span class="badge badge-pill badge-danger">null</span></td>
                                </c:if>
                                <td>${item.start_date}</td>
                                <td>${item.end_date}</td>
                                <td>
                                    <c:url var="editURL" value="/admin/task">
                                        <c:param name="type" value="edit"></c:param>
                                        <c:param name="id" value="${item.id}"></c:param>
                                    </c:url>
                                    <a href="${editURL}" style="float:left;margin-bottom:4px;">
                                        <input type="hidden" name="id" value="${item.id}"></input>
                                        <button type="submit" class="btn btn-warning">
                                            <i class="material-icons">settings</i>
                                        </button>
                                    </a>
                                    <form action='/admin/project' method="delete">
                                        <input type="text" value="${item.id}" name="projectName" hidden >
                                        <button type="submit" class="btn btn-danger">
                                            <i class="material-icons">close</i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation" style="margin-top: auto;margin-left: auto;margin-right: auto;">
                        <ul class="pagination">
                            <c:if test="${taskModel.page>1}">
                                <li class="page-item ">
                                    <a class="page-link" href="/admin/task?type=list&keyword=<%= request.getParameter("keyword") %>&page=${model.page-1}&maxPageItem=10&sortName=name&sortBy=desc" >Previous</a>
                                </li>
                            </c:if>
                            <c:forEach var="page" begin="1" end="${taskModel.totalPage}">
                                <c:choose>
                                    <c:when test="${page==taskModel.page}">
                                        <li class="page-item active"><a class="page-link" href="/admin/task?type=list&keyword=<%= request.getParameter("keyword") %>&page=${page}&maxPageItem=10&sortName=name&sortBy=desc">${page}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="/admin/task?type=list&keyword=<%= request.getParameter("keyword") %>&page=${page}&maxPageItem=10&sortName=name&sortBy=desc">${page}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${model.page<taskModel.totalPage}">
                                <li class="page-item">
                                    <a class="page-link" href="/admin/task?type=list&keyword=<%= request.getParameter("keyword") %>&page=${model.page+1}&maxPageItem=10&sortName=name&sortBy=desc" >Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                    <input type="hidden" value="list" id="type" name="type"/>
                </div>
            </div>
        </div>
    </div>
    <!-- Sign Up Modal -->
<%--    <div id="modal-signup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">--%>
<%--        <div class="modal-dialog modal-dialog-centered">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-body">--%>
<%--                    <div class="px-3">--%>
<%--                        <div class="d-flex justify-content-center mt-2 mb-4 navbar-light">--%>
<%--                            <a href="dashboard.html" class="navbar-brand" style="min-width: 0">--%>
<%--                                <img class="navbar-brand-icon" src="assets/images/logo.png" width="250" alt="Cybersoft">--%>
<%--                            </a>--%>
<%--                        </div>--%>

<%--                        <form action='<c:url value="<%=UrlConst.TASKUPDATE%>"></c:url>' method="post" novalidate>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="username">Task name:</label>--%>
<%--                                <select  name="taskName" style="padding: 5px; border-radius: 0.25rem;border: solid; border-color: cadetblue;">--%>
<%--                                    <optgroup label="Task name">--%>
<%--                                        <c:forEach var="tasks" items="${tasks}">--%>
<%--                                            <option>${tasks.name}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </optgroup>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="start_date">Start Date:</label>--%>
<%--                                <input id="dateRangePickerSample01" name="start_day" type="text" class="form-control"--%>
<%--                                       placeholder="Date example" data-toggle="daterangepicker" data-daterangepicker-drops="up"--%>
<%--                                       data-daterangepicker-start-date="2021/03/06" data-daterangepicker-single-date-picker="true">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="end_date">End Date:</label>--%>
<%--                                <input id="dateRangePickerSample01" name="end_day" type="text" class="form-control"--%>
<%--                                       placeholder="Date example" data-toggle="daterangepicker" data-daterangepicker-drops="up"--%>
<%--                                       data-daterangepicker-start-date="2021/03/06" data-daterangepicker-single-date-picker="true">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label style="position: relative;">Finished <input style="position: absolute;top:5px;left: 70px;" type="radio" name="status" value ="1" checked></label><br>--%>
<%--                                <label style="position: relative;">Unfinished <input style="position: absolute;top:5px;left: 85px;" type="radio" name="status" value ="2" checked></label><br>--%>
<%--                            </div>--%>
<%--                            <div class="form-group text-center">--%>
<%--                                <button type="button" class="btn btn-light" data-dismiss="modal" style="float:left;margin-right:10px">Close</button>--%>
<%--                                <button class="btn btn-primary" type="submit">Update</button>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- // END .modal-body -->--%>
<%--            </div>--%>
<%--            <!-- // END .modal-content -->--%>
<%--        </div>--%>
<%--        <!-- // END .modal-dialog -->--%>
<%--    </div>--%>
    <!-- // END .modal -->

    <script>
        $("#btnDelete").click(function (e) {
            var data ={};
            var ids = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            data['ids']=ids;
            deleteUser(data);
        });
        function deleteUser(data){
            $.ajax({
                url:'${APIurl}',
                type:'DELETE',
                contentType:'application/json',
                data:JSON.stringify(data),
                dataType:'json',
                success:function(result){
                    window.location.href = "${Taskurl}?type=list&keyword=&page=1&maxPageItem=10&message=DeleteSuccess";
                },
                error:function(result){
                    window.location.href = "${Taskurl}?type=list&keyword=&page=1&maxPageItem=10&message=DeleteError";
                }
            });
        }
    </script>
</div>
</body>
</html>
