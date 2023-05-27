package com.base.personlol.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.ChampMatch_dto;
import com.base.personlol.dto.ChampRuneCore_dto;
import com.base.personlol.dto.ChampRuneShard_dto;
import com.base.personlol.dto.ChampRuneType_dto;
import com.base.personlol.dto.ChampRune_dto;
import com.base.personlol.dto.ChampSpell_dto;
import com.base.personlol.dto.Champskill_dto;
import com.base.personlol.dto.Item_dto;
import com.base.personlol.dto.Test_raw;
import com.base.personlol.dto.champion_dto;

public interface champion_dao {
	
	//챔프 아이콘 이미지뿌리기 위한 리스트
	List<champion_dto> key_list();
	//챔프 라인별 아이콘 이미지
	List<champion_dto> lane_img(String lane);
	//챔프 라인별 정보 리스트
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
	List<champion_dto> champ_info(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//챔프 스킬 초기정보
	List<Champskill_dto> champ_skill(Integer champ_id);
	
	//챔프 스킬트리
	List<Champskill_dto> skill_tree(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//챔프 룬
	List<ChampRune_dto> champ_rune(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//룬 메인 이미지
	List<ChampRuneType_dto> main_img(Integer main_rune);
	
	//룬 서브 이미지
	List<ChampRuneType_dto> sub_img(Integer sub_rune);
	
	//챔프 코어 이미지
	List<ChampRuneCore_dto> core_img(Integer core_rune);
	
	//챔프 파편 이미지
	List<ChampRuneShard_dto> shard_img();
	
	//아이템 승률 정보
	List<Item_dto> item_build(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//아이템 사진
	List<Item_dto> item_img(Integer item);
	
	//챔프스펠
	List<ChampSpell_dto> champ_spell(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//챔프 스펠 이미지
	List<ChampSpell_dto> champ_spell_img(@Param("spell_img") Integer spell_img);
	
	//챔프 매치업 리스트
	List<ChampMatch_dto> matchup_lst(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//챔프 매치업 이미지 
	List<champion_dto> matchup_champ_img(Integer match_champ);
	
	//챔프 매치업 리스트(어려운)
	List<ChampMatch_dto> matchup_lst_hard(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//챔프 매치업 디테일(매치업 페이지)
	List<ChampMatch_dto> matchup_detail(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane,@Param("match_champ") Integer match_champ);
	
	//챔프 매치업 디테일 이미지(매치업 페이지)
	List<champion_dto> matchup_detail_img(@Param("champ_id") Integer champ_id,@Param("match_champ") Integer match_champ);
	
	//챔프 매치업 디테일(픽,벤,승)
	List<champion_dto> matchup_detail_info(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane,@Param("match_champ") Integer match_champ);
	
	//챔프 매치업 리스트
	List<ChampMatch_dto> matchup_list(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//메인 리스트
	List<champion_dto> mlane_list(@Param("lane") String lane);
	
	//챔프 매치업 상대한 챔프들 정보
	List<champion_dto> matchamp_info(@Param("matchamp_id")Integer matchamp_id,@Param("champ_lane") String champ_lane);
	
	//챔프 리스트 출력에서 카운터정보 추가
	List<champion_dto> counter_info(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	
	

	

	
	

	
	





}
