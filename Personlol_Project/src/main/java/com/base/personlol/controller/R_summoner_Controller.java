package com.base.personlol.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.summoner_dto;
import com.base.personlol.dto.summoner_rawdata_dto;
import com.base.personlol.dto.summoner_recent_game_dto;
import com.base.personlol.service.summoner_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/summoner")
public class R_summoner_Controller {
	
	@Autowired
	summoner_service sum_ser;
	
	@GetMapping("/info")
	public summoner_dto getfirstinfo(@RequestParam Map<String,String> summoner_name) {
		System.out.println("깐트롤라 firstinfo?"+summoner_name);
		summoner_dto firstinfo = sum_ser.getfirstinfo(summoner_name); 
		System.out.println("돌아온깐트롤라 firstinfo?: "+firstinfo);
		return firstinfo;
	}

	@GetMapping("/game-record")
	public summoner_rawdata_dto getGameRecord(@RequestParam String game_id) {
		return sum_ser.getGameRacord(game_id);
	}

	@GetMapping("/game-ids/{on_where}")
	public List<String> getGameids(String summoner_name, @PathVariable("on_where") String on_where) {
		System.out.println("넘어온 값: summoner_name: "+summoner_name+", on_where: "+on_where); // ### 로그
		switch (on_where) {
			case "on-recent-game":
				return sum_ser.getGameidsOnRecentGame(summoner_name);
			case "on-rawdata":
				return sum_ser.getGameidsOnRawdata(summoner_name);
			default:
				ArrayList<String> err_result = new ArrayList<String>();
				err_result.add("입력된 PathVariable이 잘못되었습니다. (\"on-recent-game\", \"on-rawdata\")");
				return err_result;
		}
	}

	@DeleteMapping("/recent-game")
	public void deleteGameidsInRecentGame(String summoner_name) {
		sum_ser.deleteGameidsInRecentGame(summoner_name);
	}

	@PostMapping("/recent-game")
	public void putGameidInRecentGame(summoner_recent_game_dto insert_data) {
		System.out.println("넘어온 값: " + insert_data); // ### 로그
		sum_ser.putGameidInRecentGame(insert_data.getSummoner_name(), insert_data.getGame_ids());
	}
	
}
