package com.base.personlol.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.dao.duo_dao;
import com.base.personlol.dto.duo_dto;
import com.base.personlol.dto.rank_dto;
import com.base.personlol.dto.userinfo_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class duo_service {
	
	@Autowired
	duo_dao ddao;
	
	public List<duo_dto> getList() {
		List<duo_dto> dList=null;
		dList=ddao.getList();
		
		return dList;
	}	
	
//	public List<Duo_dto> getList() {
//		
//		int page = 1;
//		
//		// ex (가져온 page (2)*100)-99 = 101
//		int start_page = (page*18)-17 ;
//		// ex 2*100 = 200 고로 101 부터 200까지
//		int end_page =  page * 18;
//		
//		System.out.println(start_page+" "+ " "+end_page);
//		List<Duo_dto> dList = ddao.getList(start_page, end_page);
//		System.out.println("ser에 받아와? ");
//		
//		return dList;
//	}
	
	
	
	public boolean duoWrite(duo_dto duo) {
		return ddao.duoWrite(duo);
	}
	
	
	//kang tae min
	public String getId(Integer duo_id) {
		System.out.println("service 작동중.."+duo_id);
		return ddao.getId(duo_id);
	}

	public void Disable(Integer duo_id) {
		ddao.Disable(duo_id);
	}
	
	//
	public userinfo_dto getUserInfo(String duo_ownerid) {
	    userinfo_dto userInfo = ddao.getUser_lolname(duo_ownerid);
	    // 나머지 사용자 정보 설정...
	    return userInfo;
	}

	public void accept(int duo_id, String loginCheck) {
		ddao.accept(duo_id, loginCheck);
		
	}

	public void convert(String loginCheck) {
		ddao.convert(loginCheck);
		
	}


	//최종 페이지 계산
	public Integer totalpage() {
		System.out.println("ser타?page: ");
		Integer totalpage = ddao.totalpage();
		System.out.println("리턴받아와 ser?page: "+ totalpage);
		return totalpage;
	}
	
	
	

}

