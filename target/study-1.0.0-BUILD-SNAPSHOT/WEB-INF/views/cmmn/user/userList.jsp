<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<div class="pagetitle">
	<h1>사용자 관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${CPATH}">Home</a></li>
			<li class="breadcrumb-item active">사용자</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">사용자 검색</h5>

					<form action="srchFrm" action="${CPATH}/cmmn/user/userList.do"
						method="get">
						<div class="row mb-3">
							<label for="userId" class="col-sm-4 col-md-2 col-form-label">ID</label>
							<div class="col-sm-8 col-md-4">
								<input id="userId" type="text" name="userId" class="form-control"
									value="${searchVO.userId}">
							</div>
							<label for="userNm" class="col-sm-4 col-md-2 col-form-label">이름</label>
							<div class="col-sm-8 col-md-4">
								<input id="userNm" type="text" name="userNm" class="form-control"
									value="${searchVO.userNm}">
							</div>
						</div>
						<div class="row float-end mt-2">
							<button id="searchBtn" class="btn btn-primary" type="button">검색</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">사용자 목록</h5>

					<!-- Table with hoverable rows -->
					<table class="table table-hover">
						<caption class="d-none">사용자 목록(번호, ID, 이름, 등록자, 등록일자)</caption>
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">등록자</th>
								<th scope="col">등록일자</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="1" />
							<c:forEach items="${userList}" var="userList" varStatus="loop">
								<tr id="detailForm">
									<td>${count + loop.index}</td>
									<td id="userId"><c:out value="${userList.userId}" /></td>
									<td><c:out value="${userList.userNm}" /></td>
									<td><c:out value="${userList.rgstId}" /></td>
									<td><c:out value="${userList.rgstDt}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- End Table with hoverable rows -->
					<button class="btn btn-primary" type="button" id="newUserBtn">신규 유저 등록</button>
				</div>
			</div>
		</div>
	</div>
</section>

<html>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script> -->
<script type="text/javascript">

	// 사용자 상세 페이지
    const rows = document.querySelectorAll('#detailForm');
    rows.forEach(row => {
      row.addEventListener('click', () => {
        const cells = row.querySelectorAll('td');
        const userId = cells[1].textContent;
        window.open('/cmmn/user/userDetail.do?userId='+userId, 'detailForm', 'width=1000, height=800, left=100, top=50');
      });
    });

    // 검색
    $('#searchBtn').on('click', function () {
    	var userId = $('#userId').val();
    	var userNm = $('#userNm').val();
    	console.log("아이딩: " + userId);
    	console.log("이릠: " + userNm);
    	window.location.href = '${CPATH}/cmmn/user/userList.do?userId=' + userId + '&userNm=' + userNm;
    });

   	// 사용자 등록 페이지
 	$('#newUserBtn').on('click', function() {
 		window.open("/cmmn/user/userInsertForm.do", "userInsertForm", "width=1000, height=800, left=100, top=50");
 	});
</script>
</html>
