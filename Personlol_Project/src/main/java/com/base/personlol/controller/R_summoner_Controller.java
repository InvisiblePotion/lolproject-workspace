package com.base.personlol.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public summoner_dto getfirstinfo(@RequestParam Map<String,String> summoner_name, HttpSession session) {
		System.out.println("깐트롤라 firstinfo?"+summoner_name);
		summoner_dto firstinfo = sum_ser.getfirstinfo(summoner_name); 
	    String summonerId = summoner_name.get("summonerId"); // 필요한 값을 추출하여 변수에 저장
	    session.setAttribute("summoner_id", summonerId); // 세션에 저장
		System.out.println("fdafdafa???"+firstinfo);
		return firstinfo;
	}
	
	@GetMapping("/champion")			//세션 영역에 저장된 summoner_name 이용해서 전적 가져오기
	public List<Map<String, ?>> ChampionRecord(@RequestParam String summoner_name) {
		System.out.println("이거 실행되니?"+summoner_name);
		
		List<Map<String, ?>> ChampRecord= sum_ser.ChampRecord(summoner_name);
		System.out.println("컨트롤러 결과는?"+ChampRecord);
		return ChampRecord;
	}
	
	@GetMapping("/main")
	public List<Map<String, ?>> mainRecord(@RequestParam String summoner_name){
		System.out.println();
		List<Map<String, ?>> MainRecord= sum_ser.MainRecord(summoner_name);
		return MainRecord;
	}
}
