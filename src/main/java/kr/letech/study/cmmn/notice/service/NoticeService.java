package kr.letech.study.cmmn.notice.service;

import java.io.IOException;
import java.util.List;

import kr.letech.study.cmmn.notice.vo.NoticeVO;
import kr.letech.study.cmmn.user.vo.FileVO;

public interface NoticeService {

	// 게시판 목록 조회
	List<NoticeVO> selectNoticeList(NoticeVO noticeVO);

	// 게시판 전체 게시물 수 조회
	int selectNoticeListCount(NoticeVO noticeVO);

	// 게시판 상세
	NoticeVO selectNoticeDetail(int ntcNo);

	// 첨부파일 다운
	FileVO selectNoticeFile(FileVO fileVO);

	// 게시판 등록
	int insertNotice(NoticeVO noticeVO) throws IOException;

	// 게시판 수정
	int updateNotice(NoticeVO noticeVO) throws IOException;

	// 게시판 삭제
	int deleteNotice(NoticeVO noticeVO);

	// 첨부파일 삭제
	int deleteFile(FileVO fileVO);


}
