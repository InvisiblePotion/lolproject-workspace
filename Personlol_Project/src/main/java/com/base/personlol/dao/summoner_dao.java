package com.base.personlol.dao;

import java.util.Map;

import com.base.personlol.dto.summoner_dto;

public interface summoner_dao {
	
	
	//초기 정보 가져오기
	summoner_dto getsummonerinfo(Map<String, String> summoner_name);

}
