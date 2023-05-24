package com.base.personlol.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.mypage_dao;
import com.base.personlol.dto.mypage_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class mypage_service {
	@Autowired
	mypage_dao my_dao;
	
	public String getcurcode(String user_id) {
		System.out.println("service: 세션id 받아옴?"+ user_id);
		String selectcode = my_dao.getcurcode(user_id);
		return selectcode;
	}

	//icon
	public mypage_dto getnameicon(String user_id) {
		System.out.println("service: 세션id 받아옴?"+ user_id);
		mypage_dto getnameicon = my_dao.getnameicon(user_id);
		System.out.println("돌아온 mm"+getnameicon);
		return getnameicon;
	}

	public Integer changelolname(Map<String, String> changelolname) {
		System.out.println("mypage넘어오냐?"+changelolname);
		Integer rename_result = my_dao.changelolname(changelolname);
		System.out.println("받아서 돌아오냐 풋? "+rename_result);
		return rename_result;
	}

	public List<Map<String, String>> getrequest(String user_id) {
		System.out.println("req_service userid: "+user_id);
		
		//내 userId로 join해서 요청자 user_lolname가져오기
		List<Map<String, String>> request_lolname = my_dao.request_id(user_id);
		System.out.println("req_ser의 상대lolname: "+request_lolname);
		return request_lolname;
	}

}
