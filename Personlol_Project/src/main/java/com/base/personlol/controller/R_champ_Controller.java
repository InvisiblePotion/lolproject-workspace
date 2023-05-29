package com.base.personlol.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.ChampMatch_dto;
import com.base.personlol.dto.ChampRuneCore_dto;
import com.base.personlol.dto.ChampRuneShard_dto;
import com.base.personlol.dto.ChampRuneType_dto;
import com.base.personlol.dto.ChampRune_dto;
import com.base.personlol.dto.ChampSpell_dto;
import com.base.personlol.dto.ChampStartBoots_dto;
import com.base.personlol.dto.ChampStartItem_dto;
import com.base.personlol.dto.Champskill_dto;
import com.base.personlol.dto.Item_dto;
import com.base.personlol.dto.Test_raw;
import com.base.personlol.dto.champion_dto;
import com.base.personlol.service.champion_service;

@RestController
public class R_champ_Controller {

	@Autowired
	private champion_service champ_ser;

	@GetMapping("/champimg")
	public List<champion_dto> champimg(@RequestParam("main") String main) {
		
		List<champion_dto> keyList = champ_ser.key_list();

		return keyList;

	}

	@GetMapping("/champimg-top")
	public List<champion_dto> top_img(String lane) {

		List<champion_dto> topimg = champ_ser.top_img(lane);

		return topimg;
	}

	@GetMapping("/champimg-jug")
	public List<champion_dto> jug_img(String lane) {

		List<champion_dto> jugimg = champ_ser.jug_img(lane);

		return jugimg;
	}

	@GetMapping("/champimg-mid")
	public List<champion_dto> mid_img(String lane) {

		List<champion_dto> midimg = champ_ser.mid_img(lane);

		return midimg;
	}

	@GetMapping("/champimg-bot")
	public List<champion_dto> bot_img(String lane) {

		List<champion_dto> botimg = champ_ser.bot_img(lane);

		return botimg;
	}

	@GetMapping("/champimg-util")
	public List<champion_dto> util_img(String lane) {

		List<champion_dto> utilimg = champ_ser.util_img(lane);
		return utilimg;
	}

	// 梨뷀봽 由ъ뒪�듃 異쒕젰
	@GetMapping("/list")
	public List<champion_dto> first_list(String lane) {
		List<champion_dto> fList = champ_ser.flist(lane);
		return fList;
	}
	
	//梨뷀봽 由ъ뒪�듃 移댁슫�꽣�젙蹂� 異붽�
	@GetMapping("/list/counter-info")
	public List<champion_dto> counter_info(Integer champ_id,String champ_lane){
		List<champion_dto> counter_info_lst = champ_ser.counter_info(champ_id,champ_lane);
		return counter_info_lst;
	}
	
	//硫붿씤 �쓣�썙二쇰뒗嫄�
	@GetMapping("/mainchamp")
	public List<champion_dto> main_list(@RequestParam("lane") String lane){
		System.out.println("硫붿씤 由ъ뒪�듃: "+ lane);
		List<champion_dto> mList = champ_ser.mList(lane);
		System.out.println("而⑦듃濡ㅻ윭 mList: "+mList);
		return mList;
	}

	@GetMapping("/list/TOP")
	public List<champion_dto> top_list(String lane) {
		List<champion_dto> toplist = champ_ser.top_list(lane);
		return toplist;
	}

	@GetMapping("/list/JUNGLE")
	public List<champion_dto> jug_list(String lane) {
		List<champion_dto> juglist = champ_ser.jug_list(lane);
		return juglist;
	}

	@GetMapping("/list/MIDDLE")
	public List<champion_dto> mid_list(String lane) {
		List<champion_dto> midlist = champ_ser.mid_list(lane);
		return midlist;
	}

	@GetMapping("/list/BOTTOM")
	public List<champion_dto> bot_list(String lane) {
		List<champion_dto> botlist = champ_ser.bot_list(lane);
		return botlist;
	}

	@GetMapping("/list/UTILITY")
	public List<champion_dto> util_list(String lane) {
		List<champion_dto> utillist = champ_ser.util_list(lane);
		return utillist;
	}

//	由ъ뒪�듃 winrate �젙�젹遺�遺�
	@GetMapping("/list/sorted/winRate/TOP")
	public List<champion_dto> toplist_sort_win(String lane, String sort) {
		List<champion_dto> toplist_sort_win = champ_ser.list_sort_win(lane, sort);
		return toplist_sort_win;
	}

