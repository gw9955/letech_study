package kr.letech.study.test.controller;

import java.text.DateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.letech.study.test.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class TestController {

	private final TestService testService;

	private final MessageSource messageSource;

	@Value("${test.value}")
	private String test;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("TestController test.value : {}", this.test);
		log.info("messageSource : {}", this.messageSource.getMessage("button.search", null, null));

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("testNow", this.testService.selectNow() );

		return "test/test.tiles";
	}

	@RequestMapping(value = "/test/popup", method = RequestMethod.GET)
	public String popup(Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("testNow", this.testService.selectNow() );

		return "test/popup.popup";
	}
}
