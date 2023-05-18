package com.base.personlol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.summoner_dao;
import com.base.personlol.dto.summoner_dto;

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

}
