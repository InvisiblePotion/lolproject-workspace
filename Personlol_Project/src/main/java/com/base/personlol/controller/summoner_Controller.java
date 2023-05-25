package com.base.personlol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.base.personlol.service.summoner_service;

@Controller
@RequestMapping("/summoner")
public class summoner_Controller {

	@Autowired
	summoner_service sum_ser;

	@GetMapping("/test")
	public String testzone() {
		return "summoner_test";
	}
	
	// 검색 기능 보강용 메소드
	@GetMapping("/{summoner_name}")
	public String summonerinfo(@PathVariable("summoner_name") String summoner_name) {
		if (sum_ser.isSummonerNameExists(summoner_name)) {
			return "summonerinfo";
		}
		return "redirect:/personlol/";
	}

}