package com.base.personlol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/summoner")
public class summoner_Controller {
	
	@GetMapping("/{summoner_name}")
	public String summonerinfo(@PathVariable("summoner_name") String summoner_name) {
		return "summonerinfo";
	}

}