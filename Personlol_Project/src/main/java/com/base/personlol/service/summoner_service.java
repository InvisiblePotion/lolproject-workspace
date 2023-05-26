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

	/**
	 * Rawdata 테이블에서 해당 게임 ID의 데이터를 소환사 전적 페이지에 맞춰 가져온다
	 * @param game_id 게임 ID
	 * @return 소환사 전적용 Rawdata DTO
	 * @see controller.R_summoner_Controller.getGameRecord
	 */
	public summoner_rawdata_dto getGameRacordList(String game_id) { // 리턴 값 리스트로 수정 후 DAO 반영할것
		return sum_dao.getGameRecord(game_id);
	}

	/**
	 * Summoner 테이블에 해당 소환사 이름이 존재하는지 확인한다
	 * @param summoner_name 소환사 이름
	 * @return Summoner 테이블에서 해당 소환사의 존재 여부
	 * @see controller.summoner_Controller.summonerinfo
	 */
	public boolean isSummonerNameExistsInSummoner(String summoner_name) {
		if (0 != sum_dao.isSummonerNameExists(summoner_name)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * summoner_recent_game 테이블로부터 최근 게임 ID 20개를 가져온다
	 * @param summoner_name 소환사 이름
	 * @return 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.getGameids
	 */
	public List<String> getGameidsOnRecentGame(String summoner_name) {
		return sum_dao.getGameidsOnRecentGame(summoner_name);
	}

	/**
	 * Rawdata 테이블로부터 최근 게임 ID 20개를 가져온다
	 * @param summoner_name 소환사 이름
	 * @return 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.getGameids
	 */
	public List<String> getGameidsOnRawdata(String summoner_name) {
		return sum_dao.getGameidsOnRawdata(summoner_name);
	}

	/**
	 * summoner_recent_game 테이블에서 해당 소환사 이름이 들어간 레코드를 전부 삭제한다.
	 * @param summoner_name 소환사 이름
	 * @return 지워진 레코드 수
	 * @see controller.R_summoner_Controller.deleteGameidsInRecentGame
	 * @deprecated <h3>전적 갱신 버튼 활성화 시 사용하지 않을 메소드</h3>
	 */
	public Integer deleteGameidsInRecentGame(String summoner_name) {
		return sum_dao.deleteGameidsInRecentGame(summoner_name);
	}

	/**
	 * summoner_recent_game 테이블에 최근 20게임의 game_id를 입력한다.
	 * @param summoner_name 소환사 이름
	 * @param game_ids 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.putGameidInRecentGame
	 * @deprecated <h3>전적 갱신 버튼 활성화 시 사용하지 않을 메소드</h3>
	 */
	public void putGameidInRecentGame(String summoner_name, List<String> game_ids) {
		int total_insert_count = 0;
		for (String gid : game_ids) {
			total_insert_count += sum_dao.putGameidInRecentGame(summoner_name, gid);
		}
		log.info("데이터 정상 삽입: {}", total_insert_count); // ### 로그
	}

}
