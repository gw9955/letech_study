package kr.letech.study.cmmn.notice.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.letech.study.cmmn.user.vo.FileVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true)
public class NoticeVO extends PageVO {
	private int ntcNo;
	private String ntcCtg;
	private String userId;
	private String ntcTtl;
	private String ntcCon;
	private String ntcHt;
	private String phtFileGrpId;
	private String rgstId;
	private String rgstDt;
	private String updtId;
	private String updtDt;
	private String delYn;
	private MultipartFile[] files;

	private List<FileVO> fileVOList = new ArrayList<FileVO>();
}
