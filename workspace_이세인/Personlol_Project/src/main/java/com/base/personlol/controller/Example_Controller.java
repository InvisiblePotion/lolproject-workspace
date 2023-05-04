package com.base.personlol.controller;


import java.lang.reflect.Member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("/test-changepw")
	public String testchangepw() {
		return "changepw";
	}
	
	@GetMapping("/testidfound")
	public String testidfound() {
		return "testidfound";
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
		
		Random random = new Random();
		
		// usercode 생성기
		StringBuilder sb = new StringBuilder();
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		for (int i = 0; i < 8; i++) {
		    int index = random.nextInt(characters.length());
		    char randomChar = characters.charAt(index);
		    sb.append(randomChar);
		}
	
		String usercode = sb.toString();
		member.setUsercode(usercode);
	
		int insertRst = ex_ser.testDB3(member);
		
		System.out.println("insertRst는:"+insertRst);
		
		if(insertRst == 1) {
			String msg = "성공";
			String code = "1";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}else {
			String msg = "실패";
			String code = "0";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}	
	}
	
	//회원가입
	@PostMapping(value = "/join" , produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Integer join(@RequestParam Map<String, Integer> join) {
		int join1 = test2MM.join(join);
		System.out.println("join1: " + join1);
		return join1;		
	}
	
	//로그인
	@GetMapping(value = "/test-login", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody int login(HttpServletRequest request,@RequestParam Map<String, String> logindata) {
		
	
		System.out.println("깐트롤라 logindata idpw:"+logindata);
		String id = logindata.get("userid");
		
		String return_id = ex_ser.login(logindata);
		
		
		boolean bool = return_id.equals(id);
		if(bool) {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", return_id);
			System.out.println("세션저장아이디"+session.getAttribute("id"));
			return 1;
		}else {
			return 0;
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		System.out.println("완료");
		return "example";
	}
	
//	@GetMapping("/idfind")
//	public String idfind(@RequestParam Map<String,String> idfinddata) {
//		System.out.println("깐트롤라 idfind"+idfinddata);
//		String findid = ex_ser.idfind(idfinddata);
//		System.out.println("컨틀롤러로 돌아온 id: "+ findid);
//		return findid;
//	}
	
	
	@GetMapping("/pwfind")
	public @ResponseBody String pwfind(@RequestParam Map<String,String> pwfinddata) {
		System.out.println("깐트롤라 pwfinddata: "+pwfinddata);
		String findpw = ex_ser.pwfind(pwfinddata);
		System.out.println("컨트롤러 찾아온 값은~?: "+findpw);
		return findpw;
	}
	
	@GetMapping("/idfind")
	public ModelAndView idfind(@RequestParam("account") String account, @RequestParam("usercode") String usercode) {
		System.out.println("깐트롤러 모뷰 계정,유저id: "+account+", "+usercode);
		String findid = ex_ser.idfind(account,usercode);
		System.out.println("깐트롤라 마지막 찾아온 id = "+findid);
		
		return new ModelAndView("testidfound").addObject("findid",findid);
	}
	
	
	@PutMapping(value = "/changepw")
	public @ResponseBody Integer changepw(@RequestBody Map<String,String> changepwdata) {
	    System.out.println("넘오오냐 풋?: " + changepwdata);
	    Integer changepw = ex_ser.changepw(changepwdata);
	    System.out.println("돌아온 changepw:" + changepw);
	    System.out.println("-1실패 0바꿀거 없음 1굳!");
	    return changepw;
	}
	
	
	@PutMapping("/newcode")
	public @ResponseBody Integer newcode(@RequestBody Map<String,String> id) {
		System.out.println("세션에 저장된 id?:"+ id);
		Integer newcode = ex_ser.newcode(id);
		System.out.println("돌아온 업데이트 값은? 0 1 -1?: "+ id);
		return newcode;
	}
	
	@DeleteMapping("/deletemember")
	public @ResponseBody Integer deletemember(@RequestBody Map<String,String> userid) {
		System.out.println("삭제할려고하는id는?: "+ userid);
		Integer deletemember = ex_ser.deletemember(userid);
		return deletemember;
	}

}//
