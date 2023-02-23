<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>
</head>
<body>
	<p>사용자 이름 : <c:out value="${result.userName}"/></p>
	<p>서버에 업로드된 파일 이름 : <c:out value="${result.convFileNm}"/></p>
	<p>유저가 업로드한 파일 이름 : <c:out value="${result.orgnFileNm}"/></p>
	<p>파일 크기 : <c:out value="${result.fileSize}"/></p>
</body>
</html>