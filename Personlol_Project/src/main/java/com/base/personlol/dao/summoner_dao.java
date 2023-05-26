package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.Main_summoner_dto;
import com.base.personlol.dto.summoner_dto;

public interface summoner_dao {
	
	
	//초기 정보 가져오기
	summoner_dto getsummonerinfo(Map<String, String> summoner_name);
	
	//소환사 모든 게임 전적 가져오기
	List<Map<String,?>> getChampinfo(@Param("summoner_name") String summoner_name);
	
	//소환사 전적 메인글 가져오기
	List<Map<String, ?>> getMaininfo(@Param("summoner_name") String summoner_name);
	
	//소환사 검색
	List<Main_summoner_dto> go_search(@Param("summoner_name") String summoner_name);

	
	
}
