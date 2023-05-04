package com.base.personlol.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.Test_member_dto;

public interface user_dao {

	//insert
	int testDB3(Test_member_dto member);

	//id중복검사
	int cheackID(String userid);
	
	//code체크
	int cheackCode(String usercode);

	String login(Map<String, String> logindata);
	
	//비밀번호 찾기
	String pwfind(Map<String, String> pwfinddata);
	
	//아이디 찾기
	String idfind(@Param("account") String account, @Param("usercode") String usercode);
	
	//유저코드 검사
	int checknewpw(String usercode);

	//비번 바꾸기
	Integer changepw(Map<String, String> changepwdata);
	
	//회원탈퇴
	Integer deletemember(Map<String, String> userid);

}
