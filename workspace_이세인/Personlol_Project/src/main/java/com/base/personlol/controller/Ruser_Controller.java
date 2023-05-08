package com.base.personlol.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.dto.Test_member_dto;
import com.base.personlol.service.Example_service;
import com.base.personlol.service.test2MM;
import com.base.personlol.service.userMM;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/user")

public class Ruser_Controller {
	
	
	@Autowired //찐서비스 영역
	userMM u_MM;
	
	//회원가입
	@PostMapping(value="/ajax-join", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String,String> testAjaxJoin(HttpServletRequest request) {
		
		Map<String,String> result = new HashMap<String,String>();
		
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		String pwchk = request.getParameter("pwchk");
		String account = request.getParameter("account");
		
		
		Test_member_dto member = new Test_member_dto(); //dto를 만들어서~
		
		member.setUserid(id);
		member.setUserpw(pw);
		member.setPwchk(pwchk);
		member.setAccount(account);	//삽입하고~
		
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
		member.setUsercode(usercode);	// 유저코드까지 넣어준다음에~
	
		int insertRst = u_MM.testDB3(member);
		System.out.println("u_mm갔다온 insertRst는:"+insertRst);
		
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
	}	//회원가입 끝
	
	//로그인
	@GetMapping(value = "/test-login", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody int login(HttpServletRequest request, @RequestParam Map<String, String> logindata) {
		
	
		System.out.println("깐트롤라 logindata idpw:"+logindata);
		String id = logindata.get("userid");
		
		String return_id = u_MM.login(logindata);
		
		
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
	//비밀번호 찾기
	@GetMapping("/pwfind")
	public @ResponseBody String pwfind(@RequestParam Map<String,String> pwfinddata) {
		System.out.println("깐트롤라 pwfinddata: "+pwfinddata);
		String findpw = u_MM.pwfind(pwfinddata);
		System.out.println("컨트롤러 찾아온 값은~?: "+findpw);
		return findpw;
	}
	
	//비밀번호 바꾸기
	@PutMapping(value = "/changepw")
	public @ResponseBody Integer changepw(@RequestBody Map<String,String> changepwdata) {
	    System.out.println("넘오오냐 풋?: " + changepwdata);
	    Integer changepw = u_MM.changepw(changepwdata);
	    System.out.println("돌아온 changepw:" + changepw);
	    System.out.println("-1실패 0바꿀거 없음 1굳!");
	    return changepw;
	}
	
	//회원탈퇴
	@DeleteMapping("/deletemember")
	public @ResponseBody Integer deletemember(@RequestBody Map<String,String> userid) {
		System.out.println("삭제할려고하는id는?: "+ userid);
		Integer deletemember = u_MM.deletemember(userid);
		return deletemember;
	}

	
} //EndClass
