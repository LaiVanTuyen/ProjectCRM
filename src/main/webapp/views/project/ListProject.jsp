<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api/v1/project"/>
<c:url var="ProjectUrl" value="/admin/project"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Manager Project</title>
  <link rel="shortcut icon" href='<c:url value="/assets/images/favicon.ico"></c:url>'/>
</head>
<body>
<!-- Header Layout Content -->
<div class="container page__heading-container">
  <div class="page__heading">
    <div class="d-flex align-items-center">
      <div>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a  href='<c:url value="/admin/home"></c:url>'>Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">
              Manager Project</li>
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
          <input type="hidden" name="sortName" value="name">
          <input type="hidden" name="sortBy" value="asc">
          <input type="hidden" name="type" value="list">
        </div>
      </form>
    </div>
    <div class="col-sm-12 col-md-2">
      <div class="form-group mb-0">

        <a class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add" href="/admin/project?type=edit"><i class='fa fa-user-plus'></i></a>
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
              <th>Project Name</th>
              <th>Descriptions</th>
              <th>User</th>
              <th>Start_Date</th>
              <th>End_date</th>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody class="list" id="staff">
            <c:forEach var="item" items="${projectModel.listResult}">
              <tr class="selected">
                <td class="center">
                  <input type="checkbox"  id="checkbox_${item.id}" value="${item.id}"/>
                </td>
                <td>${item.name}</td>
                <td>${item.descriptions}</td>
                <c:forEach var="items" items="${userModel}">
                  <c:if test="${items.id == item.user_id}">
                    <td><span class="badge badge-pill badge-success">${items.fullname}</span></td>
                  </c:if>
                </c:forEach>
                <c:if test="${item.user_id==''}">
                  <td><span class="badge badge-pill badge-danger">null</span></td>
                </c:if>
                <td>${item.start_date}</td>
                <td>${item.end_date}</td>
                <td>
                  <c:url var="editURL" value="/admin/project">
                    <c:param name="type" value="edit"></c:param>
                    <c:param name="id" value="${item.id}"></c:param>
                  </c:url>
<%--                  <a  href="${editURL}" style="float:left;margin-right:4px;" class="btn btn-warning "--%>
<%--                          data-toggle="modal" data-target="#modal-signup">--%>
<%--                    <input type="hidden" name="id" value="${item.id}"></input>--%>
<%--                    <button type="submit"  class="btn btn-info"><i class="material-icons">settings</i></button>--%>
<%--                  </a>--%>
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
              <c:if test="${projectModel.page>1}">
                <li class="page-item ">
                  <a class="page-link" href="/admin/project?type=list&keyword=<%= request.getParameter("keyword") %>&page=${projectModel.page-1}&maxPageItem=10&sortName=name&sortBy=desc" >Previous</a>
                </li>
              </c:if>
              <c:forEach var="page" begin="1" end="${projectModel.totalPage}">
                <c:choose>
                  <c:when test="${page==projectModel.page}">
                    <li class="page-item active"><a class="page-link" href="/admin/project?type=list&keyword=<%= request.getParameter("keyword") %>&page=${page}&maxPageItem=10&sortName=name&sortBy=desc">${page}</a></li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/admin/project?type=list&keyword=<%= request.getParameter("keyword") %>&page=${page}&maxPageItem=10&sortName=name&sortBy=desc">${page}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${projectModel.page<projectModel.totalPage}">
                <li class="page-item">
                  <a class="page-link" href="/admin/project?type=list&keyword=<%= request.getParameter("keyword") %>&page=${model.page+1}&maxPageItem=10&sortName=name&sortBy=desc" >Next</a>
                </li>
              </c:if>
            </ul>
          </nav>
          <input type="hidden" value="list" id="type" name="type"/>
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- Sign Up Modal -->
<%--  <div id="modal-signup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">--%>
<%--    <div class="modal-dialog modal-dialog-centered">--%>
<%--      <div class="modal-content">--%>
<%--        <div class="modal-body">--%>
<%--          <div class="px-3">--%>
<%--            <div class="d-flex justify-content-center mt-2 mb-4 navbar-light">--%>
<%--              <a href="dashboard.html" class="navbar-brand" style="min-width: 0">--%>
<%--                <img class="navbar-brand-icon" src="assets/images/logo.png" width="250" alt="Cybersoft">--%>
<%--              </a>--%>
<%--            </div>--%>

<%--            <form action='<c:url value="<%=UrlConst.PROJECTUPDATE%>"></c:url>' method="post" novalidate>--%>
<%--              <div class="form-group">--%>
<%--                <label for="username">Project name:</label>--%>
<%--                <select  name="projectName" style="padding: 5px; border-radius: 0.25rem;border: solid; border-color: cadetblue;">--%>
<%--                  <optgroup label="Project name">--%>
<%--                    <c:forEach var="projects" items="${projects}">--%>
<%--                      <option>${projects.name}</option>--%>
<%--                    </c:forEach>--%>
<%--                  </optgroup>--%>
<%--                </select>--%>
<%--              </div>--%>
<%--              <div class="form-group">--%>
<%--                <label for="email">Email of manager:</label> <input--%>
<%--                      class="form-control" type="email" id="email" name="email"--%>
<%--                      placeholder="Enter manager email address" />--%>
<%--              </div>--%>
<%--              <div class="form-group">--%>
<%--                <label for="start_date">Start Date:</label>--%>
<%--                <input id="dateRangePickerSample01" name="start_day" type="text" class="form-control"--%>
<%--                       placeholder="Date example" data-toggle="daterangepicker" data-daterangepicker-drops="up"--%>
<%--                       data-daterangepicker-start-date="2021/03/06" data-daterangepicker-single-date-picker="true">--%>
<%--              </div>--%>
<%--              <div class="form-group">--%>
<%--                <label for="end_date">End Date:</label>--%>
<%--                <input id="dateRangePickerSample01" name="end_day" type="text" class="form-control"--%>
<%--                       placeholder="Date example" data-toggle="daterangepicker" data-daterangepicker-drops="up"--%>
<%--                       data-daterangepicker-start-date="2021/03/06" data-daterangepicker-single-date-picker="true">--%>
<%--              </div>--%>
<%--              <div class="form-group text-center">--%>
<%--                <button type="button" class="btn btn-light" data-dismiss="modal" style="float:left;margin-right:10px">Close</button>--%>
<%--                <button class="btn btn-primary" type="submit">Update</button>--%>
<%--              </div>--%>
<%--            </form>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <!-- // END .modal-body -->--%>
<%--      </div>--%>
<%--      <!-- // END .modal-content -->--%>
<%--    </div>--%>
<%--    <!-- // END .modal-dialog -->--%>
<%--  </div>--%>

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
        window.location.href = "${ProjectUrl}?type=list&keyword=&page=1&maxPageItem=10&message=DeleteSuccess";
      },
      error:function(result){
        window.location.href = "${ProjectUrl}?type=list&keyword=&page=1&maxPageItem=10&message=DeleteError";
      }
    });
  }
</script>
</body>
</html>
