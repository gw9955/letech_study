<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

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
	<form action="${CPATH}/cmmn/user/userInsert.do" id="formSubmit" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-12">
				<table>
					<tbody>
						<tr class="text-center">
							<th>사용자 아이디</th>
							<td><input type="text" id="userId" name="userId"></td>
						</tr>
						<tr>
							<th>사용자 비밀번호</th>
							<td><input type="text" id="userPw" name="userPw"></td>
						</tr>
						<tr>
							<th>사용자 이름</th>
							<td><input type="text" id="userNm" name="userNm"></td>
						</tr>
					</tbody>
				</table>
				<fieldset>
					<p>파일명1 : <input type="file" name="files"></p>
					<p>파일명2 : <input type="file" name="files"></p>
				</fieldset>
				<button type="button" id="SubmitBtn">등록</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	// 신규 유저 등록 시 유효성 검사
	function validation(){

		if( $('#userId').val() == ""){
			alert('ID를 입력해주세요.');
			return false;
		}else if( $('#userPw').val() == ""){
			alert('비밀번호를 입력해주세요');
			return false;
		}else if( $('#userNm').val() == ""){
			alert('이름을 입력해주세요.');
			return false;
		}
		return true;

	}

	// 등록버튼 클릭
	$('#SubmitBtn').on('click', function() {
		if (!validation()) {
			return;
		}
		// 등록 처리
		$('#formSubmit').submit();
	});

</script>
</html>
