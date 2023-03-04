<%@include file="/common/taglib.jsp"%>>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="APIurl" value="/api/v1/user"/>
<c:url var="Userurl" value="/admin/user"/>
<html>
<head>
    <title>Edit User</title>
    <link rel="shortcut icon"
          href='<c:url value="/assets/images/favicon.ico"></c:url>' />
</head>
<body>
<div class="container page__heading-container">
    <div class="page__heading">
        <div class="d-flex align-items-center">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Create Users</li>
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
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Add New User</h5>
        <c:if test="${not empty messageResponse }">
            <div class="alert alert-${alert}" >
                    ${messageResponse}
            </div>
        </c:if>
    </div>
    <div class="card card-form container">
        <div class="row no-gutters" >
            <div class="col-lg-12 card-body">
                <form id="formSubmit">
                    <div class="form-group">
                        <label for="fullname">Name:</label> <input class="form-control"
                                                                   type="text" id="fullname" name="fullname"
                                                                   value="${model.fullname}"
                                                                   placeholder="Enter your name" required/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address:</label> <input
                            class="form-control" type="email" id="email" name="email"
                            value="${model.email}"
                            placeholder="Enter your email address" required/>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label> <input
                            class="form-control" type="password" id="password"
                            value="${model.password}"
                            name="password" placeholder="Enter your password" required />
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label> <input class="form-control"
                                                                     type="text" required="" id="address" name="address"
                                                                     value="${model.address}"
                                                                     placeholder="Enter your address" required />
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label> <input class="form-control"
                                                                 type="phone" required="" id="phone"
                                                                 name="phone"
                                                                 value="${model.phone}"
                                                                 placeholder="Enter your phone number" required />
                    </div>
                    <div class="form-group">
                        <label for="roleCode" class="form-label">Role select</label>
                        <select class="form-select" id="roleCode" name="roleCode" aria-label="Default select example">
                            <c:if test="${empty model.roleCode}">
                                <option value="">Select Role</option>
                                <c:forEach var="item" items="${roles}">
                                    <option value="${item.code}">${item.name}</option>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty model.roleCode}">
                                <option value="">Select Role</option>
                                <c:forEach var="item" items="${roles}">
                                    <option value="${item.code}" <c:if test="${item.code == model.roleCode}"> selected="selected"</c:if> >
                                            ${item.name}
                                    </option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="form-group">
                        <label  class="form-label">Status select</label>
                        <select id="status_id" name="status_id" class="form-select">
                            <c:if test="${empty model.status_id}">
                                <option value="">Select status</option>
                                <c:forEach var="item" items="${status}">
                                    <option value="${item.id}">${item.name}</option>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty model.status_id}">
                                <option value="">Select status</option>
                                <c:forEach var="item" items="${status}">
                                    <option value="${item.id}" <c:if test="${item.id == model.status_id}"> selected="selected"</c:if> >
                                            ${item.name}
                                    </option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="form-group text-center ">
                        <div class="col-md-6" >
                            <c:if test="${not empty model.id}">
                            <input type="button" class="btn btn-primary" value="Update User " id="btnAddOrUpdateNew"/>

                            </c:if>
                            <c:if test="${empty model.id}">
                            <input type="button" class="btn btn-primary" value="Add user" id="btnAddOrUpdateNew"/>
                            </c:if>
                        </div>

                            <input type="hidden" value="${model.id}" id="id" name="id" >
                    </div>
                </form>
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
                window.location.href = "${Userurl}?type=edit&id="+result.id+"&message=InsertSuccess";
            },
            error:function(result){
                window.location.href = "${Userurl}?type=edit&keyword=&page=1&maxPageItem=10&message=InsertError";
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
                window.location.href = "${Userurl}?type=edit&id="+result.id+"&message=UpdateSuccess";
            },
            error:function(result){
                window.location.href = "${Userurl}?type=edit&keyword=&page=1&maxPageItem=10&message=UpdateError";
            }
        });
    }
</script>
</body>
</html>
