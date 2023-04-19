package kr.letech.study.cmmn.notice.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.letech.study.cmmn.notice.service.NoticeService;
import kr.letech.study.cmmn.notice.vo.NoticeVO;
import kr.letech.study.cmmn.user.vo.FileVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;

	// 게시판 목록 조회 데이터 가져오기
	@ResponseBody
	@GetMapping("/cmmn/notice/list.do")
	public Map<String, Object> selectNoticeList(NoticeVO noticeVO) {

		int totalCount = this.noticeService.selectNoticeListCount(noticeVO);

		noticeVO.setTotalCount(totalCount);
		noticeVO.setStartRow((noticeVO.getPage() - 1) * noticeVO.getPageSize());
		noticeVO.setEndRow(noticeVO.getStartRow() + noticeVO.getPageSize() - 1);

		List<NoticeVO> list = this.noticeService.selectNoticeList(noticeVO);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);

		return resultMap;
	}

	// 게시판 목록 조회 데이터 뿌리기
	@GetMapping("/cmmn/notice/noticeList.do")
	public String selectNoticeList() {

		return "cmmn/notice/noticeList.tiles";
	}

	// 게시판 상세
	@GetMapping("/cmmn/notice/noticeDetail.do")
	public String selectNoticeDetail(Model model, Integer ntcNo) {

		NoticeVO noticeDetail = this.noticeService.selectNoticeDetail(ntcNo);

		model.addAttribute("noticeDetail", noticeDetail);

		return "cmmn/notice/noticeDetail.tiles";
	}

	// 첨부파일 다운로드
	@GetMapping("/cmmn/notice/downloadFile.do")
	public void fileDownload(FileVO fileVO, HttpServletResponse response )throws Exception {

		log.info("파일정보1 : " + fileVO);

		FileVO fileVOInfo = this.noticeService.selectNoticeFile(fileVO);

		log.info("파일정보2 : " + fileVOInfo);

		// fileInfo로 DB에서 파일경로, 이름 등의 정보 가져오기
		String convFileNm = fileVOInfo.getConvFileNm();
		String orgnFileNm = fileVOInfo.getOrgnFileNm();

		// 파일 경로에서 자료에 대한 체크
		String filePath = convFileNm;
		FileInputStream fis = null;
		OutputStream ous = null;
		try {
			fis = new FileInputStream(filePath);

			// 파일 다운로드 헤더 지정
			response.reset();

			// 한글 파일명 처리
			String orgfilename = new String(orgnFileNm.getBytes("utf-8"),"iso-8859-1");

			response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
			response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");

			ous = response.getOutputStream();

			IOUtils.copy(fis, ous);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(fis, ous);
		}
	}

	// 게시판 등록 페이지
	@GetMapping("/cmmn/notice/noticeInsertForm.do")
	public String insertNoticeForm() {

		return "cmmn/notice/noticeInsertForm.tiles";
	}

	// 게시판 등록
	@ResponseBody
	@PostMapping("/cmmn/notice/noticeInsert.do")
	public int insertNotice(NoticeVO noticeVO) throws IOException {

		int cnt = this.noticeService.insertNotice(noticeVO);

		if (cnt == 0) {
			log.error("실패!!");
		}

		return cnt;
	}

	// 게시판 수정 페이지
	@GetMapping("/cmmn/notice/noticeUpdateForm.do")
	public String updateUserForm(Model model, Integer ntcNo) {

		NoticeVO noticeUpdate = this.noticeService.selectNoticeDetail(ntcNo);

		model.addAttribute("noticeUpdate", noticeUpdate);

		return "cmmn/notice/noticeUpdateForm.tiles";
	}

	// 게시판 수정
	@ResponseBody
	@PostMapping("/cmmn/notice/noticeUpdate.do")
	public String updateUser(@RequestBody NoticeVO noticeVO) throws IOException {

		int cnt = this.noticeService.updateNotice(noticeVO);

		if (cnt == 0) {
			log.error("실패!!");
		}

		return String.valueOf(cnt);
	}

	// 파일 삭제
	@PostMapping("/cmmn/notice/deleteFile.do")
	@ResponseBody
	public String deleteFile(FileVO fileVO) {
		int cnt = this.noticeService.deleteFile(fileVO);

		if (cnt == 0) {
			log.error("파일 삭제 실패!");
		}

		return String.valueOf(cnt);
	}

	// 게시판 삭제
	@PostMapping("/cmmn/notice/noticeDelete.do")
	public String deleteUser(Model model, NoticeVO noticeVO) {
		log.info("noticeVO : {}", noticeVO);

		int cnt = this.noticeService.deleteNotice(noticeVO);

		if (cnt == 0) {
			log.error("실패!!");
		}

		return "redirect:/cmmn/notice/noticeList.do";
	}

}
