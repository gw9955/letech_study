<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
<title>게시판 관리</title>
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시물 상세</h5>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" id="ntcTtl" name="ntcTtl" value="${noticeDetail.ntcTtl}" class="form-control" readonly>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<textarea id="ntcCon" class="form-control" readonly>${noticeDetail.ntcCon}</textarea>
						</div>
					</div>
					<table>
				        <c:forEach varStatus="loop" begin="1" end="2">
				            <tr>
				                <td>파일${loop.index}</td>
				                <td>
									<c:choose>
										<c:when test="${!empty noticeDetail.fileVOList[loop.index - 1]}">
											<a href="javascript:void(0);" class="downloadFile" data-file-no="${noticeDetail.fileVOList[loop.index - 1].fileNo}" data-file-grp-id="${noticeDetail.fileVOList[loop.index - 1].fileGrpId}">${noticeDetail.fileVOList[loop.index - 1].orgnFileNm}</a>
										</c:when>
										<c:otherwise>
											첨부파일 없음
										</c:otherwise>
									</c:choose>
				                </td>
				            </tr>
				        </c:forEach>
				    </table>
				</div>
			</div>
		</div>
	</div>
	<form action="/cmmn/notice/noticeDelete.do" method="post">
	    <input type="hidden" name="ntcNo" value="${noticeDetail.ntcNo}" />
	    <button class="btn btn-danger" type="submit" id="deleteNoitceBtn">삭제</button>
		<button class="btn btn-primary" type="button" id="updateNoticeBtn" data-ntc-no="${noticeDetail.ntcNo}">수정</button>
	</form>
</body>
<script type="text/javascript">

	// 사용자 삭제 메시지
	$('#deleteNoitceBtn').on('click', function (event) {
	    if (!confirm('삭제하시겠습니까?')) {
	        event.preventDefault();
	    }
	});

	// 사용자 수정 패이지
	$('#updateNoticeBtn').on('click', function () {
	    var ntcNo = $(this).data('ntc-no');
	    window.location.href = '/cmmn/notice/noticeUpdateForm.do?ntcNo=' + ntcNo;
	});

	// 첨부파일 다운로드
	$('.downloadFile').on('click', function () {
	    var fileNo = $(this).data('file-no');
	    var fileGrpId = $(this).data('file-grp-id');
	    window.location.href = '/cmmn/notice/downloadFile.do?fileNo=' + fileNo + '&fileGrpId=' + fileGrpId;
	});

</script>
