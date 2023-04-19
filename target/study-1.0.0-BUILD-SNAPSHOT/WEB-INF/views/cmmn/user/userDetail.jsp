<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
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
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">사용자 상세</h5>
					<table class="table table-hover">
						<caption class="d-none">사용자 상세(번호, 이름)</caption>
						<tbody>
							<tr>
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
							<tr>
								<th>파일</th>
								<td><c:forEach items="${userDetail.fileVOList }"
										var="attatch" varStatus="vs">
										<a
											href="${CPATH }/cmmn/user/downloadFile.do?fileGrpId=<c:out value="${attatch.fileGrpId}"></c:out>
				                  &fileNo=<c:out value="${attatch.fileNo}"></c:out>
				                  ">${attatch.orgnFileNm }</a> ${not vs.last ? ",":"" }
				         </c:forEach></td>
							</tr>
							<%-- 					<c:forEach items="${userDetail.fileVOList}" var="fileVOList"> --%>
							<%-- 						<tr id="download" style="cursor:pointer;" onclick="downloadFile('${fileVOList.orgnFileNm}')"> --%>
							<!-- 							<th>파일명</th> -->
							<%-- 							<td><c:out value="${fileVOList.orgnFileNm}" /></td> --%>
							<!-- 						</tr> -->
							<!-- 						<tr> -->
							<!-- 							<th>크기</th> -->
							<%-- 							<td><c:out value="${fileVOList.fileSize}" /></td> --%>
							<!-- 						</tr> -->
							<%-- 			        </c:forEach> --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<form action="/cmmn/user/userDelete.do" method="post">
		<input type="hidden" name="userId" value="${userDetail.userId}" />
		<button class="btn btn-danger" type="submit" id="deleteUserBtn">삭제</button>
		<button class="btn btn-primary" type="button" id="updateUserBtn">수정</button>
	</form>
</body>
<script type="text/javascript">

	//사용자 상세 페이지
	var rows = document.querySelectorAll('#download');
	rows.forEach(row => {
	  row.addEventListener('click', () => {
	    var cells = row.querySelectorAll('td');
	    var orgnFileNm = cells[0].textContent;
	    window.location.href = '/cmmn/user/downloadFile.do?fileNo=' + fileNo + '&fileGrpId';
	  });
	});

	// 사용자 수정 패이지
	$('#updateUserBtn').on('click', function() {
		var userId = $('#userId').text();
		window.open('/cmmn/user/userUpdateForm.do?userId='+userId, 'userInsertForm', 'width=1000, height=800, left=100, top=50');
	});
</script>
</html>
