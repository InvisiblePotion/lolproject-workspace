package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.mypage_dto;

public interface mypage_dao {
	
	//현재 코드 받아오기
	String getcurcode(String user_id);
	
	//시작마이페이지 정보 받아오기
	mypage_dto getnameicon(@Param("user_id")String user_id);
	
	//lol네임 바꾸기
	Integer changelolname(Map<String, String> changelolname);
	
	//듀오 요청 들어온거
	List<Map<String, String>> request_id(@Param("user_id") String user_id);
	
	

}
