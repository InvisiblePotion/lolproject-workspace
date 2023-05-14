package com.base.personlol.service;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.base.personlol.dao.user_dao;
import com.base.personlol.dto.userinfo_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service

public class user_service {
	@Autowired
	user_dao u_dao;
	

	public int insertinfo(userinfo_dto userinfo) {
		int a = checkID(userinfo.getUser_id());
		int b = checkCode(userinfo.getUser_code());
		
		System.out.println("프리베이트 찍히나요~?:"+a+" "+b);
		if (a == 1 || b ==1) {
			System.out.println("MM실패 탔어요~");
			System.out.println("if문안의 코드에용"+userinfo.getUser_code());
			return 0;
		}else {
			System.out.println("MM성공 탔어요~");
			System.out.println("if문안의 코드에용"+userinfo.getUser_code());
			return u_dao.insertinfo(userinfo);
		}
	}
	
	private int checkID (String userid) {
		return u_dao.cheackID(userid); //조인에서 쓰는 id중복체크~
	}
	
	private int checkCode (String usercode) {
		System.out.println("코드체크 했어요~");
		return u_dao.checkCode(usercode);	//조인에서 쓰는 코드중복체크~
	}
	
	//id찾기 MM
	public String idfind(String user_lolname, String user_code) {
		System.out.println("mmidfind는~?: "+user_lolname+", "+user_code);
		String findid = u_dao.idfind(user_lolname, user_code);
		if(findid == null) {
			return null;
		}
		System.out.println("찾아온 fidnid는~?:"+findid);
		return findid;
	}

	
	//비밀번호 찾기 MM
	public String pwfind(Map<String, String> pwfinddata) {
		System.out.println("mmpwfind~?: "+pwfinddata);
		String findpw = u_dao.pwfind(pwfinddata);
		System.out.println("찾아온 값은~? 0?1? " +findpw);
		return findpw;
	}
	
	//비번 바꾸기
	public Integer changepw(Map<String, String> changepwdata) {
		System.out.println("ser changepwdata는 "+changepwdata);
		int checknewpw = u_dao.checknewpw(changepwdata.get("user_code"));
		System.out.println("MM의 checknewpw: "+ checknewpw);
		if(checknewpw == 1) {
			System.out.println("checknewpw 1이야~");
			Integer changepw = u_dao.changepw(changepwdata);
			System.out.println("업데이트 여부: "+ changepw);
			return changepw;
		}else {
			
		}
		return null;		
	}
	
	//비번 바꾸기 중 code 여부 체크
	private int checknewpw(String usercode) {
		int checknewpw = u_dao.checknewpw(usercode);
		System.out.println("체크 여부: "+ checknewpw);
		return checknewpw;
	}
	
	//로그인 MM
	public String login(Map<String,String> logindata) {
		System.out.println("가져가니mm?:" + logindata);
		String login_access = u_dao.login(logindata);
		System.out.println("가져왔어mm?:"+login_access);
		if(login_access != null) {
			return login_access;
		}else {
			return "fail";
		}
		
	}

	//회원탈퇴 MM
	public Integer deletemember(Map<String, String> userid) {
		System.out.println("MM탔어용"+userid);
		Integer deletemember = u_dao.deletemember(userid);
		System.out.println("삭제 됬나용? 1삭 0~-1 오류");
		if(deletemember == 1) {
			return deletemember;		
		}else {
			return null;
			//null 값은 오류에영
		}
		
	}
	
	//코드 생성기(수정하세요 월욜에!)
	public String generateRandomUserCode() {
		
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            sb.append(randomChar);
        }
        String randomString = sb.toString();
        return randomString;
    }
	
	//뉴코드 생성기(수정하세요!)
	public Integer newcode(Map<String, String> id) {
		String user_code = generateRandomUserCode();
		System.out.println("새로운 user_code는?: "+ user_code);
		
		id.put("user_code", user_code);
		System.out.println("새로운 id라는 Map저장된 것은~?"+id);
		
		//발급 코드 중복 여부 체크 중복되지 않으면 0반환
		int checkCode = u_dao.checkCode(id.get("user_code"));
		
		if(checkCode == 0) {
			//유저코드 업데이트
			Integer newcode = u_dao.newcode(id);
			return newcode;
			
		}else {
			String newusercode = generateRandomUserCode();
			System.out.println("중복이에용 다시 발급합니당"+newusercode);
			id.put("user_code", newusercode);
			Integer newcode = u_dao.newcode(id);
			return newcode;
		}
	}
	

	
	

}
