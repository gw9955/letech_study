<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Test</title>
	<script type="text/javascript">
		function fn_popup() {
			window.open('${CPATH}/test/popup');
		}
	</script>
</head>
<body>
<h1>
	Test!
</h1>

<P>  The time on the WAS server is ${serverTime}. </P>
<P>  The time on the DB server is ${testNow}. </P>
<button onclick="fn_popup();">Popup</button>
</body>
</html>
