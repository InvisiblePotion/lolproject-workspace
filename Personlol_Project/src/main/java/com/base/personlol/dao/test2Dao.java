package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import com.base.personlol.dto.test2Dto;

public interface test2Dao {
	test2Dto testSum(Map<String, Integer> nums1);

	Integer join(Map<String, Integer> join);
	Integer cheack(Map<String, Integer> s);


}
