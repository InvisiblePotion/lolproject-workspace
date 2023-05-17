package com.base.personlol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.champion_dto;
import com.base.personlol.service.champion_service;

@RestController
public class R_champ_Controller {
	
	@Autowired
	private champion_service champ_ser;
	
	@GetMapping("/champimg")
	public List<champion_dto> champimg(String champ_icon){
		
		System.out.println("ajax에서 받아온값: "+champ_icon);
		
		List<champion_dto> keyList = champ_ser.key_list(champ_icon);
		
		System.out.print("디비에서 받아온값: "+keyList);
		
		return keyList;
		
	}
	
	@GetMapping("/champimg-top")
	public List<champion_dto> top_img(String lane){
		System.out.println("이미지 라인:" + lane);
		
		List<champion_dto> topimg = champ_ser.top_img(lane);
		
		System.out.print("디비에서 받아온값 탑: "+topimg);
		
		
		return topimg;
	}
	
	@GetMapping("/champimg-jug")
	public List<champion_dto> jug_img(String lane){
		System.out.println("이미지 라인:" + lane);
		
		List<champion_dto> jugimg = champ_ser.jug_img(lane);
		
		System.out.print("디비에서 받아온값 정글: "+jugimg);
		
		
		return jugimg;
	}
	
	@GetMapping("/champimg-mid")
	public List<champion_dto> mid_img(String lane){
		System.out.println("이미지 라인:" + lane);
		
		List<champion_dto> midimg = champ_ser.mid_img(lane);
		
		System.out.print("디비에서 받아온값 미드: "+midimg);
		
		
		return midimg;
	}
	
	@GetMapping("/champimg-bot")
	public List<champion_dto> bot_img(String lane){
		System.out.println("이미지 라인:" + lane);
		
		List<champion_dto> botimg = champ_ser.bot_img(lane);
		
		System.out.print("디비에서 받아온값 봇: "+botimg);
		
		
		return botimg;
	}
	
	@GetMapping("/champimg-util")
	public List<champion_dto> util_img(String lane){
		System.out.println("이미지 라인:" + lane);
		
		List<champion_dto> utilimg = champ_ser.util_img(lane);
		
		System.out.print("디비에서 받아온값 서폿: "+utilimg);
		
		return utilimg;
	}
	
	//챔프 리스트
	@GetMapping("/list")
	public List<champion_dto> first_list(String lane){
		System.out.println("라인 옴?" + lane);
		
		List<champion_dto> fList = champ_ser.flist(lane);
		
		System.out.println("리스트 확인:" + fList);
		return fList;
	}
	
	@GetMapping("/list/TOP")
	public List<champion_dto> top_list(String lane){
		List<champion_dto> toplist = champ_ser.top_list(lane);
		System.out.println("뜯어보자:"+toplist);
		return toplist;
	}
	@GetMapping("/list/JUNGLE")
	public List<champion_dto> jug_list(String lane){
		List<champion_dto> juglist = champ_ser.jug_list(lane);
		return juglist;
	}
	@GetMapping("/list/MIDDLE")
	public List<champion_dto> mid_list(String lane){
		List<champion_dto> midlist = champ_ser.mid_list(lane);
		return midlist;
	}
	@GetMapping("/list/BOTTOM")
	public List<champion_dto> bot_list(String lane){
		List<champion_dto> botlist = champ_ser.bot_list(lane);
		return botlist;
	}
	@GetMapping("/list/UTILITY")
	public List<champion_dto> util_list(String lane){
		List<champion_dto> utillist = champ_ser.util_list(lane);
		return utillist;
	}
}//
