package com.base.personlol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.champion_dao;
import com.base.personlol.dto.champion_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class champion_service {
	
	@Autowired
	champion_dao champ_dao;

	public List<champion_dto> key_list(String champ_icon) {
		List<champion_dto> keyList = null;
		keyList = champ_dao.key_list(champ_icon);
		
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
	
	

}//
