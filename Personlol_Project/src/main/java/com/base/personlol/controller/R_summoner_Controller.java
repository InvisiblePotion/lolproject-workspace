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
@RequestMapping("/summoner")
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

	@GetMapping("/game-record")
	public ArrayList<summoner_rawdata_dto> getGameRecord(@RequestParam List<String> game_ids) {
		return sum_ser.getGameRacordList(game_ids);
	}

	@GetMapping("/game-ids/{on_where}")
	public List<String> getGameids(String summoner_name, @PathVariable("on_where") String on_where) {
		System.out.println("R_summoner_Controller.getGameids() >> 넘어온 값: summoner_name: "+summoner_name+", on_where: "+on_where); // ### 로그
		switch (on_where) {
			case "on-recent-game":
				return sum_dao.getGameidsOnRecentGame(summoner_name);
			case "on-rawdata":
				return sum_dao.getGameidsOnRawdata(summoner_name);
			default:
				ArrayList<String> err_result = new ArrayList<String>();
				err_result.add("입력된 PathVariable이 잘못되었습니다. (\"on-recent-game\", \"on-rawdata\")");
				return err_result;
		}
	}

	@PostMapping("/recent-game")
	public void putGameidInRecentGame(summoner_recent_game_dto insert_data) {
		System.out.println("R_summoner_Controller.putGameidInRecentGame() >> 넘어온 값: " + insert_data); // ### 로그
		sum_ser.putGameidListInRecentGame(insert_data.getSummoner_name(), insert_data.getGame_ids());
	}
	
}
