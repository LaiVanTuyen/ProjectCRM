<%@include file="/common/taglib.jsp"%>>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api/v1/project"/>
<c:url var="Projectrurl" value="/admin/project"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Project</title>
  <link rel="shortcut icon"
        href='<c:url value="/assets/images/favicon.ico"></c:url>' />
</head>
<body>
<!-- Header Layout Content -->
<div class="container page__heading-container">
  <div class="page__heading">
    <div class="d-flex align-items-center">
      <div>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a
                    href='/admin/home'>Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">
              Create Project</li>
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
  <!-- End Breadcrumb -->
  <div class="container page__container">
    <div class="card card-form">
      <div class="row no-gutters">
        <div class="col-lg-4 card-body">
          <p>
            <strong class="headings-color">Rules</strong>
          </p>
          <p class="text-muted">You must fill all of options!</p>
          <c:if test="${not empty messageResponse }">
            <div class="alert alert-${alert}" >
                ${messageResponse}
            </div>
          </c:if>
        </div>
        <div class="col-lg-8 card-form__body card-body">
          <form id="formSubmit">
            <div class="form-group">
              <label for="name">Project name:</label> <input type="text"
                                                                    class="form-control"  id="name"
                                                                    name="name" value="${projectModel.name}">

            </div>
            <div class="form-group">
              <label for="name">Descriptions:</label> <input
                                                             class="form-control"  type="text"
                                                             id="descriptions"
                                                             name="descriptions"
                                                             value="${projectModel.descriptions}">

            </div>
            <div class="form-group">
              <label for="start_date">Start Date:</label>
              <input class="form-control" type="date" value="${projectModel.start_date}" id="start_date" name="start_date"
                    >
            </div>
            <div class="form-group">
              <label for="end_date">End Date:</label>
              <input class="form-control" type="date" value="${projectModel.end_date}" id="end_date" name="end_date"
                     >
            </div>
<%--            <div class="form-group">--%>
<%--              <label for="description">Description:</label>--%>
<%--              <textarea type="text" cols="20" rows="5" class="form-control" name="description"--%>
<%--                        id="description" aria-label="With textarea" required></textarea>--%>
<%--            </div>--%>
            <div class="form-group">
              <label  class="form-label">User select</label>
              <select class="form-select" id="user_id" name="user_id" aria-label="Default select example">
                <c:if test="${empty projectModel.user_id}">
                  <option value="">Select User</option>
                  <c:forEach var="item" items="${users}">
                    <option value="${item.id}">${item.fullname}</option>
                  </c:forEach>
                </c:if>
                <c:if test="${not empty projectModel.user_id}">
                  <option value="">Select User</option>
                  <c:forEach var="item" items="${users}">
                    <option value="${item.id}" <c:if test="${item.id == projectModel.user_id}"> selected="selected"</c:if> >
                        ${item.fullname}
                    </option>
                  </c:forEach>
                </c:if>
              </select>
            </div>
            <c:if test="${not empty projectModel.id}">
              <input type="button" class="btn btn-primary" value="Update Project " id="btnAddOrUpdateNew"/>

            </c:if>
            <c:if test="${empty projectModel.id}">
              <input type="button" class="btn btn-primary" value="Add Project" id="btnAddOrUpdateNew"/>
            </c:if>
            <input type="hidden" value="${projectModel.id}" id="id" name="id" >
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  $('#btnAddOrUpdateNew').click(function(e){
    e.preventDefault();
    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData , function(i , v){//tránh trùng tên thì đặt index = i, value = v
      data[""+v.name+""] = v.value;
    });
    var id = $('#id').val();
    if (id==""){
      addUser(data);
    }else {
      updateUser(data);
    }
  });
  function addUser(data){
    $.ajax({
      url:'${APIurl}',
      type:'POST',
      contentType:'application/json',
      data:JSON.stringify(data),
      dataType:'json',
      success:function(result){
        window.location.href = "${Projectrurl}?type=edit&id="+result.id+"&message=InsertSuccess";
      },
      error:function(result){
        window.location.href = "${Projectrurl}?type=edit&keyword=&page=1&maxPageItem=10&message=InsertError";
      }
    });
  }
  function updateUser(data){
    $.ajax({
      url:'${APIurl}',
      type:'PUT',
      contentType:'application/json',
      data:JSON.stringify(data),
      dataType:'json',
      success:function(result){
        window.location.href = "${Projectrurl}?type=edit&id="+result.id+"&message=UpdateSuccess";
      },
      error:function(result){
        window.location.href = "${Projectrurl}?type=edit&keyword=&page=1&maxPageItem=10&message=UpdateError";
      }
    });
  }
</script>
</body>
</html>
