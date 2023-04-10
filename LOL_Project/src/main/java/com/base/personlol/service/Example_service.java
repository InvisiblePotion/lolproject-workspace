package com.base.personlol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.Example_dao;
import com.base.personlol.dto.Example_dto;

@Service
public class Example_service {
	
	@Autowired
	Example_dao ex_dao;
	
	public Example_dto testDB(Map<String, Integer> nums) {
		return ex_dao.testDB(nums);
	}
	
}
