package com.base.personlol.dao;

import java.util.List;

import com.base.personlol.dto.champion_dto;

public interface champion_dao {

	List<champion_dto> key_list(String champ_icon);

	List<champion_dto> lane_img(String lane);

	List<champion_dto> lane_list(String lane);





}
