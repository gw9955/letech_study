package kr.letech.study.cmmn.user.service;

import java.io.IOException;
import java.util.List;

import kr.letech.study.cmmn.user.vo.SearchUserVO;
import kr.letech.study.cmmn.user.vo.UserVO;

public interface UserService {

	// 사용자 목록
	List<UserVO> selectUserList(SearchUserVO searchVO);

	// 사용자 상세
	UserVO selectUserDetail(String userId);

	// 사용자 등록
	int insertUser(UserVO userVO);

	// 첨부파일 등록
	int insertUpload(UserVO userVO) throws IOException;

	// 사용자 수정
	int updateUser(UserVO userVO);

	// 사용자 삭제
	int deleteUser(UserVO userVO);

}
