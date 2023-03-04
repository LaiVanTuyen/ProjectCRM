<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api/v1/user"/>
<c:url var="Userurl" value="/admin/user"/>
<html>
<head>
    <title>List Users</title>
</head>
<body>
<div class="container page__heading-container">
    <div class="page__heading">
        <div class="d-flex align-items-center">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            List Users</li>
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
<div class="container">
    <div class="iq-card-header d-flex justify-content-between">
        <div class="iq-header-title">
            <h5 class="card-header">List User</h5>
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
                    <input type="hidden" name="sortName" value="fullname">
                    <input type="hidden" name="sortBy" value="asc">
                    <input type="hidden" name="type" value="list">
                </div>
            </form>
        </div>
        <div class="col-sm-12 col-md-2">
            <div class="form-group mb-0">

                <a class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add" href="/admin/user?type=edit"><i class='fa fa-user-plus'></i></a>
                <button type="button" class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" id="btnDelete" style="border: 0" ><i class='fa fa-trash'></i></button>
            </div>
        </div>
    </div>


    <table class="table  table-hover">
<%--        <h3 >LIST OF User</h3>--%>
<%--        <c:if test="${not empty messageResponse }">--%>
<%--            <div class="alert alert-${alert}" >--%>
<%--                    ${messageResponse}--%>
<%--            </div>--%>
<%--        </c:if>--%>
        <thead>
        <tr>
            <th class="hidden" style="width: 15px;">
                <input type="checkbox" id="checkAll"   />
            </th>
            <th>Email</th>
            <th>FullName</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${model.listResult}" var="item">
            <tr id="${item.id}">
                <td class="center">
                    <input type="checkbox"  id="checkbox_${item.id}" value="${item.id}"/>
                </td>
                <td>${item.email}</td>
                <td>${item.fullname}</td>
                <td>${item.address}</td>
                <td>${item.phone}</td>
                <c:forEach var="role" items="${roles}">
                    <c:if test="${role.id == item.role_id }">
                        <td>${role.name}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="items" items="${statusModel}">
                    <c:if test="${items.id == item.status_id && item.status_id==3}">
                        <td><span class="badge badge-pill badge-success">${items.name}</span></td>
                    </c:if>
                    <c:if test="${items.id == item.status_id && item.status_id==4}">
                        <td><span class="badge badge-pill badge-danger">${items.name}</span></td>
                    </c:if>
                </c:forEach>
                <td>
                    <c:url var="editURL" value="/admin/user">
                        <c:param name="type" value="edit"></c:param>
                        <c:param name="id" value="${item.id}"></c:param>
                    </c:url>
                    <div class="button-list d-flex flex-wrap" style="display: inline-block;">

                        <a style="float:left;margin-right:4px;" href="${editURL}">
                            <input type="hidden" name="id" value="${item.id}"></input>
                            <button type="submit"  class="btn btn-info">Update</button>
                        </a>
                        <a>
                            <input type="hidden" name="id" value="${item.id}"></input>
                            <button type="submit"  class="btn btn-danger">Delete</button>
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation" style="margin-top: auto;margin-left: auto;margin-right: auto;">
        <ul class="pagination">
            <c:if test="${model.page>1}">
                <li class="page-item ">
                    <a class="page-link" href="/admin/user?type=list&keyword=<%= request.getParameter("keyword") %>&page=${model.page-1}&maxPageItem=10&sortName=fullname&sortBy=desc" >Previous</a>
                </li>
            </c:if>
            <c:forEach var="page" begin="1" end="${model.totalPage}">
                <c:choose>
                    <c:when test="${page==model.page}">
                        <li class="page-item active"><a class="page-link" href="/admin/user?type=list&keyword=<%= request.getParameter("keyword") %>&page=${page}&maxPageItem=10&sortName=fullname&sortBy=desc">${page}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="/admin/user?type=list&keyword=<%= request.getParameter("keyword") %>&page=${page}&maxPageItem=10&sortName=fullname&sortBy=desc">${page}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${model.page<model.totalPage}">
                <li class="page-item">
                    <a class="page-link" href="/admin/user?type=list&keyword=<%= request.getParameter("keyword") %>&page=${model.page+1}&maxPageItem=10&sortName=fullname&sortBy=desc" >Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<input type="hidden" value="list" id="type" name="type"/>
<%--<div id="modal-edit" class="modal fade" tabindex="-1" role="dialog"--%>
<%--     aria-hidden="true" data-backdrop="false">--%>
<%--    <div class="modal-dialog modal-dialog-centered">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-body">--%>
<%--                <div class="px-3">--%>
<%--                    <div class="d-flex justify-content-center mt-2 mb-4 navbar-light">--%>
<%--                        <a href="dashboard.html" class="navbar-brand"--%>
<%--                           style="min-width: 0"> <img class="navbar-brand-icon"--%>
<%--                                                      src="/assets/images/CRM.png" width="250" alt="Cybersoft">--%>
<%--                        </a>--%>
<%--                    </div>--%>

<%--                    <form action='"></c:url>'--%>
<%--                          method="post" name="form">--%>
<%--                        <div class="form-group">--%>
<%--                            <input class="form-control" type="hidden" name="id">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="username">Name:</label> <input class="form-control"--%>
<%--                                                                       type="text" name="username" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="email">Email Address:</label> <input--%>
<%--                                class="form-control" type="text" name="email" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group" type="hidden">--%>
<%--                            <label for="password">Password:</label> <input--%>
<%--                                class="form-control" type="password" name="password"--%>
<%--                                readonly="readonly" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="address">Address:</label> <input--%>
<%--                                class="form-control" type="text" name="address" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="phone">Phone:</label> <input class="form-control"--%>
<%--                                                                     id="text" name="phone" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="role_id">Role:</label> <select id="role_id"--%>
<%--                                                                       name="role_id" data-toggle="select" class="form-control">--%>

<%--                        </select>--%>
<%--                        </div>--%>
<%--                        <div class="form-group text-center">--%>
<%--                            <button class="btn btn-primary" type="submit">Update</button>--%>
<%--                            <button type="button" class="btn btn-light" data-dismiss="modal" style="float:left;margin-right:10px">Close</button>--%>
<%--                            &lt;%&ndash;								<button class="btn btn-danger" type="button"&ndash;%&gt;--%>
<%--                            &lt;%&ndash;										data-dismiss="modal">Cancel</button>&ndash;%&gt;--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- // END .modal-body -->--%>
<%--        </div>--%>
<%--        <!-- // END .modal-content -->--%>
<%--    </div>--%>
<%--    <!-- // END .modal-dialog -->--%>
<%--</div>--%>

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
                window.location.href = "${Userurl}?type=list&keyword=&page=1&maxPageItem=10&message=DeleteSuccess";
            },
            error:function(result){
                window.location.href = "${Userurl}?type=list&keyword=&page=1&maxPageItem=10&message=DeleteError";
            }
        });
    }
</script>
</body>
</html>
