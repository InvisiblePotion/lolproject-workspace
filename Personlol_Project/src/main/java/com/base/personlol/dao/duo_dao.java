package com.base.personlol.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.base.personlol.dto.Duo_dto;


public interface duo_dao {

	public ArrayList<Duo_dto> getList();
	
	public boolean duoWrite(Duo_dto duo);	
	
	public boolean duoDelete(Integer duo_id);

	public boolean duoUpdate(Duo_dto duo);
	
	@Select("SELECT COUNT(*) FROM DUO WHERE DUO_ID=#{duo_id}")
	public int getDuoExist(Integer duo_id);
	
	/*
	 * public int duoUpdate(int duo_id);
	 * 
	 * public int duoDelete(int duo_id);
	 */
	/*
	 * public void insertSelectKey(duo_dto duo);
	 * 
	 * public duo_dto read(Long bno);
	 * 
	 * public int delete(Long bno);
	 * 
	 * public int update(duo_dto duo);
	 */
}