	@GetMapping("/list/sorted/winRate/JUNGLE")
	public List<champion_dto> juglist_sort_win(String lane, String sort) {
		List<champion_dto> juglist_sort_win = champ_ser.list_sort_win(lane, sort);
		return juglist_sort_win;
	}

	@GetMapping("/list/sorted/winRate/MIDDLE")
	public List<champion_dto> midlist_sort_win(String lane, String sort) {
		List<champion_dto> midlist_sort_win = champ_ser.list_sort_win(lane, sort);
		return midlist_sort_win;
	}

	@GetMapping("/list/sorted/winRate/BOTTOM")
	public List<champion_dto> botlist_sort_win(String lane, String sort) {
		List<champion_dto> botlist_sort_win = champ_ser.list_sort_win(lane, sort);
		return botlist_sort_win;
	}

	@GetMapping("/list/sorted/winRate/UTILITY")
	public List<champion_dto> utilList_sort_win(String lane, String sort) {
		List<champion_dto> utilList_sort_win = champ_ser.list_sort_win(lane, sort);
		return utilList_sort_win;
	}

//	由ъ뒪�듃 pickrate �젙�젹遺�遺�
	@GetMapping("/list/sorted/pickRate/TOP")
	public List<champion_dto> toplist_sort_pick(String lane, String sort) {
		List<champion_dto> toplist_sort_pick = champ_ser.list_sort_pick(lane, sort);
		return toplist_sort_pick;
	}

	@GetMapping("/list/sorted/pickRate/JUNGLE")
	public List<champion_dto> juglist_sort_pick(String lane, String sort) {
		List<champion_dto> juglist_sort = champ_ser.list_sort_pick(lane, sort);
		return juglist_sort;
	}

	@GetMapping("/list/sorted/pickRate/MIDDLE")
	public List<champion_dto> midlist_sort_pick(String lane, String sort) {
		List<champion_dto> midlist_sort = champ_ser.list_sort_pick(lane, sort);
		return midlist_sort;
	}

	@GetMapping("/list/sorted/pickRate/BOTTOM")
	public List<champion_dto> botlist_sort_pick(String lane, String sort) {
		List<champion_dto> botlist_sort = champ_ser.list_sort_pick(lane, sort);
		return botlist_sort;
	}

	@GetMapping("/list/sorted/pickRate/UTILITY")
	public List<champion_dto> utillist_sort_pick(String lane, String sort) {
		List<champion_dto> utilList_sort = champ_ser.list_sort_pick(lane, sort);
		return utilList_sort;
	}

//	由ъ뒪�듃 banrate �젙�젹遺�遺�
	@GetMapping("/list/sorted/banRate/TOP")
	public List<champion_dto> toplist_sort_ban(String lane, String sort) {
		List<champion_dto> toplist_sort_ban = champ_ser.list_sort_ban(lane, sort);
		return toplist_sort_ban;
	}

	@GetMapping("/list/sorted/banRate/JUNGLE")
	public List<champion_dto> juglist_sort_ban(String lane, String sort) {
		List<champion_dto> juglist_sort_ban = champ_ser.list_sort_ban(lane, sort);
		return juglist_sort_ban;
	}

	@GetMapping("/list/sorted/banRate/MIDDLE")
	public List<champion_dto> midlist_sort_ban(String lane, String sort) {
		List<champion_dto> midlist_sort_ban = champ_ser.list_sort_ban(lane, sort);
		return midlist_sort_ban;
	}

	@GetMapping("/list/sorted/banRate/BOTTOM")
	public List<champion_dto> botlist_sort_ban(String lane, String sort) {
		List<champion_dto> botlist_sort_ban = champ_ser.list_sort_ban(lane, sort);
		return botlist_sort_ban;
	}

	@GetMapping("/list/sorted/banRate/UTILITY")
	public List<champion_dto> utillist_sort_ban(String lane, String sort) {
		List<champion_dto> utillist_sort_ban = champ_ser.list_sort_ban(lane, sort);
		return utillist_sort_ban;
	}

