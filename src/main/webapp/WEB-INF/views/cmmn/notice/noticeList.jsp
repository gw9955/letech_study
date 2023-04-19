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
					<h5 class="card-title">게시물 검색</h5>

					<div id="srchFrm">
					    <div class="row mb-3">
					        <label for="ntcTtl" class="col-sm-4 col-md-2 col-form-label">제목</label>
					        <div class="col-sm-8 col-md-4">
					            <input id="ntcTtl" type="text" name="ntcTtl" class="form-control" value="${noticeVO.ntcTtl}">
					        </div>
					    </div>
					    <div class="row float-end mt-2">
					        <button id="searchBtn" class="btn btn-primary" type="button">검색</button>
					    </div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시판 목록</h5>

					<table class="table table-hover">
						<caption class="d-none">게시판 목록(번호, 분류, 제목, 등록자, 등록일자)</caption>
						<thead>
							<tr class="text-center">
								<th scope="col">No.</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col">등록자</th>
								<th scope="col">등록일자</th>
							</tr>
						</thead>
						<tbody id="noticeList" class="text-center">
						</tbody>
					</table>
					<button class="btn btn-primary" type="button" id="newNoticeBtn">게시판 등록</button>
					<!-- 페이지 버튼 추가 -->
					<div class="row">
					    <div class="col text-center">
					        <div id="pagination"></div>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">

$(document).ready(function () {

    function createElementWithText(tag, text) {
        var element = document.createElement(tag);
        element.textContent = text;
        return element;
    }

    function updatePagination(totalCount, currentPage, pageSize) {
        var totalPages = Math.ceil(totalCount / pageSize);
        var pagination = $('#pagination');

        pagination.empty();

        for (var i = 1; i <= totalPages; i++) {
            var pageBtn = $('<button>')
                .addClass('btn btn-outline-secondary')
                .attr('type', 'button')
                .text(i)
                .data('page', i);

            if (i === currentPage) {
                pageBtn.addClass('active');
            }

            pagination.append(pageBtn);
        }
    }

    function loadNoticeList(searchTitle, page, pageSize) {
    	var requestData = {
    	        ntcTtl: searchTitle || '',
    	        page: page || 1,
    	        pageSize: pageSize || 10
    	    };

        $.ajax({
            url: '/cmmn/notice/list.do',
            type: 'GET',
            data: requestData,
            contentType: 'application/json;charset=utf-8',
            dataType: 'JSON',
            success: function (data) {
                var noticeList = $('#noticeList');
                noticeList.empty();

                var startIndex = (requestData.page - 1) * requestData.pageSize + 1;

                data.list.forEach(function (item, index) {
                    var tr = $('<tr>').addClass('detailForm').css('cursor', 'pointer');

                    var currentNo = startIndex + index;
                    var tdNo = createElementWithText('td', currentNo);
                    tdNo.classList.add('checkNtcNo');
                    tdNo.setAttribute('value', item.ntcNo);

                    var tdCtg = createElementWithText('td', item.ntcCtg);
                    var tdTitle = createElementWithText('td', item.ntcTtl);
                    var tdId = createElementWithText('td', item.rgstId || '');
                    var tdDate = createElementWithText('td', item.rgstDt);

                    tr.append(tdNo, tdCtg, tdTitle, tdId, tdDate);
                    noticeList.append(tr);
                });
				// 페이징 처리 코드
				updatePagination(data.totalCount, requestData.page, requestData.pageSize);
            }
        });
    }

 	// 페이지 버튼 클릭 시
    $('#pagination').on('click', 'button', function () {
	    var searchTitle = $('#ntcTtl').val();
	    var page = parseInt($(this).data('page'), 10);
	    var pageSize = 10;

	    loadNoticeList(searchTitle, page, pageSize);
	});

    // 게시판 목록 초기 로드
    loadNoticeList();

    // 게시판 상세 페이지 이동
    $('#noticeList').on('click', '.detailForm', function () {
        var ntcNo = $(this).find('.checkNtcNo').attr('value');
        window.location.href = '/cmmn/notice/noticeDetail.do?ntcNo=' + ntcNo;
    });

    // 아래와 같이 body자체를 불러와서 사용할 수 있다
// 	$('body').on('click', '.detailForm', function () {
// 		var ntcNo = $(this).find('.checkNtcNo').attr('value');
// 	    window.location.href = '/cmmn/notice/noticeDetail.do?ntcNo=' + ntcNo;
// 	});

    // 검색
    $('#searchBtn').on('click', function () {
        var ntcTtl = $('#ntcTtl').val();
        loadNoticeList(ntcTtl);
    });

    // 게시판 등록 페이지 이동
    $('#newNoticeBtn').on('click', function () {
        window.location.href = '/cmmn/notice/noticeInsertForm.do';
    });
});

</script>
