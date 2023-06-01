package com.base.personlol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.champion_dao;
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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class champion_service {
	
	@Autowired
	champion_dao champ_dao;

	public List<champion_dto> key_list() {
		List<champion_dto> keyList = null;
		keyList = champ_dao.key_list();
		
		return keyList;
	}

	public List<champion_dto> top_img(String lane) {
		List<champion_dto> topimg = null;
		topimg = champ_dao.lane_img(lane);
		
		return topimg;
	}

	public List<champion_dto> jug_img(String lane) {
		List<champion_dto> jugimg = null;
		jugimg = champ_dao.lane_img(lane);
		
		return jugimg;
	}

	public List<champion_dto> mid_img(String lane) {
		List<champion_dto> midimg = null;
		midimg = champ_dao.lane_img(lane);
		return midimg;
	}

	public List<champion_dto> bot_img(String lane) {
		List<champion_dto> botimg = null;
		botimg = champ_dao.lane_img(lane);
		return botimg;
	}

	public List<champion_dto> util_img(String lane) {
		List<champion_dto> utilimg = null;
		utilimg = champ_dao.lane_img(lane);
		return utilimg;
	}
	
//	梨뷀봽 由ъ뒪�듃
	public List<champion_dto> flist(String lane) {
		
		List<champion_dto> flist = null;
		flist = champ_dao.lane_list(lane);
		
		return flist;
	}
	
	// 硫붿씤 由ъ뒪�듃
	public List<champion_dto> mList(String lane) {
		System.out.println("硫붿씤 由ъ뒪�듃 �꽌鍮꾩뒪: "+lane);
		List<champion_dto> mList = champ_dao.mlane_list(lane);
		System.out.println("�꽌鍮꾩뒪 mList�뒗: " + mList);
		return mList;
	}

	public List<champion_dto> top_list(String lane) {
		
		List<champion_dto> top_list = null;
		top_list = champ_dao.lane_list(lane);
		
		return top_list;
	}

	public List<champion_dto> jug_list(String lane) {
		List<champion_dto> jug_list = null;
		jug_list = champ_dao.lane_list(lane);
		
		return jug_list;
	}

	public List<champion_dto> mid_list(String lane) {
		List<champion_dto> mid_list = null;
		mid_list = champ_dao.lane_list(lane);
		
		return mid_list;
	}

	public List<champion_dto> bot_list(String lane) {
		List<champion_dto> bot_list = null;
		bot_list = champ_dao.lane_list(lane);
		
		return bot_list;
	}

	public List<champion_dto> util_list(String lane) {
		List<champion_dto> util_list = null;
		util_list = champ_dao.lane_list(lane);
		
		return util_list;
	}
	
	//win rate 由ъ뒪�듃 �젙�젹 遺�遺�
	public List<champion_dto> list_sort_win(String lane, String sort) {
		List<champion_dto> list_sort_win = null;
		list_sort_win = champ_dao.lane_sort_win(lane,sort);
		return list_sort_win;
	}

	//pick rate 由ъ뒪�듃 �젙�젹
	public List<champion_dto> list_sort_pick(String lane, String sort) {
		List<champion_dto> list_sort_pick = null;
		list_sort_pick = champ_dao.lane_sort_pick(lane,sort);
		return list_sort_pick;
	}
	
	//ban rate 由ъ뒪�듃 �젙�젹
	public List<champion_dto> list_sort_ban(String lane, String sort) {
		List<champion_dto> list_sort_ban = null;
		list_sort_ban = champ_dao.lane_sort_ban(lane,sort);
		return list_sort_ban;
	}
	
	//梨뷀뵾�뼵 寃��깋
	public List<champion_dto> search_champ(String searchVal) {
		List<champion_dto> search_champ =null;
		search_champ = champ_dao.search_champ(searchVal);
		
		return search_champ;
	}

	public List<champion_dto> champ_info(Integer champ_id,String champ_lane) {
		List<champion_dto> champ_info = null;
		champ_info = champ_dao.champ_info(champ_id,champ_lane);
		return champ_info;
	}

	public List<Champskill_dto> champ_skill(Integer champ_id) {
		List<Champskill_dto> champ_skill = null;
		champ_skill = champ_dao.champ_skill(champ_id);
		return champ_skill;
	}

	public List<Champskill_dto> skill_tree(Integer champ_id,String champ_lane) {
		List<Champskill_dto> skill_tree = null;
		skill_tree = champ_dao.skill_tree(champ_id,champ_lane);
		return skill_tree;
	}
	
	//猷ы듃由�
	public List<ChampRune_dto> champ_rune(Integer champ_id,String champ_lane) {
		List<ChampRune_dto> champ_rune = null;
		champ_rune = champ_dao.champ_rune(champ_id,champ_lane);
		return champ_rune;
	}
	
	//猷� 硫붿씤
	public List<ChampRuneType_dto> main_rune(Integer main_rune) {
		List<ChampRuneType_dto> main_rune_img = null;
		main_rune_img = champ_dao.main_img(main_rune);
		return main_rune_img;
	}
	
	public List<ChampRuneType_dto> sub_rune(Integer sub_rune) {
		List<ChampRuneType_dto> sub_rune_img = null;
		sub_rune_img = champ_dao.sub_img(sub_rune);
		return sub_rune_img;
	}
	

	//猷� 肄붿뼱 �씠誘몄�
	public List<ChampRuneCore_dto> core_img(Integer core_rune) {
		List<ChampRuneCore_dto> core_img = null;
		core_img = champ_dao.core_img(core_rune);
		return core_img;
	}

	public List<ChampRuneShard_dto> shard_img() {
		List<ChampRuneShard_dto> shard_img = null;
		shard_img = champ_dao.shard_img();
		return shard_img;
	}

	
	public List<Item_dto> item_build(Integer champ_id,String champ_lane) {
		System.out.println("Service_item_build_champ_id="+champ_id);
		List<Item_dto> item_build = null;
		item_build = champ_dao.item_build(champ_id,champ_lane);
		System.out.println("Service_item_build_Return="+item_build);
		return item_build;		
	}


	public List<Item_dto> item_img(Integer item) {
		List<Item_dto> item_img = null;
		item_img = champ_dao.item_img(item);
		return item_img;
	}
	
	//梨뷀봽 �뒪�렆 
	public List<ChampSpell_dto> champ_spell(Integer champ_id, String champ_lane) {
		List<ChampSpell_dto> champ_spell_lst = null;
		champ_spell_lst = champ_dao.champ_spell(champ_id,champ_lane);
		return champ_spell_lst;
	}
	//梨뷀봽 �뒪�렆 �씠誘몄�
	public List<ChampSpell_dto> champ_spell_img(Integer spell_img) {
		List<ChampSpell_dto> champ_spell_img = null;
		champ_spell_img = champ_dao.champ_spell_img(spell_img);
		return champ_spell_img;
	}


	
	//梨뷀봽 留ㅼ튂�뾽 �긽���븯湲� �돩�슫
	public List<ChampMatch_dto> matchup_lst(Integer champ_id, String champ_lane) {
		List<ChampMatch_dto> matchup_lst = null;
		matchup_lst = champ_dao.matchup_lst(champ_id,champ_lane);
		return matchup_lst;
	}
	//梨뷀봽 留ㅼ튂�뾽 �씠誘몄�
	public List<champion_dto> matchup_champ_img(Integer match_champ) {
		List<champion_dto> matchup_img_lst = null;
		matchup_img_lst = champ_dao.matchup_champ_img(match_champ);
		return matchup_img_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �긽���븯湲� �뼱�젮�슫
	public List<ChampMatch_dto> matchup_lst_hard(Integer champ_id, String champ_lane) {
		List<ChampMatch_dto> matchup_lst_hard = null;
		matchup_lst_hard = champ_dao.matchup_lst_hard(champ_id,champ_lane);
		return matchup_lst_hard;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪(留ㅼ튂�뾽 �럹�씠吏�肉뚮┫嫄�)
	public List<ChampMatch_dto> matchup_detail(Integer champ_id, String champ_lane, Integer match_champ) {
		List<ChampMatch_dto> matchup_detail_lst = null;
		matchup_detail_lst = champ_dao.matchup_detail(champ_id,champ_lane,match_champ);
		return matchup_detail_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �씠誘몄�
	public List<champion_dto> matchup_detail_img(Integer champ_id, Integer match_champ) {
		List<champion_dto> matchup_detail_img_lst = null;
		matchup_detail_img_lst = champ_dao.matchup_detail_img(champ_id,match_champ);
		return matchup_detail_img_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �씤�룷(�듅,�뵿,諛대쪧)
	public List<champion_dto> matchup_detail_info(Integer champ_id, String champ_lane,Integer match_champ) {
		 List<champion_dto> matchup_detail_info_lst = null;
		 matchup_detail_info_lst = champ_dao.matchup_detail_info(champ_id,champ_lane,match_champ);
		return matchup_detail_info_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �긽���븳 梨뷀봽 由ъ뒪�듃
	public List<ChampMatch_dto> matchup_list(Integer champ_id, String champ_lane) {
		List<ChampMatch_dto> matchup_list_lst = null;
		matchup_list_lst = champ_dao.matchup_list(champ_id,champ_lane);
		return matchup_list_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �긽��梨뷀봽 �젙蹂� 
	public List<champion_dto> matchamp_info(Integer matchamp_id,String champ_lane) {
		List<champion_dto> matchamp_info_lst = null;
		matchamp_info_lst = champ_dao.matchamp_info(matchamp_id,champ_lane);
		return matchamp_info_lst;
	}

	public List<champion_dto> counter_info(Integer champ_id, String champ_lane) {
		List<champion_dto> counter_info_lst= null;
		counter_info_lst = champ_dao.counter_info(champ_id,champ_lane);
		return counter_info_lst;
	}

	public List<ChampStartItem_dto> start_item(Integer champ_id, String champ_lane) {
		List<ChampStartItem_dto> start_item_lst = null;
		start_item_lst = champ_dao.start_item(champ_id,champ_lane);
		return start_item_lst;
	}
	
	public List<ChampStartBoots_dto> start_boots(Integer champ_id, String champ_lane) {
		List<ChampStartBoots_dto> start_boots_lst = null;
		start_boots_lst = champ_dao.start_boots(champ_id,champ_lane);
		return start_boots_lst;
	}
	

	




	

}//
