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
	<form action="${CPATH}/cmmn/notice/noticeInsert.do" id="formSubmit"
		method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">게시판 등록</h5>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">종류</label>
							<div class="col-sm-10">
								<select id="ntcCtg">
									<option value="">선택</option>
									<option value="공지사항">공지사항</option>
									<option value="문의사항">문의사항</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" id="ntcTtl" name="ntcTtl" class="form-control">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea id="ntcCon" class="form-control"></textarea>
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">파일1</label>
							<div class="col-sm-10">
								<input type="file" id="file1" name="file1" multiple="multiple" class="form-control">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">파일2</label>
							<div class="col-sm-10">
								<input type="file" id="file2" name="file2" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<button class="btn btn-primary" type="button" id="SubmitBtn">등록</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">

	// 신규 유저 등록 시 유효성 검사
	function validation() {

		if ($('#ntcCtg').val() == "") {
			alert('게시판 종류를 선택해주세요.');
			return false;
		} else if ($('#ntcTtl').val() == "") {
			alert('제목을 입력해주세요');
			return false;
		} else if ($('#ntcCon').val() == "") {
			alert('내용을 입력해주세요.');
			return false;
		}
		return true;

	}

	// 등록버튼 클릭
	$('#SubmitBtn').on('click', function() {
		if (!validation()) {
			return;
		}

		var formData = new FormData();
		formData.append('ntcCtg', $('#ntcCtg').val());
		formData.append('ntcTtl', $('#ntcTtl').val());
		formData.append('ntcCon', $('#ntcCon').val());
		formData.append('files', $('#file1')[0].files[0]);
		formData.append('files', $('#file2')[0].files[0]);

		$.ajax({
			url : '/cmmn/notice/noticeInsert.do',
			type : 'POST',
			data : formData,
			contentType : false,
			processData: false,
			success : function(res) {
				console.log("제출값 담아보기 : " + res);

				if (res > 0) {
					alert('등록완료!');
				} else {
					alert('등록실패!');
				}

				location.href = '/cmmn/notice/noticeList.do';
			},
			error : function(xhr, status, error) {
                alert("에러 발생");
            }
		});
	});
</script>
</html>
