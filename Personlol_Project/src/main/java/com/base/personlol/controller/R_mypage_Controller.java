package com.base.personlol.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.duo_dto;
import com.base.personlol.dto.mypage_dto;
import com.base.personlol.service.mypage_service;
import com.base.personlol.service.user_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController

@RequestMapping("/mypage")
public class R_mypage_Controller {
	@Autowired //서비스 클래스 연결
	mypage_service my_ser;
	
	
	//코드 확인 메소드
	@GetMapping("/selectcode")
	public String selectcode(HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		System.out.println("mypage 세션 id값이 찍히나요!?: "+user_id);
		String selectcode = my_ser.getcurcode(user_id);
		return selectcode;
	}
	
	//mypage icon/name 뿌리기	
	@GetMapping("/getnameicon")
	public mypage_dto getnameicon(HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		System.out.println("mypage lolname 확인 세션 id?"+user_id);
		mypage_dto getnameicon = my_ser.getnameicon(user_id);	
		System.out.println("컨트롤러 돌아온 icon"+getnameicon);
		
		return getnameicon;
	}
	
	//lol계정 변경하기
	@PutMapping(value = "/relolname")
	public @ResponseBody Integer changelolname(@RequestBody Map<String,String> changelolname, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		System.out.println("세션저장되냐 풋?: "+ user_id);
	    System.out.println("넘오오냐 풋?: " + changelolname);
	    changelolname.put("user_id", user_id);
	    System.out.println("map에 저장되냐 풋?: "+changelolname);
	    
	    Integer rename_result = my_ser.changelolname(changelolname);
	    System.out.println("돌아온 changepw:" + rename_result);
	    System.out.println("-1실패 0바꿀거 없음 1굳!");
	    if(rename_result ==1) {
	    	System.out.println("성공탔어요");
	    	return rename_result;
	    }else {
	    	return 0;
	    }   
	}
	//요청 불러오기
	@GetMapping("/getrequest")
	public @ResponseBody List<Map<String, String>> get_request(HttpSession session) {
		String user_id = session.getAttribute("id").toString();
		System.out.println("req_세션에 저장된ID: "+user_id);
		List<Map<String,String>> getrequest = my_ser.getrequest(user_id);
		System.out.println("req_jsp가는 요청자네임: "+getrequest);
		if(getrequest.isEmpty()) {
			System.out.println("요청자 없음");
			 Map<String, String> emptyMap = new HashMap<>();
			 emptyMap.put("user_id", "null");
			 getrequest.add(emptyMap);
			 System.out.println("요청자 없을때 null가? " + getrequest);
			 return getrequest;
		}
		return getrequest;
		
	}
	
	//내 글 가져오기
	@GetMapping("/myboard")
	public duo_dto myboard(HttpSession session) {
		String user_id = session.getAttribute("id").toString();
		System.out.println("req_세션에 저장된ID: "+user_id);
		duo_dto getmyboard = my_ser.getmyboard(user_id);
		System.out.println("컨트롤로 리턴 직전"+getmyboard);
		System.out.println(getmyboard);
		return getmyboard;
	}
	
	//게시글 삭제
	@PutMapping("/deleteboard")
	public int deleteboard(HttpSession session) {
		String user_id = session.getAttribute("id").toString();
		System.out.println("req_세션에 저장된ID: "+user_id);
		int deleteboard = my_ser.go_deleteboard(user_id);
		System.out.println("컨트롤러 돌아온 값이 1이면 삭제성공: "+deleteboard);
		System.out.println(deleteboard);
		return deleteboard;
	}
	
	//요청 거절
	@DeleteMapping("/deleterequest")
	public int deleterequest(@RequestBody Map<String, String> ajax_user_lolname, HttpSession session) {
	    String user_id = session.getAttribute("id").toString();
	    String user_lolname = ajax_user_lolname.get("user_lolname");
	    System.out.println("컨트롤러 거절 세션에 저장된 ID: " + user_id);
	    System.out.println("컨트롤러 거절 중 요청자 ID: " + user_lolname);

	    int refuse = my_ser.delrequest(user_id, user_lolname);
	    System.out.println("컨트롤러, refuse 값: " + refuse);
	    return refuse;
	}
	
	//요청 수락시
	@PutMapping("/acceptduo")
	public String acceptduo(@RequestBody Map<String, String> ajax_user_lolname, HttpSession session) {
		String user_lolname = ajax_user_lolname.get("user_lolname");
		System.out.println("요청 수락 컨트롤러 유저네임: "+user_lolname);
		String user_id = session.getAttribute("id").toString();
		System.out.println("요청 수락 컨트롤러 내 id:"+user_id);
		String accpeptduo = my_ser.go_accept(user_lolname,user_id);
		System.out.println("요청수락 리턴 값: "+accpeptduo);
		return accpeptduo;
	}
	
	//myduo 가져오기!
	@GetMapping("/myduo")
	public List<mypage_dto> getmyduo(HttpSession session){
		String user_id = session.getAttribute("id").toString();
		System.out.println("듀오 목록 Id: "+ user_id);
		List<mypage_dto> myduo = my_ser.getmyduo(user_id);
		System.out.println("듀오 목록 컨트롤러 return: " +myduo);
		return myduo;
		
	}
}
