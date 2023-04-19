<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 공통변수 처리 -->
<c:set var="CPATH" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="RPATH" value="${CPATH}/resources" scope="application"/>
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <meta charset="UTF-8">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <title>User | study</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${RPATH}/assets/img/favicon.png" rel="icon">
  <link href="${RPATH}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${RPATH}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${RPATH}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${RPATH}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${RPATH}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${RPATH}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${RPATH}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${RPATH}/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${RPATH}/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script type="text/javascript">
      var G_CONST = {};
      G_CONST.CPATH = "${CPATH}";
      G_CONST.RPATH = "${RPATH}";
   </script>
   <link rel="stylesheet" href="${RPATH}/css/bootstrap.css">
</head>

<body>
	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="left" />

	<main id="main" class="main">
		<tiles:insertAttribute name="body" />
	</main>

	<tiles:insertAttribute name="foot" />

	<!-- Vendor JS Files -->
	<script src="${RPATH}/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="${RPATH}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${RPATH}/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="${RPATH}/assets/vendor/echarts/echarts.min.js"></script>
	<script src="${RPATH}/assets/vendor/quill/quill.min.js"></script>
	<script src="${RPATH}/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="${RPATH}/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="${RPATH}/assets/vendor/php-email-form/validate.js"></script>
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script> -->
</body>

</html>