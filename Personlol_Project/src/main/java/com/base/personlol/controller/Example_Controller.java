package com.base.personlol.controller;

<<<<<<< HEAD
=======
import java.lang.reflect.Member;
>>>>>>> 58412c354639774268d14b73636287d20b9b2107
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
<<<<<<< HEAD
import com.base.personlol.dto.test2Dto;
=======
import com.base.personlol.dto.Test_member_dto;
>>>>>>> 58412c354639774268d14b73636287d20b9b2107
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
<<<<<<< HEAD
		System.out.println("컨트롤러 ajox 데이터 넘오는 거:"+nums);
		return ex_ser.testDB(nums);
	}
	
	@GetMapping("/sum_num")
	public @ResponseBody test2Dto sum(@RequestParam Map<String,Integer> nums1) {
		System.out.println("깐트롤라 ajox2:" + nums1);
		return test2MM.testSum(nums1);
	}
	
	@PostMapping("/join")
	public @ResponseBody Integer join(@RequestParam Map<String, Integer> join) {
		System.out.println("join이다"+ join);
		Integer join1 = test2MM.join(join);
		return join1;
	}
	
	

}
=======
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
>>>>>>> 58412c354639774268d14b73636287d20b9b2107
