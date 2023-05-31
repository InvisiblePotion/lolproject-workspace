package com.base.personlol.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.base.personlol.dto.userinfo_dto;
import com.base.personlol.service.user_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/user")
public class R_userinfo_Controller {
	
	@Autowired //서비스 클래스 연결
	user_service u_ser;
	
	//회원가입
	@PostMapping(value="/join", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String,String> testAjaxJoin(HttpServletRequest request) {
		
		Map<String,String> result = new HashMap<String,String>();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_lolname = request.getParameter("user_lolname");
		
		
		userinfo_dto userinfo = new userinfo_dto(); //dto를 만들어서~
		
		userinfo.setUser_id(user_id);
		userinfo.setUser_pw(user_pw);
		userinfo.setUser_lolname(user_lolname);	//삽입하고~
		
		Random random = new Random();
		
		// usercode 생성기
		StringBuilder sb = new StringBuilder();
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		for (int i = 0; i < 8; i++) {
		    int index = random.nextInt(characters.length());
		    char randomChar = characters.charAt(index);
		    sb.append(randomChar);
		}
	
		String user_code = sb.toString();
		userinfo.setUser_code(user_code);	// 유저코드까지 넣어준다음에~
	
		int insertRst = u_ser.insertinfo(userinfo);
		System.out.println("u_mm갔다온 insertRst는:"+insertRst);
		
		if(insertRst == 1) {
			String msg = "성공";
			String code = "1";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}else if(insertRst == 0){
			//lolname중복
			String msg = "롤 네임 중복";
			String code = "0";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}else if(insertRst == -1) {
			//id 중복
			String msg = "아이디 중복";
			String code = "-1";
			
			result.put("Msg", msg);
			result.put("code",code);
			
			return result;
		}else if(insertRst == -99){
			//서버에 롤네임 없음
			String msg = "서버에 등록된 닉네임이 아닙니다";
			String code ="-99";
			
			result.put("Msg", msg);
			result.put("code",code);
			return result;
			
		}else {
			String msg = "알수없는 이유";
			String code = "1000";
			
			result.put("Msg", msg);
			result.put("code",code);
			return result;
		}
		
	}	//회원가입 끝	
	
	//로그인
	@GetMapping(value = "/login", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody int login(HttpServletRequest request, @RequestParam Map<String, String> logindata) {

		System.out.println("깐트롤라 logindata idpw:"+logindata);
		String user_id = logindata.get("user_id");
		
		String return_id = u_ser.login(logindata);
		
		
		boolean bool = return_id.equals(user_id);
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
		String findpw = u_ser.pwfind(pwfinddata);
		System.out.println("컨트롤러 찾아온 값은~?: "+findpw);
		return findpw;
	}
	
	//비밀번호 바꾸기
	@PutMapping(value = "/changepw")
	public @ResponseBody Integer changepw(@RequestBody Map<String,String> changepwdata) {
	    System.out.println("넘오오냐 풋?: " + changepwdata);
	    Integer changepw = u_ser.changepw(changepwdata);
	    System.out.println("돌아온 changepw:" + changepw);
	    System.out.println("-1실패 0바꿀거 없음 1굳!");
	    return changepw;
	}
	
	//회원탈퇴
	@DeleteMapping("/deletemember")
	public @ResponseBody Integer deletemember(@RequestBody Map<String,String> userid, HttpSession session) {
		System.out.println("삭제할려고하는id는?: "+ userid);
		Integer deletemember = u_ser.deletemember(userid);
		session.invalidate();
		return deletemember;
	}
	
	//뉴코드 생성
	@PutMapping("/newcode")
	public @ResponseBody Integer newcode(@RequestBody Map<String,String> id) {
		System.out.println("받아온 id는?:"+ id);
		Integer newcode = u_ser.newcode(id);
		System.out.println("돌아온 업데이트 값은? 0 1 -1?: "+ id);
		return newcode;
	}
	
	//서버에 롤 네임이 등록이 되어있는가
	@GetMapping("/checkserver")
	public int checkserver(@RequestParam  String user_lolname) {
		System.out.println("검색시 받아오는 롤네임: "+user_lolname);
		int checkResult = u_ser.checksvlolname(user_lolname);
		// 1이면 서버에 존재함
		if(checkResult == 1) {
			System.out.println("검색 가능");
			return checkResult;
		}else {
			System.out.println("검색 불가능");
			return -999;	
		}
		
	}
	//서버에서 롤 이름 가져오기
	@GetMapping("/get_user_lolname")
	public String getUserLolname(@RequestParam String user_id ) {
		String user_lolname = u_ser.getUserLolname(user_id);
		System.out.println("컨트롤러 롤네임??"+user_lolname);
		return user_lolname;
	}
	
}
