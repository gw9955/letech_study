<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<title>게시판 관리</title>
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시물 수정</h5>
					<form id="formSubmit" action="/cmmn/notice/noticeUpdate.do" method="post" enctype="multipart/form-data">
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">종류</label>
							<div class="col-sm-10">
								<select id="ntcCtg">
									<option value="">선택</option>
									<option value="공지사항" <c:if test="${noticeUpdate.ntcCtg == '공지사항'}">selected</c:if>>공지사항</option>
									<option value="문의사항" <c:if test="${noticeUpdate.ntcCtg == '문의사항'}">selected</c:if>>문의사항</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" id="ntcTtl" name="ntcTtl" value="${noticeUpdate.ntcTtl}" class="form-control">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea id="ntcCon" name="ntcCon" class="form-control">${noticeUpdate.ntcCon}</textarea>
							</div>
						</div>
						<table>
						    <c:forEach varStatus="loop" begin="1" end="2">
						        <tr>
						            <td>파일${loop.index}</td>
						            <td>
						                <c:choose>
						                    <c:when test="${!empty noticeUpdate.fileVOList[loop.index - 1]}">
						                        <a href="javascript:void(0);" class="downloadFile" data-file-no="${noticeUpdate.fileVOList[loop.index - 1].fileNo}" data-file-grp-id="${noticeUpdate.fileVOList[loop.index - 1].fileGrpId}">${noticeUpdate.fileVOList[loop.index - 1].orgnFileNm}</a>
						                        <button type="button" class="btn btn-danger btn-delete-file" data-file-no="${noticeUpdate.fileVOList[loop.index - 1].fileNo}" data-file-grp-id="${noticeUpdate.fileVOList[loop.index - 1].fileGrpId}">삭제</button>
<%-- 						                        <button type="button" class="btn btn-warning btn-edit-file" data-file-no="${noticeUpdate.fileVOList[loop.index - 1].fileNo}" data-file-grp-id="${noticeUpdate.fileVOList[loop.index - 1].fileGrpId}">수정</button> --%>
						                    </c:when>
						                    <c:otherwise>
						                        첨부파일 없음
						                    </c:otherwise>
						                </c:choose>
						            </td>
						        </tr>
						    </c:forEach>
						</table>
						<c:set var="currentFileCount" value="0" />
						<c:forEach items="${noticeUpdate.fileVOList}" var="file" varStatus="status">
						    <c:set var="currentFileCount" value="${currentFileCount + 1}" />
						</c:forEach>
						<c:if test="${currentFileCount < 2}">
						    <input type="file" id="files" name="files" multiple>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
	<button class="btn btn-primary" type="button" id="SubmitBtn" data-ntc-no="${noticeUpdate.ntcNo}">등록</button>
</body>
<script type="text/javascript">

	$(document).ready(function() {

		// 유효성 검사
		function validation() {
	        if ($('#ntcTtl').val() == "") {
	            alert('제목을 입력해주세요.');
	            return false;
	        }
	        if ($('#ntcCon').val() == "") {
	            alert('내용을 입력해주세요.');
	            return false;
	        }
	        return true;
	    }

		// 첨부 파일 변경 시 파일 개수 제한
	    $("#files").on("change", function() {
	        var fileCount = this.files.length;
	        var currentFileCount = ${currentFileCount};
	        var totalFileCount = fileCount + currentFileCount;

	        if (totalFileCount > 2) {
	            alert("최대 2개의 파일만 첨부할 수 있습니다.");
	            this.value = "";
	        }
	    });

		// 등록버튼 클릭
		$('#SubmitBtn').on('click', function() {
			if (!validation()) {
				return;
			}

			// 수정 처리
			var ntcNo = $(this).data('ntc-no');
			var dataObject = {
					ntcNo : ntcNo,
					ntcCtg : $('#ntcCtg').val(),
					ntcTtl : $('#ntcTtl').val(),
					ntcCon : $('#ntcCon').val()
			}

			console.log("넘기는값 : ", dataObject);

			$.ajax({
				url: '/cmmn/notice/noticeUpdate.do',
				type: 'POST',
				data: JSON.stringify(dataObject),
				contentType: 'application/json',
			    dataType: 'text',
				success: function(response) {
					if (response > 0) {
						alert("수정되었습니다.");
						window.location.href = '/cmmn/notice/noticeDetail.do?ntcNo=' + ntcNo;
					} else {
						alert("수정에 실패했습니다.");
					}
				},
				error: function() {
					alert("서버 에러가 발생했습니다.");
				}
			});
		});

	    // 첨부 파일 삭제 버튼 클릭
	    $('.btn-delete-file').on('click', function() {
	        var fileNo = $(this).data('file-no');
	        var fileGrpId = $(this).data('file-grp-id');

	        if (confirm('정말로 파일을 삭제하시겠습니까?')) {
	            deleteFile(fileNo, fileGrpId);
	        }
	    });

	 	// 첨부 파일 수정 버튼 클릭
	    $('.btn-edit-file').on('click', function() {
	        var fileNo = $(this).data('file-no');
	        var fileGrpId = $(this).data('file-grp-id');

	        editFile(fileNo, fileGrpId);
	    });
	});

	function deleteFile(fileNo, fileGrpId) {
	    $.ajax({
	        url: '/cmmn/notice/deleteFile.do',
	        type: 'POST',
	        data: {
	            fileNo: fileNo,
	            fileGrpId: fileGrpId
	        },
	        success: function(response) {
	            if (response > 0) {
	                alert('파일이 삭제되었습니다.');
	                location.reload();
	            } else {
	                alert('파일 삭제에 실패했습니다.');
	            }
	        },
	        error: function() {
	            alert('서버 에러가 발생했습니다.');
	        }
	    });
	}

</script>
</html>
