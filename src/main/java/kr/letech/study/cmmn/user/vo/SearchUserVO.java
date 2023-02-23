package kr.letech.study.cmmn.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true)
public class SearchUserVO {
	private String userId;		// 사용자 아이디
	private String userNm;		// 사용자 이름
}
