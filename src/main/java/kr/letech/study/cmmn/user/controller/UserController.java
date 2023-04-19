package kr.letech.study.cmmn.user.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.letech.study.cmmn.user.service.UserService;
import kr.letech.study.cmmn.user.vo.FileVO;
import kr.letech.study.cmmn.user.vo.SearchUserVO;
import kr.letech.study.cmmn.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;

	// 사용자 목록
	@GetMapping("/cmmn/user/userList.do")
	public String selectUserList(Model model, SearchUserVO searchVO) {

		List<UserVO> userList = this.userService.selectUserList(searchVO);

		model.addAttribute("userList", userList);
		model.addAttribute("searchVO", searchVO);

		return "cmmn/user/userList.tiles";
	}

	// 사용자 상세
	@GetMapping("/cmmn/user/userDetail.do")
	public String selectUserDetail(Model model, String userId) {

		UserVO userDetail = this.userService.selectUserDetail(userId);

		model.addAttribute("userDetail", userDetail);

		return "cmmn/user/userDetail.tiles";
	}

	// 첨부파일 다운로드
	@GetMapping("/cmmn/user/downloadFile.do")
	public void fileDownload(FileVO fileVO, HttpServletResponse response )throws Exception {

		FileVO fileVOInfo = this.userService.selectUserFile(fileVO);

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

	// 사용자 등록 페이지
	@GetMapping("/cmmn/user/userInsertForm.do")
	public String insertUserForm() {

		return "cmmn/user/userInsertForm.tiles";
	}

	// 사용자 등록
	@PostMapping("/cmmn/user/userInsert.do")
	public String insertUser(Model model, UserVO userVO) throws IOException {

		int cnt = this.userService.insertUser(userVO);

		if (cnt == 0) {
			log.info("실패!!");
		}

		return "redirect:/cmmn/user/userDetail.do?userId=" + userVO.getUserId();
	}

	// 사용자 수정 페이지
	@GetMapping("/cmmn/user/userUpdateForm.do")
	public String updateUserForm(Model model, String userId) {

		UserVO userDetail = this.userService.selectUserDetail(userId);

		model.addAttribute("userDetail", userDetail);

		return "cmmn/user/userUpdateForm.tiles";
	}

	// 사용자 수정
	@PostMapping("/cmmn/user/userUpdate.do")
	public String updateUser(Model model, UserVO userVO) {

		int cnt = this.userService.updateUser(userVO);

		if (cnt == 0) {
			log.info("실패!!");
		}

		return "redirect:/cmmn/user/userDetail.do?userId=" + userVO.getUserId();
	}

	// 사용자 삭제
	@PostMapping("/cmmn/user/userDelete.do")
	public String deleteUser(Model model, UserVO userVO) {
		log.info("userVO : {}", userVO);

		int cnt = this.userService.deleteUser(userVO);

		if (cnt == 0) {
			log.info("실패!!");
		}

		return "redirect:/cmmn/user/userList.do";
	}

}
