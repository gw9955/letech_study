package kr.letech.study.cmmn.notice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true)
public class PageVO {
	private int startRow;
	private int endRow;
	private int page;
	private int pageSize;
	private int totalPage;
	private int totalCount;

}
