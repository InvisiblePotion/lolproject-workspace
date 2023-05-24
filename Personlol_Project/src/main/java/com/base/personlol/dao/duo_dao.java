package com.base.personlol.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.base.personlol.dto.duo_dto;
import com.base.personlol.dto.userinfo_dto;


public interface duo_dao {
	
	//페이징 겸 리스트 가져오기
	public List<duo_dto> getList();
	
	public boolean duoWrite(duo_dto duo);	
	
	
	//kang tae min
	public String getId(int duo_id);
	
	public void Disable(Integer duo_id);

	public userinfo_dto getUser_lolname(String duo_ownerid);

	public void accept(@Param("duo_id")int duo_id, @Param("user_id") String loginCheck);

	public void convert(@Param("user_id") String loginCheck);
	
	// 라인선택
	public List<Map<String, Object>> all(@Param("start_page") int start_page, @Param("end_page") int end_page);
	
	public List<Map<String, Object>> top(@Param("start_page") int start_page , @Param("end_page") int end_page);
	
	public List<Map<String, Object>> jungle(@Param("start_page") int start_page , @Param("end_page") int end_page);
	
	public List<Map<String, Object>> mid(@Param("start_page") int start_page , @Param("end_page") int end_page);
	
	public List<Map<String, Object>> bottom(@Param("start_page") int start_page , @Param("end_page") int end_page);
	
	public List<Map<String, Object>> support(@Param("start_page") int start_page , @Param("end_page") int end_page);
	
//티어 x 위 티어 o 아래	
	public List<Map<String, Object>> tier_all(@Param("start_page") int start_page, @Param("end_page") int end_page, @Param("tier") String tier);

	//듀오 요청 테이블에 삽입
	public Integer request(@Param("user_id") String user_id, @Param("request_id") String request_id);
	
	//active 바꾸기
	public Integer set_active(@Param("user_id") String user_id);
	
	//같은 사람에게 요청했는가
	public int check_request(@Param("user_id") String user_id, @Param("request_id") String request_id);
	
	//글쓰기 중복체크
	public int checkboard(@Param("user_id") String user_id);



	
	
}

