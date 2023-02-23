<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<style>
  table {
    width: 40%;
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
<head>
	<title>사용자 관리</title>
</head>
<body>
	<div class="row">
		<div class="col-sm-12">
			<table>
				<tbody>
					<tr class="text-center">
						<th>사용자 아이디</th>
						<td id="userId">${userDetail.userId}</td>
					</tr>
					<tr>
						<th>사용자 이름</th>
						<td><c:out value="${userDetail.userNm}" /></td>
					</tr>
					<tr>
						<th>등록자</th>
						<td><c:out value="${userDetail.rgstId}" /></td>
					</tr>
					<tr>
						<th>등록일시</th>
						<td><c:out value="${userDetail.rgstDt}" /></td>
					</tr>
					<tr>
						<th>수정자</th>
						<td><c:out value="${userDetail.updtId}" /></td>
					</tr>
					<tr>
						<th>수정일시</th>
						<td><c:out value="${userDetail.updtDt}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<form action="/cmmn/user/userDelete.do" method="post">
		<input type="hidden" name="userId" value="${userDetail.userId}" />
	<button type="submit" id="deleteUserBtn">삭제</button>
	</form>
	<button type="button" id="updateUserBtn">수정</button>
</body>
<script type="text/javascript">
	// 사용자 수정 패이지
	$('#updateUserBtn').on('click', function() {
		var userId = $('#userId').text();
		window.open('/cmmn/user/userUpdateForm.do?userId='+userId, 'userInsertForm', 'width=1000, height=800, left=100, top=50');
	});
</script>
</html>
