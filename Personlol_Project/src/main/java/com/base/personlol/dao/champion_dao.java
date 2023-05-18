package com.base.personlol.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.ChampRune_dto;
import com.base.personlol.dto.Champskill_dto;
import com.base.personlol.dto.champion_dto;

public interface champion_dao {

	List<champion_dto> key_list();

	List<champion_dto> lane_img(String lane);

	List<champion_dto> lane_list(String lane);
	
	//tier 정렬
	
	
	//win rate 정렬
	List<champion_dto> lane_sort_win(@Param("lane") String lane,@Param("sort") String sort);
	
	//pick rate 정렬
	List<champion_dto> lane_sort_pick(@Param("lane") String lane,@Param("sort") String sort);

	//ban rate 정렬
	List<champion_dto> lane_sort_ban(@Param("lane")String lane,@Param("sort") String sort);
	
	//챔피언 검색
	List<champion_dto> search_champ(@Param("searchVal") String searchVal);
	
	
	//챔프 디테일 초기정보
	List<champion_dto> champ_info(Integer champ_id);
	
	//챔프 스킬 초기정보
	List<Champskill_dto> champ_skill(Integer champ_id);
	
	//챔프 스킬트리
	List<Champskill_dto> skill_tree(Integer champ_id);
	
	//챔프 룬
	List<ChampRune_dto> champ_rune(Integer champ_id);
	
	





}
