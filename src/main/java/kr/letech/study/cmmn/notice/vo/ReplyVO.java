package kr.letech.study.cmmn.notice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true)
public class ReplyVO {
	private int qnaRpNo;
	private int ntcNo;
	private String ntcCtg;
	private String userId;
	private String qnaRpCon;
	private String rgstId;
	private String rgstDt;
	private String updtId;
	private String updtDt;
	private String delYn;
}
