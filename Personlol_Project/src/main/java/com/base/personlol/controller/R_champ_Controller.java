package com.base.personlol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.ChampRune_dto;
import com.base.personlol.dto.Champskill_dto;
import com.base.personlol.dto.champion_dto;
import com.base.personlol.service.champion_service;

@RestController
public class R_champ_Controller {
	
	@Autowired
	private champion_service champ_ser;
	
	@GetMapping("/champimg")
	public List<champion_dto> champimg(){
		
		List<champion_dto> keyList = champ_ser.key_list();
		
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
	
	//챔프 리스트 출력
	@GetMapping("/list")
	public List<champion_dto> first_list(String lane){
		List<champion_dto> fList = champ_ser.flist(lane);
		return fList;
	}
	
	@GetMapping("/list/TOP")
	public List<champion_dto> top_list(String lane){
		List<champion_dto> toplist = champ_ser.top_list(lane);
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
	
//	리스트 winrate 정렬부분
	@GetMapping("/list/sorted/winRate/TOP")
	public List<champion_dto> toplist_sort_win(String lane,String sort){
		List<champion_dto> toplist_sort_win = champ_ser.list_sort_win(lane,sort);
		return toplist_sort_win;
	}
	@GetMapping("/list/sorted/winRate/JUNGLE")
	public List<champion_dto> juglist_sort_win(String lane,String sort){
		List<champion_dto> juglist_sort_win = champ_ser.list_sort_win(lane,sort);
		return juglist_sort_win;
	}
	@GetMapping("/list/sorted/winRate/MIDDLE")
	public List<champion_dto> midlist_sort_win(String lane,String sort){
		List<champion_dto> midlist_sort_win = champ_ser.list_sort_win(lane,sort);
		return midlist_sort_win;
	}
	@GetMapping("/list/sorted/winRate/BOTTOM")
	public List<champion_dto> botlist_sort_win(String lane,String sort){
		List<champion_dto> botlist_sort_win = champ_ser.list_sort_win(lane,sort);
		return botlist_sort_win;
	}
	@GetMapping("/list/sorted/winRate/UTILITY")
	public List<champion_dto> utilList_sort_win(String lane,String sort){
		List<champion_dto> utilList_sort_win = champ_ser.list_sort_win(lane,sort);
		return utilList_sort_win;
	}
	
	
//	리스트 pickrate 정렬부분
	@GetMapping("/list/sorted/pickRate/TOP")
	public List<champion_dto> toplist_sort_pick(String lane,String sort){
		List<champion_dto> toplist_sort_pick = champ_ser.list_sort_pick(lane,sort);
		return toplist_sort_pick;
	}
	@GetMapping("/list/sorted/pickRate/JUNGLE")
	public List<champion_dto> juglist_sort_pick(String lane,String sort){
		List<champion_dto> juglist_sort = champ_ser.list_sort_pick(lane,sort);
		return juglist_sort;
	}
	@GetMapping("/list/sorted/pickRate/MIDDLE")
	public List<champion_dto> midlist_sort_pick(String lane,String sort){
		List<champion_dto> midlist_sort = champ_ser.list_sort_pick(lane,sort);
		return midlist_sort;
	}
	@GetMapping("/list/sorted/pickRate/BOTTOM")
	public List<champion_dto> botlist_sort_pick(String lane,String sort){
		List<champion_dto> botlist_sort = champ_ser.list_sort_pick(lane,sort);
		return botlist_sort;
	}
	@GetMapping("/list/sorted/pickRate/UTILITY")
	public List<champion_dto> utillist_sort_pick(String lane,String sort){
		List<champion_dto> utilList_sort = champ_ser.list_sort_pick(lane,sort);
		return utilList_sort;
	}
	
//	리스트 banrate 정렬부분
	@GetMapping("/list/sorted/banRate/TOP")
	public List<champion_dto> toplist_sort_ban(String lane,String sort){
		List<champion_dto> toplist_sort_ban = champ_ser.list_sort_ban(lane,sort);
		return toplist_sort_ban;
	}
	@GetMapping("/list/sorted/banRate/JUNGLE")
	public List<champion_dto> juglist_sort_ban(String lane,String sort){
		List<champion_dto> juglist_sort_ban = champ_ser.list_sort_ban(lane,sort);
		return juglist_sort_ban;
	}
	@GetMapping("/list/sorted/banRate/MIDDLE")
	public List<champion_dto> midlist_sort_ban(String lane,String sort){
		List<champion_dto> midlist_sort_ban = champ_ser.list_sort_ban(lane,sort);
		return midlist_sort_ban;
	}
	@GetMapping("/list/sorted/banRate/BOTTOM")
	public List<champion_dto> botlist_sort_ban(String lane,String sort){
		List<champion_dto> botlist_sort_ban = champ_ser.list_sort_ban(lane,sort);
		return botlist_sort_ban;
	}
	@GetMapping("/list/sorted/banRate/UTILITY")
	public List<champion_dto> utillist_sort_ban(String lane,String sort){
		List<champion_dto> utillist_sort_ban = champ_ser.list_sort_ban(lane,sort);
		return utillist_sort_ban;
	}
	
	//챔피언 검색 부분
	@GetMapping("/champion/search")
	public List<champion_dto> search_champ(@RequestParam("searchVal") String searchVal){
		System.out.println("searchval:"+searchVal);
		List<champion_dto> search_champ = champ_ser.search_champ(searchVal);
		return search_champ;
	}
	
	//챔프 디테일 부분
	@GetMapping("/champion/info")
	public List<champion_dto> champ_info(Integer champ_id){
		List<champion_dto> champ_info = champ_ser.champ_info(champ_id);
		
		return champ_info;
	}
	//챔프 스킬 부분
	@GetMapping("/champion/skill")
	public List<Champskill_dto> champ_skill(Integer champ_id){
		List<Champskill_dto> champ_skill = champ_ser.champ_skill(champ_id);
		return champ_skill;
	}
	
	//챔프 스킬 트리 부분
	@GetMapping("/champion/skill-tree")
	public List<Champskill_dto> skill_tree(Integer champ_id){
		List<Champskill_dto> skill_tree = champ_ser.skill_tree(champ_id);
		return skill_tree;
	}
	
	//챔프 룬 트리 부분
		@GetMapping("/champion/rune")
		public List<ChampRune_dto> champ_rune(Integer champ_id){
			System.out.println("champ_id: "+champ_id);
			List<ChampRune_dto> champ_rune = champ_ser.champ_rune(champ_id);
			
			System.out.println("champ_skill: "+champ_rune);
			return champ_rune;
		}
	
	
	
	
}//
