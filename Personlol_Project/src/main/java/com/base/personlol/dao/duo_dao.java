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
	public String getId(Integer duo_id);

	public void Disable(Integer duo_id);

	public userinfo_dto getUser_lolname(String duo_ownerid);

	public void accept(@Param("duo_id")int duo_id, @Param("user_id") String loginCheck);

	public void convert(@Param("user_id") String loginCheck);
	
	// 라인선택
	public List<Map<String, Object>> all(@Param("start_page") int start_page, @Param("end_page") int end_page);
	
	public List<Map<String, Object>> top(int start_page , int end_page);
	
	public List<Map<String, Object>> jungle(int start_page , int end_page);
	
	public List<Map<String, Object>> mid(int start_page , int end_page);
	
	public List<Map<String, Object>> bottom(int start_page , int end_page);
	
	public List<Map<String, Object>> support(int start_page , int end_page);
	
//티어 x 위 티어 o 아래	
	public List<Map<String, Object>> tier_all(@Param("start_page") int start_page, @Param("end_page") int end_page, @Param("tier") String tier);

	
	
}

