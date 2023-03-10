package kr.letech.study.cmmn.sec.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import kr.letech.study.cmmn.sec.dao.CustomUserDetailsDAO;
import kr.letech.study.cmmn.sec.vo.UserDetailsVO;
import kr.letech.study.cmmn.user.vo.UserVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

	private final CustomUserDetailsDAO userDetailsDAO;

	@Override
	public UserDetails loadUserByUsername(String inputUserId) {

		// 최종적으로 리턴해야할 객체
		UserDetailsVO userDetails = new UserDetailsVO();

		// 사용자 정보 select
		UserVO userVO = this.userDetailsDAO.selectUser(inputUserId);

		// 사용자 정보 없으면 null 처리
		if (userVO == null) {
			return null;

			// 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
		} else {
			userDetails.setUsername(userVO.getUserId());
			userDetails.setPassword(userVO.getUserPw());
			userDetails.setUserVO(userVO);
			userDetails.getUserVO().setUserPw(null);

			// 사용자 권한 select해서 받아온 List<String> 객체 주입
			userDetails.setAuthorities(this.userDetailsDAO.selectUserAuthList(inputUserId));
		}

		return userDetails;
	}
}
