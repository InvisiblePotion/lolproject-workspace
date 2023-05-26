package com.base.personlol.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.summoner_dao;
import com.base.personlol.dto.summoner_dto;
import com.base.personlol.dto.summoner_rawdata_dto;

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
	 * Rawdata 테이블에서 해당 게임 ID 리스트에 대한 데이터를 소환사 전적 페이지에 맞춰 가져온다
	 * @param game_id 게임 ID
	 * @return 소환사 전적용 Rawdata DTO
	 * @see controller.R_summoner_Controller.getGameRecord
	 */
	public ArrayList<summoner_rawdata_dto> getGameRacordList(List<String> game_ids) {
		ArrayList<summoner_rawdata_dto> rawdata_list = new ArrayList<>();
		for (String gid : game_ids) {
			for (summoner_rawdata_dto rawdata : sum_dao.getGameRecord(gid)) {
				rawdata_list.add(rawdata);
			}
		}
		return rawdata_list;
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
	 * summoner_recent_game 테이블에 해당 소환사의 최근 20게임에 대한 game_id를 입력한다.
	 * @param summoner_name 소환사 이름
	 * @param game_ids 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.putGameidInRecentGame
	 * @deprecated <h3>전적 갱신 버튼 활성화 시 사용하지 않을 메소드</h3>
	 */
	public void putGameidListInRecentGame(String summoner_name, List<String> game_ids) {
		// 먼저 데이터를 삭제
		sum_dao.deleteGameidsInRecentGame(summoner_name);
		
		// 이후 데이터 삽입
		int total_insert_count = 0;
		for (String gid : game_ids) {
			total_insert_count += sum_dao.putGameidInRecentGame(summoner_name, gid);
		}
		System.out.println("summoner_service.putGameidListInRecentGame() >> 데이터 정상 삽입, 삽입 수: " + total_insert_count); // ### 로그
	}

}
