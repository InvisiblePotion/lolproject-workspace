package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import com.base.personlol.dto.Example_dto;
import com.base.personlol.dto.Test_member_dto;

public interface Example_dao {
	
	Example_dto testDB(Map<String, Integer> nums);



	int testDB3(Test_member_dto member);
	
}
