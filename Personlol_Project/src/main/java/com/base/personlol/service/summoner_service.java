package com.base.personlol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.summoner_dao;
import com.base.personlol.dto.summoner_dto;
import com.base.personlol.dto.summoner_rawdata_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class summoner_service {
	@Autowired
	summoner_dao sum_dao;
	
	public summoner_dto getfirstinfo(Map<String, String> summoner_name) {
		System.out.println("MM 가져가냐? firstinfo?: "+summoner_name);
		summoner_dto firstinfo = sum_dao.getsummonerinfo(summoner_name);
		System.out.println("MM가져오냐? firstinfo?");
		return firstinfo;
	}

	public List<String> getGameidsOnRecentGame(String summoner_name) {
		return sum_dao.getGameidsOnRecentGame(summoner_name);
	}

	public List<String> getGameidsOnRawdata(String summoner_name) {
		return sum_dao.getGameidsOnRawdata(summoner_name);
	}

	// <전적 갱신 버튼 활성화 시 사용하지 않을 메소드>
	// summoner_recent_game 테이블에 게임 id를 삽입하기 전 있던 데이터를 지우는 메소드
	public Integer deleteGameidsInRecentGame(String summoner_name) {
		return sum_dao.deleteGameidsInRecentGame(summoner_name);
	}

	// <전적 갱신 버튼 활성화 시 사용하지 않을 메소드>
	// summoner_recent_game 테이블에 최근 20게임의 game_id를 입력하는 메소드
	public void putGameidInRecentGame(String summoner_name, List<String> game_ids) {
		int total_insert_count = 0;
		for (String gid : game_ids) {
			total_insert_count += sum_dao.putGameidInRecentGame(summoner_name, gid);
		}
		log.info("데이터 정상 삽입: {}", total_insert_count); // ### 로그
	}

	public summoner_rawdata_dto getGameRacord(String game_id) {
		return sum_dao.getGameRecord(game_id);
	}

}
