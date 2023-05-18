package com.base.personlol.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.rank_dto;
import com.base.personlol.service.rank_service;
import com.base.personlol.service.user_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rank")
public class R_rank_Controller {
	@Autowired //서비스 클래스 연결
	rank_service r_ser;
	
	@GetMapping("/challenger")
	public List<rank_dto> Ranking_challenger() {
		System.out.println("챌린저 받아오나요~?");
		List<rank_dto> challengerinfo = r_ser.challengerinfo();
		System.out.println("챌인포 받아왔옹?: "+challengerinfo);	
		
		return challengerinfo;
		
	}
	
	@GetMapping("/grandmaster")
	public List<rank_dto> Ranking_grandmaster() {
		System.out.println("그마 받아오나요~?");
		List<rank_dto> grandmasterinfo = r_ser.grandmasterinfo();
		System.out.println("그마인포 받아왔옹?: "+grandmasterinfo);	
		
		return grandmasterinfo;
		
	}
	
	@GetMapping("/master")
	public List<rank_dto> Ranking_master() {
		System.out.println("마스터 받아오나요~?");
		List<rank_dto> masterinfo = r_ser.masterinfo();
		System.out.println("마스터 받아왔옹?: "+masterinfo);	
		
		return masterinfo;
		
	}
	//rank.jsp에 getajax 랭킹 정보 가져오기
	@GetMapping("/ranking")
	public List<rank_dto> Ranking_challenger(@RequestParam Map<String, ?> rankdata) {
		System.out.println("챌린저 받아오나요~?");
		System.out.println("너찍혀?~: "+ rankdata);
		List<rank_dto> rankinfo = r_ser.rankinginfo(rankdata);
		System.out.println("챌인포 받아왔옹?: "+rankinfo);	
		
		return rankinfo;
		
	}
	
	// 페이지 수 구해오는 함수
	@GetMapping("/highpage")
	public Integer highpage(@RequestParam String rank) {
		System.out.println("페이지 띄우기 rest타?"+rank);
		Integer highpage = r_ser.highpage(rank);
		System.out.println("최대페이지 받아왔어?: "+highpage);
		return highpage;
	}
	
}
