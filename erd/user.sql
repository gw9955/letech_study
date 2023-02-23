SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS USER_MANAGEMENT;




/* Create Tables */

-- 사용자 관리
CREATE TABLE USER_MANAGEMENT
(
	USER_ID varchar(50) NOT NULL COMMENT '사용자 아이디',
	USER_PW varchar(64) NOT NULL COMMENT '비밀번호',
	USER_NM varchar(50) NOT NULL COMMENT '사용자 이름',
	COM_REG varchar(50) COMMENT '등록자',
	COM_REG_DT datetime COMMENT '등록일시',
	COM_MOD varchar(50) COMMENT '수정자',
	COM_MOD_DT datetime COMMENT '수정일시',
	COM_DELETE varchar(50) COMMENT '삭제여부',
	PRIMARY KEY (USER_ID)
) COMMENT = '사용자 관리';



