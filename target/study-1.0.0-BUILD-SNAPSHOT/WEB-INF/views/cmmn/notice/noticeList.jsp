<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<section class="section">
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시판 목록</h5>

					<!-- Table with hoverable rows -->
					<table class="table table-hover">
						<caption class="d-none">게시판 목록(번호, 분류, 제목, 등록자, 등록일자)</caption>
						<thead>
							<tr>
								<th scope="col">No.</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col">등록자</th>
								<th scope="col">등록일자</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="1" />
							<c:forEach items="${noticeList}" var="noticeList"
								varStatus="loop">
								<tr id="detailForm">
									<td>${count + loop.index}</td>
									<td><c:out value="${noticeList.ntcCtg}" /></td>
									<td><c:out value="${noticeList.userNm}" /></td>
									<td><c:out value="${noticeList.ntcTtl}" /></td>
									<td><c:out value="${noticeList.rgstId}" /></td>
									<td><c:out value="${noticeList.rgstDt}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- End Table with hoverable rows -->
					<!-- <button class="btn btn-primary" type="button" id="newUserBtn">신규 유저 등록</button> -->
				</div>
			</div>
		</div>
	</div>
</section>
<html>
</html>