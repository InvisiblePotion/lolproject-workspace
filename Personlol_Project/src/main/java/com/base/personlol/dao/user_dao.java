package com.base.personlol.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.userinfo_dto;

public interface user_dao {

	//회원가입 insert
	int insertinfo(userinfo_dto userinfo);
	
	//아이디 중복검사
	int cheackID(String userid);
	
	//코드 중복검사
	int checkCode(String usercode);
	
	//롤네임 중복검사
	int checkuser_lolname(String user_lolname);

	//아이디 찾기
	String idfind(@Param("user_lolname")String user_lolname, @Param("user_code")String user_code);

	//비밀번호 찾기
	String pwfind(Map<String, String> pwfinddata);
	
	//비번 바꾸기
	Integer changepw(Map<String, String> changepwdata);
	
	//유저코드 검사
	int checknewpw(String usercode);
	
	//로그인
	String login(Map<String, String> logindata);

	//회원탈퇴
	Integer deletemember(Map<String, String> userid);
	
	//유저코드 업데이트
	Integer newcode(Map<String, String> id);



}
