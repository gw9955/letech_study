<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<html>
<style>
  table {
    width: 20%;
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
				<thead>
					<tr class="text-center">
						<th>사용자 아이디</th>
						<th>사용자 이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="userList">
						<tr id="detailForm">
							<td id="userId"><c:out value="${userList.userId}"/></td>
							<td><c:out value="${userList.userNm}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<button type="button" id="newUserBtn">신규 유저 등록</button>
</body>
<script type="text/javascript">
    const rows = document.querySelectorAll('#detailForm');
    rows.forEach(row => {
      row.addEventListener('click', () => {
        const cells = row.querySelectorAll('td');
        const userId = cells[0].textContent;
        console.log('Clicked row values: ' + userId);
        window.open('/cmmn/user/userDetail.do?userId='+userId, 'detailForm', 'width=1000, height=800, left=100, top=50');
      });
    });

  	// 사용자 등록 페이지
	$('#newUserBtn').on('click', function() {
		window.open("/cmmn/user/userInsertForm.do", "userInsertForm", "width=1000, height=800, left=100, top=50");
	});
</script>
</html>
