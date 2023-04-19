package kr.letech.study.cmmn.sec.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;


@RestController
@Slf4j
public class LoginController {

	/* 로그인 화면 요청 */
	@RequestMapping("/cmmn/sec/loginForm.do")
	public ModelAndView loginView(HttpServletRequest request) {

		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = request.getHeader("Referer");
		if (StringUtils.isNotBlank(uri) && !uri.contains("/cmmn/sec/loginForm.do")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}

		ModelAndView mv = new ModelAndView("cmmn/sec/loginForm.tiles");

		return mv;
	}
}