	// 梨뷀뵾�뼵 寃��깋 遺�遺�
	@GetMapping("/champion/search")
	public List<champion_dto> search_champ(@RequestParam("searchVal") String searchVal) {
		List<champion_dto> search_champ = champ_ser.search_champ(searchVal);
		return search_champ;
	}

	// 梨뷀봽 �뵒�뀒�씪 遺�遺�
	@GetMapping("/champion/info")
	public List<champion_dto> champ_info(Integer champ_id,String champ_lane) {
		List<champion_dto> champ_info = champ_ser.champ_info(champ_id,champ_lane);
		return champ_info;
	}
	//梨뷀봽 �뒪�렆 遺�遺�
	@GetMapping("/champion/spell")
	public List<ChampSpell_dto> champ_spell(Integer champ_id,String champ_lane){
		List<ChampSpell_dto> champ_spell_lst = champ_ser.champ_spell(champ_id,champ_lane);
		return champ_spell_lst;
	}
	
	//梨뷀봽 �뒪�렆 �씠誘몄� 遺�遺�
	@GetMapping("/champion/spell-img")
	public List<ChampSpell_dto> champ_spell_img(Integer spell_img){
		List<ChampSpell_dto> champ_spell_img_lst = champ_ser.champ_spell_img(spell_img);
		return champ_spell_img_lst;
	}
	

	// 梨뷀봽 �뒪�궗 遺�遺�
	@GetMapping("/champion/skill")
	public List<Champskill_dto> champ_skill(Integer champ_id) {
		List<Champskill_dto> champ_skill = champ_ser.champ_skill(champ_id);
		return champ_skill;
	}

	// 梨뷀봽 �뒪�궗 �듃由� 遺�遺�
	@GetMapping("/champion/skill-tree")
	public List<Champskill_dto> skill_tree(Integer champ_id,String champ_lane) {
		List<Champskill_dto> skill_tree = champ_ser.skill_tree(champ_id,champ_lane);
		return skill_tree;
	}

	// 梨뷀봽 猷� �듃由� 遺�遺�
	@GetMapping("/champion/rune")
	public List<ChampRune_dto> champ_rune(Integer champ_id,String champ_lane) {
		List<ChampRune_dto> champ_rune = champ_ser.champ_rune(champ_id,champ_lane);
		return champ_rune;
	}

	// 梨뷀봽 猷щ찓�씤
	@GetMapping("/champion/rune/main-rune")
	public List<ChampRuneType_dto> main_rune_img(Integer main_rune) {
		List<ChampRuneType_dto> main_rune_img = champ_ser.main_rune(main_rune);
		return main_rune_img;
	}

	// 梨뷀봽 猷щ찓�씤
	@GetMapping("/champion/rune/sub-rune")
	public List<ChampRuneType_dto> sub_rune_img(Integer sub_rune) {
		List<ChampRuneType_dto> sub_rune_img = champ_ser.sub_rune(sub_rune);
		return sub_rune_img;
	}

	// 梨뷀봽 肄붿뼱1
	@GetMapping("/champion/rune/type-core")
	public List<ChampRuneCore_dto> core_rune1_img(Integer core_rune) {
		List<ChampRuneCore_dto> core_rune1_img = champ_ser.core_img(core_rune);
		return core_rune1_img;
	}

	// 梨뷀봽 �뙆�렪1
	@GetMapping("/champion/rune/shard")
	public List<ChampRuneShard_dto> shard_img() {
		List<ChampRuneShard_dto> shard_img = champ_ser.shard_img();
		return shard_img;
	}

	// 梨뷀봽 �븘�씠�뀥 遺�遺�
	@GetMapping("/champion/item_build")
	public List<Item_dto> item_build(Integer champ_id,String champ_lane) {
		List<Item_dto> item_build = champ_ser.item_build(champ_id,champ_lane);
		return item_build;
	}

	// 梨뷀봽 �븘�씠�뀥 �씠誘몄�
	@GetMapping("/champion/item1")
	public List<Item_dto> item1_img(Integer item) {
		List<Item_dto> item_img = champ_ser.item_img(item);
		return item_img;
	}

	@GetMapping("/champion/item2")
	public List<Item_dto> item2_img(Integer item) {
		List<Item_dto> item_img = champ_ser.item_img(item);
		return item_img;
	}

