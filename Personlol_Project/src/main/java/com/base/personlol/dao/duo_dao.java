package com.base.personlol.dao;

import java.util.List;

import com.base.personlol.dto.duo_dto;

public interface duo_dao {

	public List<duo_dto> getList();
	
	public boolean duoWrite(duo_dto duo);	
	
	public boolean duoDelete(String duo_id);

	public boolean duoUpdate(duo_dto duo);
	
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
