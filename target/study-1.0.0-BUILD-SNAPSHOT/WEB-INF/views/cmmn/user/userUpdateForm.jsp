<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<style>
table {
	width: 50%;
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
	<form action="${CPATH}/cmmn/user/userUpdate.do" id="formSubmit"
		method="post">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">사용자 수정</h5>
						<table>
							<caption class="d-none">사용자 목록(ID, 비밀번호, 이름)</caption>
							<tbody>
								<tr>
									<th>사용자 아이디</th>
									<td><c:out value="${userDetail.userId}" /></td>
									<input type="hidden" name="userId"
										value="<c:out value="${userDetail.userId}"/>">
								</tr>
								<tr>
									<th>사용자 비밀번호</th>
									<td><input type="password" id="userPw" name="userPw"></td>
								</tr>
								<tr>
									<th>사용자 이름</th>
									<td><input type="text" id="userNm" name="userNm"
										value="<c:out value="${userDetail.userNm}"/>"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
	<button class="btn btn-primary" type="button" id="SubmitBtn">등록</button>
</body>
<script type="text/javascript">
	// 신규 유저 등록 시 유효성 검사
	function validation() {

		if ($('#userNm').val() == "") {
			alert('이름을 입력해주세요.');
			return false;
		}
		return true;

	}

	// 수정버튼 클릭
	$('#SubmitBtn').on('click', function() {
		if (!validation()) {
			return;
		}
		// 수정 처리
		$('#formSubmit').submit();
	});

	// 등록버튼 클릭
	// 	$('#SubmitBtn').on('click', function() {
	// 		let dataObject = {
	// 			userId : ${'#userId'}.val(),
	// 			userPw : $('#userPw').val(),
	// 			userNm : $('#userNm').val(),
	// 		}
	// 		opener.parent.location.reload();
	// 		window.close();
	// 	});
</script>
</html>
