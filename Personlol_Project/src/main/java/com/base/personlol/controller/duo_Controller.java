package com.base.personlol.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.base.personlol.dto.duo_dto;
import com.base.personlol.dto.userinfo_dto;
import com.base.personlol.service.duo_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/duo")
public class duo_Controller {

	@Autowired
	duo_service dse;	

	/* 리스트 가져오기 */
	@GetMapping("/")
	public ModelAndView duo( HttpSession session) {
		List<duo_dto> dList = dse.getList();
		
		//로그인 상태 확인
		String loginCheck = "";
	    Object userId = session.getAttribute("id");
		System.out.println("로그인이 되있나요? ="+userId);
	    
	    //로그인 중이라면...
	    if (userId != null) {
	    	loginCheck = userId.toString();
	    }else {
	    	
	    }
	    
	    //유저 롤 닉네임 뿌리는 메소드
	    Map<String, userinfo_dto> userInfoMap = new HashMap<>();
	    
    	//듀오게시글에 유저 롤 이름 넣기
        for (duo_dto duo : dList) {
        	//유저 닉네임 선택해서 저장하는 메소드 
            userinfo_dto userInfo = dse.getUserInfo(duo.getDuo_ownerid());
            userInfoMap.put(duo.getDuo_ownerid(), userInfo);
        }
		return new ModelAndView("duo").addObject("dList2", dList)
					.addObject("loginCheck", loginCheck)
					.addObject("userInfoMap", userInfoMap);
	}
	
	
	// 페이지 수 구해오는 함수
	@GetMapping("/totalpage")
	public Integer highpage(@RequestParam String rank) {
		System.out.println("페이지 띄우기 rest타?"+rank);
		Integer totalpage = dse.totalpage();
		System.out.println("최대페이지 받아왔어?: "+totalpage);
		return totalpage;
	}
	
	
	
	

	@PostMapping(value = "/insert")
	public ModelAndView write(@ModelAttribute duo_dto duo, HttpSession session) {
		System.out.println("글쓰기 작동중...");
		System.out.println("글쓰기: board: "+ duo);
		
		//세션 아이디 저장된거 쓰기
		duo.setDuo_ownerid(session.getAttribute("id").toString());
		
		boolean result = dse.duoWrite(duo);
		
		if (result == true) {
			System.out.println("삽입 성공입니다.");
			return new ModelAndView("redirect:/duo/");
		} else {
			return new ModelAndView("join.jsp");
		}
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(Integer duo_id, HttpSession session) {
		
		System.out.println("controller_Delete="+duo_id);
		
		String loginCheck = session.getAttribute("id").toString();
		System.out.println("로그인된 아이디 = "+loginCheck);
	
		if(loginCheck != null) {
			String ownerId = dse.getId(duo_id);
			
			//작성자 아이디와 일치하는지?
			if(loginCheck.equals(ownerId)) {
				//삭제 메소드
			    dse.Disable(duo_id);
			    return new ModelAndView("redirect:/duo/");
			}else {
				return new ModelAndView("redirect:/example/err");
			}
		}else {
			  return new ModelAndView("redirect:/example/err");
		}
	}

	@GetMapping(value="/accept/{duo_id}")
	public ModelAndView Accept(@PathVariable("duo_id") int duo_id, HttpSession session) {
		System.out.println("수락하기 작동중...");
		
		System.out.println("duo_id = "+duo_id);
		
		String loginCheck = session.getAttribute("id").toString();
		
		//로그인 상태인지?
		if(loginCheck != null) {
			String ownerId = dse.getId(duo_id);
			//작성자 아이디와 일치하면 안됨.
			if(!loginCheck.equals(ownerId)) {
				//수락 메소드
			    dse.accept(duo_id, loginCheck);
			    //수락한 사람의 다른 글 모두 비활성화
			    dse.convert(loginCheck);
			    
			    return new ModelAndView("redirect:/duo/");
			}else {
				return new ModelAndView("redirect:/example/err");
			}
			
		}else {
			  return new ModelAndView("redirect:/example/err");
		}
	}
	
	
	

}
