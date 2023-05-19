package com.base.personlol.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
}
