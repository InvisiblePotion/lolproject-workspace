package com.base.personlol.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dao.summoner_dao;
import com.base.personlol.dto.summoner_dto;
import com.base.personlol.dto.summoner_rawdata_dto;
import com.base.personlol.dto.summoner_recent_game_dto;
import com.base.personlol.service.summoner_service;

@RestController
@RequestMapping("/summoner/rest")
public class R_summoner_Controller {
	
	@Autowired
	summoner_service sum_ser;

	@Autowired
	summoner_dao sum_dao;
	
	@GetMapping("/info")
	public summoner_dto getfirstinfo(@RequestParam Map<String,String> summoner_name) {
		System.out.println("깐트롤라 firstinfo?"+summoner_name);
		summoner_dto firstinfo = sum_ser.getfirstinfo(summoner_name);
		System.out.println("돌아온깐트롤라 firstinfo?: "+firstinfo);
		return firstinfo;
	}

	@PostMapping("/game-record")
	public ArrayList<ArrayList<summoner_rawdata_dto>> getGameRecord(summoner_recent_game_dto game_id_list) {
		System.out.println("R_summoner_Controller.getGameRecord() >> 넘어온 값: game_id_list: " + game_id_list); // ### 로그
		return sum_ser.getGameRacordList(game_id_list.getGame_id_list());
	}

	@GetMapping("/game-id-list")
	public List<String> getGameids(String summoner_name) {
		System.out.println("R_summoner_Controller.getGameids() >> 넘어온 값: summoner_name: " + summoner_name); // ### 로그

		List<String> recent_return = sum_dao.getGameidsOnRecentGame(summoner_name);
		System.out.println("R_summoner_Controller.getGameids() >> getGameidsOnRecentGame() 결과: " + recent_return); // ### 로그

		boolean is_recent_exist = recent_return.isEmpty();
		System.out.println("R_summoner_Controller.getGameids() >> summoner_recent_game 등록 여부: " + !is_recent_exist); // ### 로그
		
		if (!is_recent_exist) {
			return recent_return;
		}
		
		List<String> rawdata_return = sum_dao.getGameidsOnRawdata(summoner_name);
		System.out.println("R_summoner_Controller.getGameids() >> getGameidsOnRawdata() 결과: " + rawdata_return); // ### 로그

		boolean is_rawdata_exist = rawdata_return.isEmpty();
		System.out.println("R_summoner_Controller.getGameids() >> RawData 등록 여부: " + !is_rawdata_exist); // ### 로그

		if (!is_rawdata_exist) {
			return rawdata_return;
		}

		// 양쪽 다 값이 없다면 null을 리턴 (프론트에서 null에 대한 페이지 표시 불가 처리 필요!)
		return null;
	}

	@PostMapping("/recent-game")
	public void putGameidInRecentGame(summoner_recent_game_dto insert_data) {
		System.out.println("R_summoner_Controller.putGameidInRecentGame() >> 넘어온 값: " + insert_data); // ### 로그
		sum_ser.putGameidListInRecentGame(insert_data.getSummoner_name(), insert_data.getGame_id_list());
	}
	
}
