package com.base.personlol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.summoner_dao;
import com.base.personlol.dto.Main_summoner_dto;
import com.base.personlol.dto.summoner_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class summoner_service {
	@Autowired
	summoner_dao sum_dao;
	
	public summoner_dto getfirstinfo(Map<String, String> summoner_name) {
		//System.out.println("MM 가져가냐? firstinfo?: "+summoner_name);
		summoner_dto firstinfo = sum_dao.getsummonerinfo(summoner_name);
		//System.out.println("MM가져오냐? firstinfo?");
		return firstinfo;
	}
	
	public List<Map<String , ?>> ChampRecord(String summoner_name){
		System.out.println("컨트롤러 유저이름 가져오니?"+summoner_name);
		List<Map<String, ?>> ChampInfo = sum_dao.getChampinfo(summoner_name);
		//System.out.println("챔피언 정보 가져왔니?"+ChampInfo);
		return ChampInfo;
	}

	public List<Map<String, ?>> MainRecord(String summoner_name) {
		List<Map<String, ?>> MainInfo = sum_dao.getMaininfo(summoner_name);
		System.out.println("서비스 메인"+MainInfo);
		return MainInfo;
	}

	//메인 검색 서비스
	public List<Main_summoner_dto> result_summoner(String summoner_name) {
		System.out.println("메인 검색 서비스: "+summoner_name);
		List<Main_summoner_dto> result_summoner = sum_dao.go_search(summoner_name);
		System.out.println("메인 검색 서비스 리턴");
		return result_summoner;
	}

}
