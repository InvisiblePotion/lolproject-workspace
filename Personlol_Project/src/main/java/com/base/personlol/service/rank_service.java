package com.base.personlol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.rank_dao;
import com.base.personlol.dto.rank_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class rank_service {
	@Autowired
	rank_dao r_dao;

	//랭킹정보 받아오는 ser
	public List<rank_dto> rankinginfo(Map<String, ?> rankdata) {
		//디폴트 페이지 값!
		int page = 1;
		String rank = (String) rankdata.get("rank");
		
		//페이지 값이 null이 아닌 값이 있으면! jsp에서 받아온 값을 사용 
		if(rankdata.get("page")!=null) {
			page = Integer.parseInt((String) rankdata.get("page"));
		}
		// ex (가져온 page (2)*100)-99 = 101
		int start_page = (page*100)-99 ;
		// ex 2*100 = 200 고로 101 부터 200까지
		int end_page =  page * 100;
		
		System.out.println("rank = "+rank+" "+start_page+" "+ " "+end_page);
		List<rank_dto> rankinfo = r_dao.rankinginfo(rank, start_page, end_page);
		System.out.println("ser에 받아와? ");

		return rankinfo;
	}
	
	//최종 페이지 계산
	public Integer highpage(String rank) {
		System.out.println("ser타?page: "+ rank);
		Integer highpage = r_dao.highpage(rank);
		System.out.println("리턴받아와 ser?page: "+ highpage);
		return highpage;
	}
	


}
