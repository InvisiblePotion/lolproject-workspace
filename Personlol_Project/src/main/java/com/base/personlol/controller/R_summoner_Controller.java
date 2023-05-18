package com.base.personlol.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.summoner_dto;
import com.base.personlol.service.summoner_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/summoner")
public class R_summoner_Controller {
	
	@Autowired
	summoner_service sum_ser;
	
	@GetMapping("/info")
	public String getfirstinfo(@RequestParam Map<String,String> summoner_name) {
		System.out.println("깐트롤라 firstinfo?"+summoner_name);
		summoner_dto firstinfo = sum_ser.getfirstinfo(summoner_name); 
		System.out.println("돌아온깐트롤라 firstinfo?: "+firstinfo);
		return "firstinfo";
	}


}
