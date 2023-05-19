package com.base.personlol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.champion_dao;
import com.base.personlol.dto.ChampRuneCore_dto;
import com.base.personlol.dto.ChampRuneShard_dto;
import com.base.personlol.dto.ChampRuneType_dto;
import com.base.personlol.dto.ChampRune_dto;
import com.base.personlol.dto.Champskill_dto;
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
	
//	챔프 리스트
	public List<champion_dto> flist(String lane) {
		
		List<champion_dto> flist = null;
		flist = champ_dao.lane_list(lane);
		
		return flist;
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
	
	//win rate 리스트 정렬 부분
	public List<champion_dto> list_sort_win(String lane, String sort) {
		List<champion_dto> list_sort_win = null;
		list_sort_win = champ_dao.lane_sort_win(lane,sort);
		return list_sort_win;
	}

	//pick rate 리스트 정렬
	public List<champion_dto> list_sort_pick(String lane, String sort) {
		List<champion_dto> list_sort_pick = null;
		list_sort_pick = champ_dao.lane_sort_pick(lane,sort);
		return list_sort_pick;
	}
	
	//ban rate 리스트 정렬
	public List<champion_dto> list_sort_ban(String lane, String sort) {
		List<champion_dto> list_sort_ban = null;
		list_sort_ban = champ_dao.lane_sort_ban(lane,sort);
		return list_sort_ban;
	}
	
	//챔피언 검색
	public List<champion_dto> search_champ(String searchVal) {
		List<champion_dto> search_champ =null;
		search_champ = champ_dao.search_champ(searchVal);
		
		return search_champ;
	}

	public List<champion_dto> champ_info(Integer champ_id) {
		List<champion_dto> champ_info = null;
		champ_info = champ_dao.champ_info(champ_id);
		return champ_info;
	}

	public List<Champskill_dto> champ_skill(Integer champ_id) {
		List<Champskill_dto> champ_skill = null;
		champ_skill = champ_dao.champ_skill(champ_id);
		return champ_skill;
	}

	public List<Champskill_dto> skill_tree(Integer champ_id) {
		List<Champskill_dto> skill_tree = null;
		skill_tree = champ_dao.skill_tree(champ_id);
		return skill_tree;
	}

	public List<ChampRune_dto> champ_rune(Integer champ_id) {
		List<ChampRune_dto> champ_rune = null;
		champ_rune = champ_dao.champ_rune(champ_id);
		return champ_rune;
	}

	public List<ChampRuneType_dto> type_img(Integer typecore) {
		List<ChampRuneType_dto> type_img = null;
		type_img = champ_dao.type_img(typecore);
		return type_img;
	}

	public List<ChampRuneCore_dto> core_img(Integer core_main) {
		List<ChampRuneCore_dto> core_img = null;
		core_img = champ_dao.core_img(core_main);
		return core_img;
	}

	public List<ChampRuneShard_dto> shard_img(Integer shard) {
		List<ChampRuneShard_dto> shard_img = null;
		shard_img = champ_dao.shard_img(shard);
		return shard_img;
	}




	

}//
