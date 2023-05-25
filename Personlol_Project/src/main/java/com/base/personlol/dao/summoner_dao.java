package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.summoner_dto;
import com.base.personlol.dto.summoner_rawdata_dto;

public interface summoner_dao {

	//초기 정보 가져오기
	summoner_dto getsummonerinfo(Map<String, String> summoner_name);

	Integer isSummonerNameExists(String summoner_name);

	List<String> getGameidsOnRecentGame(String summoner_name);

	List<String> getGameidsOnRawdata(String summoner_name);

	Integer deleteGameidsInRecentGame(String summoner_name);

	Integer putGameidInRecentGame(@Param("summoner_name") String summoner_name,  @Param("game_id") String game_id);

	summoner_rawdata_dto getGameRecord(String game_id);

}
