<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><dec:title default="Home"/></title>
    <dec:head></dec:head>
    <jsp:include page="/common/header.jsp"></jsp:include>
    <script src='<c:url value="/assets/vendor/jquery.min.js"></c:url>'></script>
</head>
<body>
<body class="layout-fixed">
<div class="preloader"></div>
<div class="mdk-header-layout js-mdk-header-layout">
    <jsp:include page="/common/menu.jsp"></jsp:include>
    <dec:body></dec:body>
</div>
<!-- App Settings FAB -->
<div id="app-settings" hidden>
    <app-settings layout-active="fixed"
                  :layout-location="{
      'default': 'index.html',
      'fixed': 'dashboard.html',
      'fluid': 'fluid-dashboard.html',
      'mini': 'mini-dashboard.html'}">
    </app-settings>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</body>
</html>
