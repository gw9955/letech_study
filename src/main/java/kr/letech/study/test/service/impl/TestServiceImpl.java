package kr.letech.study.test.service.impl;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import kr.letech.study.test.dao.TestDAO;
import kr.letech.study.test.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class TestServiceImpl implements TestService {
	
	private final TestDAO testDAO;
	
	private final MessageSource messageSource;
	
	@Override
	public String selectNow() {
		log.info("messageSource : {}", messageSource.getMessage("button.search", null, null));
		
		return testDAO.selectNow();
	}
	
}
