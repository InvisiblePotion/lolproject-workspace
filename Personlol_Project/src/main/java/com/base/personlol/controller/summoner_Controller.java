package com.base.personlol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// summoner_name에 해당하는 소환사 명이 존재한다면 소환사 전적 페이지로 포워딩, 없다면 메인 페이지로 리다이렉트
	@GetMapping("/")
	public String summonerinfo(@RequestParam String summoner_name) {
		return "summonerinfo";
		// if (sum_ser.isSummonerNameExistsInSummoner(summoner_name)) {
		// }
		// return "redirect:/";
	}

}