package kr.letech.study.cmmn.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true)
public class FileVO {
	private String fileGrpId;		// 파일 그룹ID
	private Integer fileNo;			// 파일 번호
	private String orgnFileNm;		// 원본 파일 명
	private String convFileNm;		// 변환 파일 명
	private long fileSize;			// 파일 크기
	private String fileDiv;			// 파일 구분
	private String rgstId;			// 등록 ID
	private String rgstDt;			// 등록 일시
	private String updtId;			// 수정 ID
	private String updtDt;			// 수정 일시
	private String delYn;			// 삭제 여부
}
