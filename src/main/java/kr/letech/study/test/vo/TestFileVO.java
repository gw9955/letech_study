package kr.letech.study.test.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true)
public class TestFileVO {
	private String userName;
	private MultipartFile[] files;
}