	@GetMapping("/champion/item3")
	public List<Item_dto> item3_img(Integer item) {
		List<Item_dto> item_img = champ_ser.item_img(item);
		return item_img;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �돩�슫
	@GetMapping("/matchup/list")
	public List<ChampMatch_dto> matchup_lst(Integer champ_id,String champ_lane){
		List<ChampMatch_dto> matchup_lst = champ_ser.matchup_lst(champ_id,champ_lane);
		return matchup_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �뼱�젮�슫
	@GetMapping("/matchup/list-hard")
	public List<ChampMatch_dto> matchup_lst_hard(Integer champ_id,String champ_lane){
		List<ChampMatch_dto> matchup_lst_hard = champ_ser.matchup_lst_hard(champ_id,champ_lane);
		return matchup_lst_hard;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �씠誘몄�
	@GetMapping("/matchup/champ-img")
	public List<champion_dto> matchup_champ_img(Integer match_champ){
		List<champion_dto> matchup_img_lst = champ_ser.matchup_champ_img(match_champ);
		return matchup_img_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪
	@GetMapping("/matchup/detail")
	public List<ChampMatch_dto> matchup_detail(Integer champ_id,String champ_lane,Integer match_champ){
		List<ChampMatch_dto> matchup_detail_lst = champ_ser.matchup_detail(champ_id,champ_lane,match_champ);
		return matchup_detail_lst;
	}
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪 梨뷀봽�몮�씠誘몄�
	@GetMapping("/matchup/detail-img")
	public List<champion_dto> matchup_detail_img(Integer champ_id,Integer match_champ){
		List<champion_dto> matchup_detail_img_lst = champ_ser.matchup_detail_img(champ_id,match_champ);
		return matchup_detail_img_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪 �씤�룷
	@GetMapping("/matchup/detail-info")
	public List<champion_dto> matchup_detail_info(Integer champ_id,String champ_lane,Integer match_champ){
		List<champion_dto> matchup_detail_info_lst = champ_ser.matchup_detail_info(champ_id,champ_lane,match_champ);
		return matchup_detail_info_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪 由ъ뒪�듃
	@GetMapping("/matchup/champ-list")
	public List<ChampMatch_dto> matchup_list(Integer champ_id,String champ_lane){
		List<ChampMatch_dto> matchup_list_lst = champ_ser.matchup_list(champ_id,champ_lane);
		return matchup_list_lst;
	}
	
	//梨뷀봽 留ㅼ튂�뾽 �뵒�뀒�씪 �긽��梨뷀봽 �젙蹂�
	@GetMapping("/matchup/matchamp-info")
	public List<champion_dto> matchamp_info (Integer matchamp_id,String champ_lane){
		List<champion_dto> matchamp_info_lst = champ_ser.matchamp_info(matchamp_id,champ_lane);
		return matchamp_info_lst;
	}
	//챔피언 시작 아이템
	@GetMapping("/champion/start-item")
	public List<ChampStartItem_dto> start_item (Integer champ_id,String champ_lane){
		System.out.println(champ_id);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(champ_lane);
		List<ChampStartItem_dto> start_item_lst = champ_ser.start_item(champ_id,champ_lane);
		return start_item_lst;
	}
	//아이템 이미지
	@GetMapping("/champion/start-item1")
	public List<Item_dto> start_item1(Integer item) {
		List<Item_dto> item_img = champ_ser.item_img(item);
		return item_img;
	}
	
	@GetMapping("/champion/start-item2")
	public List<Item_dto> start_item2(Integer item) {
		List<Item_dto> item_img = champ_ser.item_img(item);
		return item_img;
	}
	
	//챔피언 시작 신발
	@GetMapping("/champion/start-boots")
	public List<ChampStartBoots_dto> start_boots (Integer champ_id,String champ_lane){
		List<ChampStartBoots_dto> start_boot_lst = champ_ser.start_boots(champ_id,champ_lane);
		return start_boot_lst;
	}
	//신발 이미지
	@GetMapping("/champion/start-boots1")
	public List<Item_dto> start_boots1(Integer item) {
		List<Item_dto> start_boots1 = champ_ser.item_img(item);
		return start_boots1;
	}
	@GetMapping("/champion/start-boots2")
	public List<Item_dto> start_boots2(Integer item) {
		List<Item_dto> start_boots2 = champ_ser.item_img(item);
		return start_boots2;
	} 
	
	
	
	
}//而⑦듃濡ㅻ윭 �걹