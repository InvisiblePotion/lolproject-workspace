package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.duo_dto;
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
	
	//내 글 불러오기
	duo_dto getmyboard(@Param("user_id") String user_id);
	
	//마이페이지 글 삭제
	int go_deleteboard(@Param("user_id") String user_id);
	
	//듀오 요청 삭제하기
	int delrequest(@Param("request_id") String request_id, @Param("user_id") String user_id);
	
	//user_lolname-> request_id로
	String getuser_id(@Param("user_lolname") String user_lolname);
	
	//user_id에 해당하는 모든 정보 del
	int useralldel(String user_id);

	//업데이트 듀오 수락
	int go_update_duo(@Param("user_id") String user_id, @Param("request_id") String request_id);
	
	//나의 듀오 불러오기
	List<mypage_dto> getmyduo(String user_id);
	
	

}
