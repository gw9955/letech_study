package kr.letech.study.cmmn.notice.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.letech.study.cmmn.notice.dao.NoticeDAO;
import kr.letech.study.cmmn.notice.service.NoticeService;
import kr.letech.study.cmmn.notice.vo.NoticeVO;
import kr.letech.study.cmmn.user.vo.FileVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class NoticeServiceImpl implements NoticeService {

	private final NoticeDAO noticeDAO;
	private String uploadRootPath;
	private SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");

	// 게시판 목록 조회
	@Override
	public List<NoticeVO> selectNoticeList(NoticeVO noticeVO) {
		return this.noticeDAO.selectNoticeList(noticeVO);
	}

	// 게시판 총 개수 조회
	@Override
	public int selectNoticeListCount(NoticeVO noticeVO) {
		return this.noticeDAO.selectNoticeListCount(noticeVO);
	}

	// 게시판 상세
	@Override
	public NoticeVO selectNoticeDetail(int ntcNo) {
		NoticeVO noticeVO = this.noticeDAO.selectNoticeDetail(ntcNo);
		List<FileVO> fileVOList = this.noticeDAO.selectNoticeFileList(ntcNo);
		noticeVO.setFileVOList(fileVOList);

		return noticeVO;
	}

	// 첨부파일 다운로드
	@Override
	public FileVO selectNoticeFile(FileVO fileVO) {
		return this.noticeDAO.selectNoticeFile(fileVO);
	}

	// 게시판 등록
	@Override
	public int insertNotice(NoticeVO noticeVO) throws IOException {

		this.uploadFiles(noticeVO);

		return this.noticeDAO.insertNotice(noticeVO);
	}

	// 첨부파일 업로드
	public void uploadFiles(NoticeVO noticeVO) throws IOException {

		OutputStream ous = null;
		MultipartFile[] files = noticeVO.getFiles();
		String fileGrpId = UUID.randomUUID().toString();
		FileVO fileVO = new FileVO(); // UserFileVO 객체 생성

		for (MultipartFile file : files) {

			try {
				InputStream in = file.getInputStream();

				String saveDir = this.uploadRootPath + this.sdf.format(new Date());
				File saveFile = new File(saveDir);
				if (!saveFile.exists()) {
					saveFile.mkdirs();
				}

				String convFileNm = UUID.randomUUID().toString();

				String filePath = saveDir + convFileNm;

				ous = new FileOutputStream(filePath);

				IOUtils.copy(in, ous);
				//				file.transferTo(saveFile); // 이렇게도 가능하다 output 필요 x

				noticeVO.setPhtFileGrpId(fileGrpId);
				fileVO.setFileGrpId(fileGrpId);
				fileVO.setConvFileNm(filePath);
				fileVO.setOrgnFileNm(file.getOriginalFilename());
				fileVO.setFileSize(file.getSize());
				noticeVO.getFileVOList().add(fileVO); // UserVO의 List에 UserFileVO 추가

				this.noticeDAO.insertUpload(fileVO);

			} catch (FileNotFoundException e) {
				throw e;
			} catch (IOException e) {
				throw e;
			} finally {
				IOUtils.closeQuietly(ous);
			}
		}
	}

	// 게시판 수정
	@Override
	public int updateNotice(NoticeVO noticeVO) throws IOException {
		return this.noticeDAO.updateNotice(noticeVO);
	}

	// 첨부파일 삭제
	@Override
	public int deleteFile(FileVO fileVO) {
		return this.noticeDAO.deleteFile(fileVO);
	}

	// 게시판 삭제
	@Override
	public int deleteNotice(NoticeVO noticeVO) {
		return this.noticeDAO.deleteNotice(noticeVO);
	}

}
