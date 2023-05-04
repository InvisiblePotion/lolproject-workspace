package com.base.personlol.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.Example_dao;
import com.base.personlol.dto.Example_dto;
import com.base.personlol.dto.Test_member_dto;

@Service
public class Example_service {
	
	@Autowired
	Example_dao ex_dao;
	
	public Example_dto testDB(Map<String, Integer> nums) {
		System.out.println("MM에 넘어오는 ajox:"+nums);
		return ex_dao.testDB(nums);
	}


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
			return ex_dao.testDB3(member);
		}
	}
	
	private int checkDB (String userid) {
		return ex_dao.cheackID(userid); 
	}
	
	private int checkCode (String usercode) {
		System.out.println("코드체크 했어요~");
		return ex_dao.cheackCode(usercode);
	}

	public String login(Map<String,String> logindata) {
		System.out.println("가져가니mm?:" + logindata);
		String login_access = ex_dao.login(logindata);
		System.out.println("가져왔어mm?:"+login_access);
		if(login_access != null) {
			return login_access;
		}else {
			return "fail";
		}
		
	}
	
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


//	public String idfind(Map<String, String> idfinddata) {
//		System.out.println("mmidfind는~?"+idfinddata);
//		String findid = ex_dao.idfind(idfinddata);
//		System.out.println("찾아온 fidnid는~?:"+findid);
//		return findid;
//	}


	public String pwfind(Map<String, String> pwfinddata) {
		System.out.println("mmpwfind~?: "+pwfinddata);
		String findpw = ex_dao.pwfind(pwfinddata);
		System.out.println("찾아온 값은~? 0?1? " +findpw);
		return findpw;
	}


	public String idfind(String account, String usercode) {
		System.out.println("mmidfind는~?: "+account+", "+usercode);
		String findid = ex_dao.idfind(account, usercode);
		System.out.println("찾아온 fidnid는~?:"+findid);
		return findid;
	}


	public Integer changepw(Map<String, String> changepwdata) {
		int checknewpw = checknewpw(changepwdata.get("usercode"));
		System.out.println("MM의 checknewpw: "+ checknewpw);
		if(checknewpw == 1) {
			System.out.println("checknewpw 1이야~");
			Integer changepw = ex_dao.changepw(changepwdata);
			System.out.println("업데이트 여부: "+ changepw);
			return changepw;
		}else {
			
		}
		return null;		
	}
	
	private int checknewpw(String usercode) {
		int checknewpw = ex_dao.checknewpw(usercode);
		return checknewpw;
	}


	public Integer newcode(Map<String, String> id) {
		String usercode = generateRandomUserCode();
		System.out.println("새로운 usercode는?: "+ usercode);
		
		id.put("usercode", usercode);
		System.out.println("새로운 id라는 Map저장된 것은~?"+id);
		
		int checkCode = checkCode(id.get("usercode"));
		if(checkCode == 0) {
			Integer newcode = ex_dao.newcode(id);
			return newcode;
		}else {
			String newusercode = generateRandomUserCode();
			System.out.println("중복이에용 다시 발급합니당"+newusercode);
			id.put("usercode", newusercode);
			Integer newcode = ex_dao.newcode(id);
			return newcode;
		}
	}


	public Integer deletemember(Map<String, String> userid) {
		System.out.println("MM탔어용"+userid);
		Integer deletemember = ex_dao.deletemember(userid);
		System.out.println("삭제 됬나용? 1삭 0~-1 오류");
		if(deletemember == 1) {
			return deletemember;		
		}else {
			return null;
			//null 값은 오류에영
		}
		
	}

}
