package com.base.personlol.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.service.user_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class user_Controller {
	//user컨트롤러
	
	@Autowired
	user_service u_ser;
	
	//기본
	@GetMapping("/")
	public String home() {
		return "main";
	}
	// /main
	@GetMapping("/main")
	public String main() {
		return "main";
	}

	//약관동의
	@GetMapping("/agree")
	public String agree() {
		return "agree";
	}
	
	//회원가입
	@GetMapping("/join")
	public String Join() {
		return "join";
	}
	
	//회원가입 성공
	@GetMapping("/success")
	public String Sucess() {
		return "success";
	}
	
	//로그인
	@GetMapping("/logine")
	public String login() {
		return "logine";
	}
	
	//아이디 찾기
	@GetMapping("/idfind")
	public String Idfind() {
		return "idfind";
	}
	
	//아이디 찾기 성공
	@GetMapping("/idfound")
	public String idfound() {
		return "idfound";
	}
	
	//비밀번호 찾기
	@GetMapping("/pwfind")
	public String Pwfind() {
		return "pwfind";
	}
	
	//비밀번호 변경
	@GetMapping("/changepw")
	public String changepw() {
		return "changepw";
	}
	
	
	
	//아이디 찾기 기능
	@GetMapping("/goidfind")
	public ModelAndView idfind(@RequestParam("user_lolname") String user_lolname, @RequestParam("user_code") String user_code) {
		System.out.println("깐트롤러 모뷰 계정,유저id: "+user_lolname+", "+user_code);
		String findid = u_ser.idfind(user_lolname,user_code);
		System.out.println("깐트롤라 마지막 찾아온 id = "+findid);
		if(findid != null) {
			return new ModelAndView("idfound").addObject("findid",findid);
		}else {
			return new ModelAndView("idfind").addObject("msg","일치하는 아이디가 없습니다.");
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		System.out.println("세션초기화 완료");
		return "main";
	}
	
	
}
