package com.base.personlol.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.Main_summoner_dto;
import com.base.personlol.dto.summoner_dto;
import com.base.personlol.dto.summoner_rawdata_dto;

public interface summoner_dao {

	//초기 정보 가져오기
	summoner_dto getsummonerinfo(Map<String, String> summoner_name);
	
	//소환사 모든 게임 전적 가져오기
	List<Map<String,?>> getChampinfo(@Param("summoner_name") String summoner_name);
	
	//소환사 전적 메인글 가져오기
	List<Map<String, ?>> getMaininfo(@Param("summoner_name") String summoner_name);
	
	//소환사 검색
	List<Main_summoner_dto> go_search(@Param("summoner_name") String summoner_name);
  
  // ### 이 위치 아래로 230525-invisible-server로 부터 추가된 코드
  
	/**
	 * Rawdata 테이블에서 해당 게임 ID의 데이터를 소환사 전적 페이지에 맞춰 가져온다
	 * @param game_id 게임 ID
	 * @return 소환사 전적용 Rawdata DTO
	 * @see controller.R_summoner_Controller.getGameRecord
	 */
	ArrayList<summoner_rawdata_dto> getGameRecord(String game_id);

	/**
	 * Summoner 테이블에 해당 소환사 이름이 존재하는지 확인
	 * @param summoner_name 소환사 이름
	 * @return 검색된 레코드 수 (0 또는 그 이상)
	 */
	Integer isSummonerNameExists(String summoner_name);

	/**
	 * summoner_recent_game 테이블로부터 최근 게임 ID 20개를 가져온다
	 * @param summoner_name 소환사 이름
	 * @return 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.getGameids
	 */
	List<String> getGameidsOnRecentGame(String summoner_name);

	/**
	 * Rawdata 테이블로부터 최근 게임 ID 20개를 가져온다
	 * @param summoner_name 소환사 이름
	 * @return 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.getGameids
	 */
	List<String> getGameidsOnRawdata(String summoner_name);

	/**
	 * summoner_recent_game 테이블에서 해당 소환사 이름이 들어간 레코드를 전부 삭제한다.
	 * @param summoner_name 소환사 이름
	 * @return 지워진 레코드 수
	 * @see controller.R_summoner_Controller.deleteGameidsInRecentGame
	 * @deprecated <h3>전적 갱신 버튼 활성화 시 사용하지 않을 메소드</h3>
	 */
	Integer deleteGameidsInRecentGame(String summoner_name);

	/**
	 * summoner_recent_game 테이블에 소환사 이름과 game_id를 입력한다.
	 * @param summoner_name 소환사 이름
	 * @param game_ids 게임 ID의 리스트
	 * @see controller.R_summoner_Controller.putGameidInRecentGame
	 * @deprecated <h3>전적 갱신 버튼 활성화 시 사용하지 않을 메소드</h3>
	 */
	Integer putGameidInRecentGame(@Param("summoner_name") String summoner_name,  @Param("game_id") String game_id);

}
