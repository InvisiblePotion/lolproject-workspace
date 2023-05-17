package com.base.personlol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.HomeController;
import com.base.personlol.dto.test2Dto;

import lombok.extern.slf4j.Slf4j;
@Slf4j

@Service
public class test2MM {
	@Autowired
	com.base.personlol.dao.test2Dao test2Dao;
	
	public String test_obj() {
		String d = "asdasd";
		System.out.println("MM-> d:"+d);
		return d;
	}

	public test2Dto testSum(Map<String, Integer> nums1) {
		System.out.println("요기는 MMsum:"+nums1);
		return test2Dao.testSum(nums1);
	}

	public Integer join(Map<String, Integer> join) {
		System.out.println("joinMM"+join);
		System.out.println(A(join));
		Integer re = A(join);	//중복확인 값 중복값 or null 
		if(re != null) {
			System.out.println("중복오류");
			return 0;
		}else {
			return test2Dao.join(join); //insert 진행
		}
	}
	
	private Integer A(Map<String, Integer> s) {
		return test2Dao.cheack(s);
	}

}
