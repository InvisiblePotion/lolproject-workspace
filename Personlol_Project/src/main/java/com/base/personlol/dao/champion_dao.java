package com.base.personlol.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.ChampMatch_dto;
import com.base.personlol.dto.ChampRuneCore_dto;
import com.base.personlol.dto.ChampRuneShard_dto;
import com.base.personlol.dto.ChampRuneType_dto;
import com.base.personlol.dto.ChampRune_dto;
import com.base.personlol.dto.ChampSpell_dto;
import com.base.personlol.dto.ChampStartBoots_dto;
import com.base.personlol.dto.ChampStartItem_dto;
import com.base.personlol.dto.Champskill_dto;
import com.base.personlol.dto.Item_dto;
import com.base.personlol.dto.Test_raw;
import com.base.personlol.dto.champion_dto;

public interface champion_dao {
	
	//梨뷀봽 �븘�씠肄� �씠誘몄�肉뚮━湲� �쐞�븳 由ъ뒪�듃
	List<champion_dto> key_list();
	//梨뷀봽 �씪�씤蹂� �븘�씠肄� �씠誘몄�
	List<champion_dto> lane_img(String lane);
	//梨뷀봽 �씪�씤蹂� �젙蹂� 由ъ뒪�듃
	List<champion_dto> lane_list(String lane);
	
	//tier �젙�젹
	
	
	//win rate �젙�젹
	List<champion_dto> lane_sort_win(@Param("lane") String lane,@Param("sort") String sort);
	
	//pick rate �젙�젹
	List<champion_dto> lane_sort_pick(@Param("lane") String lane,@Param("sort") String sort);

	//ban rate �젙�젹
	List<champion_dto> lane_sort_ban(@Param("lane")String lane,@Param("sort") String sort);
	
	//梨뷀뵾�뼵 寃��깋
	List<champion_dto> search_champ(@Param("searchVal") String searchVal);
	
	
	//梨뷀봽 �뵒�뀒�씪 珥덇린�젙蹂�
	List<champion_dto> champ_info(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//梨뷀봽 �뒪�궗 珥덇린�젙蹂�
	List<Champskill_dto> champ_skill(Integer champ_id);
	
	//梨뷀봽 �뒪�궗�듃由�
	List<Champskill_dto> skill_tree(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//梨뷀봽 猷�
	List<ChampRune_dto> champ_rune(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//猷� 硫붿씤 �씠誘몄�
	List<ChampRuneType_dto> main_img(Integer main_rune);
	
	//猷� �꽌釉� �씠誘몄�
	List<ChampRuneType_dto> sub_img(Integer sub_rune);
	
	//梨뷀봽 肄붿뼱 �씠誘몄�
	List<ChampRuneCore_dto> core_img(Integer core_rune);
	
	//梨뷀봽 �뙆�렪 �씠誘몄�
	List<ChampRuneShard_dto> shard_img();
	
	//�븘�씠�뀥 �듅瑜� �젙蹂�
	List<Item_dto> item_build(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//�븘�씠�뀥 �궗吏�
	List<Item_dto> item_img(Integer item);
	
	//梨뷀봽�뒪�렆
	List<ChampSpell_dto> champ_spell(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//梨뷀봽 �뒪�렆 �씠誘몄�
	List<ChampSpell_dto> champ_spell_img(@Param("spell_img") Integer spell_img);
	
	//梨뷀봽 留ㅼ튂�뾽 由ъ뒪�듃
	List<ChampMatch_dto> matchup_lst(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//梨뷀봽 留ㅼ튂�뾽 �씠誘몄� 
	List<champion_dto> matchup_champ_img(Integer match_champ);
	
	//梨뷀봽 留ㅼ튂�뾽 由ъ뒪�듃(�뼱�젮�슫)
	List<ChampMatch_dto> matchup_lst_hard(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪(留ㅼ튂�뾽 �럹�씠吏�)
	List<ChampMatch_dto> matchup_detail(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane,@Param("match_champ") Integer match_champ);
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪 �씠誘몄�(留ㅼ튂�뾽 �럹�씠吏�)
	List<champion_dto> matchup_detail_img(@Param("champ_id") Integer champ_id,@Param("match_champ") Integer match_champ);
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪(�뵿,踰�,�듅)
	List<champion_dto> matchup_detail_info(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane,@Param("match_champ") Integer match_champ);
	
	//梨뷀봽 留ㅼ튂�뾽 由ъ뒪�듃
	List<ChampMatch_dto> matchup_list(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//硫붿씤 由ъ뒪�듃
	List<champion_dto> mlane_list(@Param("lane") String lane);
	
	//梨뷀봽 留ㅼ튂�뾽 �긽���븳 梨뷀봽�뱾 �젙蹂�
	List<champion_dto> matchamp_info(@Param("matchamp_id")Integer matchamp_id,@Param("champ_lane") String champ_lane);
	
	//梨뷀봽 由ъ뒪�듃 異쒕젰�뿉�꽌 移댁슫�꽣�젙蹂� 異붽�
	List<champion_dto> counter_info(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	//챔피언 시작 아이템
	List<ChampStartItem_dto> start_item(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	// 챔피언 시작 신발
	List<ChampStartBoots_dto> start_boots(@Param("champ_id") Integer champ_id,@Param("champ_lane") String champ_lane);
	
	
	

	

	
	

	
	





}
