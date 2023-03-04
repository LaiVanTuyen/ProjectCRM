<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><dec:title default="Login"/></title>
    <link rel="shortcut icon"
          href='<c:url value="/assets/images/icons/favicon.ico"></c:url>' />

    <!-- Perfect Scrollbar -->
    <link type="text/css"
          href='<c:url value="/assets/vendor/bootstrap/css/bootstrap.min.css"></c:url>'
          rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href='<c:url value="/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css"></c:url>'
          rel="stylesheet">
    <link type="text/css"
          href='<c:url value="/assets/vendor/animate/animate.css"></c:url>' rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css"
          href='<c:url value="/assets/vendor/css-hamburgers/hamburgers.min.css"></c:url>'
          rel="stylesheet">
    <link type="text/css"
          href='<c:url value="/assets/vendor/select2/select2.min.css"></c:url>'
          rel="stylesheet">

    <!-- Font Awesome FREE Icons -->
    <link type="text/css"
          href='<c:url value="/assets/css/util.css"></c:url>'
          rel="stylesheet">
    <link type="text/css"
          href='<c:url value="/assets/css/main.css"></c:url>'
          rel="stylesheet">

</head>
<body>

<dec:body></dec:body>

<!-- jQuery -->
<script src='<c:url value="/assets/vendor/jquery/jquery-3.2.1.min.js"></c:url>'></script>

<!-- Bootstrap -->
<script src='<c:url value="/assets/vendor/bootstrap/js/popper.js"></c:url>'></script>
<script src='<c:url value="/assets/vendor/bootstrap/js/bootstrap.min.js"></c:url>'></script>

<!-- Perfect Scrollbar -->
<script
        src='<c:url value="/assets/vendor/select2/select2.min.js"></c:url>'></script>

<!-- DOM Factory -->
<script src='<c:url value="/assets/vendor/tilt/tilt.jquery.min.js"></c:url>'></script>

<!-- MDK -->
<script
        src='<c:url value="/assets/js/main.js"></c:url>'></script>

<!-- App -->
<script >
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>

</body>
</html>
