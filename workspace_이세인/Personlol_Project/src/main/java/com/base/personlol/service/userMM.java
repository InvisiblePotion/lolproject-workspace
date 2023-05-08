package com.base.personlol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.base.personlol.dao.Example_dao;
import com.base.personlol.dao.user_dao;
import com.base.personlol.dto.Test_member_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Service

public class userMM {
//	@Autowired	//임시 dao 연결~
//	Example_dao ex_dao;
	
	@Autowired
	user_dao u_dao;

	
	public int testDB3(Test_member_dto member) {
		int a = checkDB(member.getUserid());
		int b = checkCode(member.getUsercode());
		System.out.println("프리베이트 찍히나요~?:"+a);
		if (a == 1 || b ==1) {
			System.out.println("MM실패 탔어요~");
			System.out.println("if문안의 코드에용"+member.getUsercode());
			return 0;
		}else {
			System.out.println("MM성공 탔어요~");
			System.out.println("if문안의 코드에용"+member.getUsercode());
			return u_dao.testDB3(member);
		}
	}
	
	private int checkDB (String userid) {
		return u_dao.cheackID(userid); //조인에서 쓰는 id중복체크~
	}
	
	private int checkCode (String usercode) {
		System.out.println("코드체크 했어요~");
		return u_dao.cheackCode(usercode);	//조인에서 쓰는 코드중복체크~
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
	
	//pw찾기 MM
	public String pwfind(Map<String, String> pwfinddata) {
		System.out.println("mmpwfind~?: "+pwfinddata);
		String findpw = u_dao.pwfind(pwfinddata);
		System.out.println("찾아온 값은~? 0?1? " +findpw);
		return findpw;
	}
	
	
	
	//id찾기 MM
	public String idfind(String account, String usercode) {
		System.out.println("mmidfind는~?: "+account+", "+usercode);
		String findid = u_dao.idfind(account, usercode);
		System.out.println("찾아온 fidnid는~?:"+findid);
		return findid;
	}
	
	//비번 바꾸기
	public Integer changepw(Map<String, String> changepwdata) {
		int checknewpw = checknewpw(changepwdata.get("usercode"));
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
	
}//MM끝
