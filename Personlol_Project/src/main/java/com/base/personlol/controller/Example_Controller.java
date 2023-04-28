package com.base.personlol.controller;


import java.lang.reflect.Member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.dto.Example_dto;

import com.base.personlol.dto.Test_member_dto;

import com.base.personlol.dto.test2Dto;

import com.base.personlol.service.Example_service;
import com.base.personlol.service.test2MM;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/example")

public class Example_Controller {
	
	@Autowired
	Example_service ex_ser;
	
	@Autowired
	test2MM test2MM;
	
	
	
	@GetMapping("/")
	public String example() {
		return "example";
	}
	
	@GetMapping("/ws")
	public String websocket() {
		return "websocket";
	}
	
	@GetMapping(value="/test-ajax", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Example_dto testAjax(@RequestParam Map<String, Integer> nums) {
		System.out.println(nums);
		return ex_ser.testDB(nums);
	}
	
	@GetMapping("/test-logine")
	public String testLogine() {
		return "testlogine";
	}
	
	@GetMapping("/test-join")
	public String testJoin() {
		return "testjoin";
	}
	
	@GetMapping("/test-agree")
	public String testAgree() {
		return "testagree";
	}
	
	@GetMapping("/test-idfind")
	public String testIdfind() {
		return "testidfind";
	}
	
	@GetMapping("/test-pwfind")
	public String testPwfind() {
		return "testpwfind";
	}
	
	@GetMapping("/test-success")
	public String testSucess() {
		return "testsuccess";
	}
	
	@PostMapping(value="/ajax-join", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String,String> testAjaxJoin(HttpServletRequest request) {
		
		Map<String,String> result = new HashMap<String,String>();
		
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		String pwchk = request.getParameter("pwchk");
		String account = request.getParameter("account");
		
		
		Test_member_dto member = new Test_member_dto();
		
		member.setUserid(id);
		member.setUserpw(pw);
		member.setPwchk(pwchk);
		member.setAccount(account);
		
		System.out.println("member" + member);
		int insertRst = ex_ser.testDB3(member);
		
		if(insertRst > 0) {
			String msg = "성공";
			String code = "0";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}else {
			String msg = "실패";
			String code = "1";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}	
	}
	@PostMapping("/join")
	public @ResponseBody Integer join(@RequestParam Map<String, Integer> join) {
		int join1 = test2MM.join(join);
		System.out.println("join1: " + join1);
		return join1;		
	}
	
}//
