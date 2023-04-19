package kr.letech.study.cmmn.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.letech.study.cmmn.notice.vo.NoticeVO;
import kr.letech.study.cmmn.user.vo.FileVO;

@Mapper
public interface NoticeDAO {

	// 게시판 목록 조회
	List<NoticeVO> selectNoticeList(NoticeVO noticeVO);

	// 게시물 총 개수 조회
	int selectNoticeListCount(NoticeVO noticeVO);

	// 게시판 상세
	NoticeVO selectNoticeDetail(int ntcNo);

	// 게시판 첨부파일 목록 조회
	List<FileVO> selectNoticeFileList(int ntcNo);

	// 첨부파일 다운
	FileVO selectNoticeFile(FileVO fileVO);

	// 게시판 등록
	int insertNotice(NoticeVO noticeVO);

	// 게시판 첨부파일 업로드
	void insertUpload(FileVO fileVO);

	// 게시판 수정
	int updateNotice(NoticeVO noticeVO);

	// 게시판 삭제
	int deleteNotice(NoticeVO noticeVO);

	// 첨부파일 삭제
	int deleteFile(FileVO fileVO);





}
