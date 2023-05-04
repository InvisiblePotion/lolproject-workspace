package com.base.personlol.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.service.Example_service;
import com.base.personlol.service.test2MM;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")

public class user_Controller {
	
	@Autowired	//서비스 영역
	Example_service ex_ser;
	
	@Autowired	//MM영역
	test2MM test2MM;
	
	@GetMapping("/") //메인으로 이동
	public String example() {
		return "example";
	}
	
	//약관동의
	@GetMapping("/test-agree")
	public String testAgree() {
		return "testagree";
	}
	
	//로그인
	@GetMapping("/test-logine")
	public String testLogine() {
		return "testlogine";
	}
	
	//아이디 찾기
	@GetMapping("/test-idfind")
	public String testIdfind() {
		return "testidfind";
	}
	
	//비밀번호 찾기
	@GetMapping("/test-pwfind")
	public String testPwfind() {
		return "testpwfind";
	}
	
	//회원가입
	@GetMapping("/test-join")
	public String testJoin() {
		return "testjoin";
	}
	
	//회원가입 성공
	@GetMapping("/test-success")
	public String testSucess() {
		return "testsuccess";
	}
	
	//비밀번호 변경
	@GetMapping("/test-changepw")
	public String testchangepw() {
		return "changepw";
	}
	
	//아이디 찾기 성공
	@GetMapping("/testidfound")
	public String testidfound() {
		return "testidfound";
	}
	
	//아이디 찾기 기능
	@GetMapping("/idfind")
	public ModelAndView idfind(@RequestParam("account") String account, @RequestParam("usercode") String usercode) {
		System.out.println("깐트롤러 모뷰 계정,유저id: "+account+", "+usercode);
		String findid = ex_ser.idfind(account,usercode);
		System.out.println("깐트롤라 마지막 찾아온 id = "+findid);
		
		return new ModelAndView("testidfound").addObject("findid",findid);
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		System.out.println("완료");
		return "example";
	}
	

}
