<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	if ('${loginFailMag}'.trim() !== '') {
		alert('${loginFailMag}');
	}

	function isEmpty(str) {
		return str == null || str.trim() === '';
	}

	function fn_login() {
		var idDom = document.getElementById('userId');
		var pwDom = document.getElementById('userPw');

		if (isEmpty(idDom.value)) {
			alert('아이디를 입력 하세요.');
			idDom.focus;
			return;
		}

		if (isEmpty(pwDom.value)) {
			alert('비밀번호를 입력 하세요.');
			pwDom.focus;
			return;
		}

		document.getElementById('frm').submit();
	}
</script>

<form id="frm" action="${CPATH}/cmmn/sec/loginProc.do" method="post">
	<table>
		<caption>로그인(ID, 비밀번호)</caption>
		<colgroup>
			<col style="width: 30%;">
			<col style="width: 70%;">
		</colgroup>
		<thead>
			<tr>
				<th colspan="2">로그인</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th><label for="userId">아이디</label></th>
				<td><input type="text" id="userId" name="userId" value="${param.userId}" /></td>
			</tr>
			<tr>
				<th><label for="userPw">비밀번호</label></th>
				<td><input type="password" id="userPw" name="userPw" value="" /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2"><button onclick="fn_login()">로그인</button></td>
			</tr>
		</tfoot>
	</table>
</form>