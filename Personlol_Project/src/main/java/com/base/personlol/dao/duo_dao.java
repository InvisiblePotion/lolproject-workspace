package com.base.personlol.dao;

import java.util.ArrayList;
import java.util.List;

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

	public Integer totalpage();
	
	
}

