package kr.letech.study.cmmn.user.service.impl;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.letech.study.cmmn.user.dao.UserDAO;
import kr.letech.study.cmmn.user.service.UserService;
import kr.letech.study.cmmn.user.vo.FileVO;
import kr.letech.study.cmmn.user.vo.SearchUserVO;
import kr.letech.study.cmmn.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class UserServiceImpl implements UserService {

	private final UserDAO userDAO;
	private final PasswordEncoder passwordEncoder;
	@Value("${upload.root.path}")
	private String uploadRootPath;
	private SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");

	// 사용자 목록
	@Override
	public List<UserVO> selectUserList(SearchUserVO searchVO) {
		return this.userDAO.selectUserList(searchVO);
	}

	// 사용자 상세
	@Override
	public UserVO selectUserDetail(String userId) {
		return this.userDAO.selectUserDetail(userId);
	}

	// 사용자 등록
	@Override
	public int insertUser(UserVO userVO) {
		String userPw = userVO.getUserPw();
		String convUserPw = this.passwordEncoder.encode(userPw);
		userVO.setUserPw(convUserPw);

		return this.userDAO.insertUser(userVO);
	}

	// 첨부파일 등록
	@Override
	public int insertUpload(UserVO userVO) throws IOException {

		OutputStream out = null;
		MultipartFile[] files = userVO.getFiles();

		for (MultipartFile file : files) {

			try {
				InputStream in = file.getInputStream();

				String saveDir = this.uploadRootPath + this.sdf.format(new Date());
				File saveFile = new File(saveDir);
				if (!saveFile.exists()) {
					saveFile.mkdirs();
				}

				String convFileNm = UUID.randomUUID().toString();
				String fileGrpId = UUID.randomUUID().toString();

				String filePath = saveDir + convFileNm;

				out = new FileOutputStream(filePath);

				IOUtils.copy(in, out);

				FileVO fileVO = new FileVO(); // UserFileVO 객체 생성
				fileVO.setFileGrpId(fileGrpId);
				fileVO.setConvFileNm(convFileNm);
				fileVO.setOrgnFileNm(file.getOriginalFilename());
				fileVO.setFileSize(file.getSize());
				fileVO.setFileDiv(file.getContentType());

				log.debug(fileVO.toString());

			} catch (FileNotFoundException e) {
				throw e;
			} catch (IOException e) {
				throw e;
			} finally {
				IOUtils.closeQuietly(out);
			}
		}

		return this.userDAO.insertUpload(fileVO);
	}

	// 사용자 수정
	@Override
	public int updateUser(UserVO userVO) {
		String userPw = userVO.getUserPw();
		String convUserPw = this.passwordEncoder.encode(userPw);
		userVO.setUserPw(convUserPw);
		return this.userDAO.updateUser(userVO);
	}

	// 사용자 삭제
	@Override
	public int deleteUser(UserVO userVO) {
		return this.userDAO.deleteUser(userVO);
	}

}
