package kr.letech.study.cmmn.sec.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.letech.study.cmmn.user.vo.UserVO;

@Mapper
public interface CustomUserDetailsDAO {
	UserVO selectUser(String userId);

	List<String> selectUserAuthList(String userId);
}
