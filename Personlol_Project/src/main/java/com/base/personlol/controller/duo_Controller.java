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

	@GetMapping("/")
	public String duo() {
		return "duo";
	}
	/* 리스트 가져오기 */
//	@GetMapping("/")
//	public ModelAndView duo( HttpSession session) {
//		List<duo_dto> dList = dse.getList();
//		
//		//로그인 상태 확인
//		String loginCheck = "";
//	    Object userId = session.getAttribute("id");
//		System.out.println("로그인이 되있나요? ="+userId);
//	    
//	    //로그인 중이라면...
//	    if (userId != null) {
//	    	loginCheck = userId.toString();
//	    }else {
//	    	
//	    }
//	    
//	    //유저 롤 닉네임 뿌리는 메소드
//	    Map<String, userinfo_dto> userInfoMap = new HashMap<>();
//	    
//    	//듀오게시글에 유저 롤 이름 넣기
//        for (duo_dto duo : dList) {
//        	//유저 닉네임 선택해서 저장하는 메소드 
//            userinfo_dto userInfo = dse.getUserInfo(duo.getDuo_ownerid());
//            userInfoMap.put(duo.getDuo_ownerid(), userInfo);
//        }
//		return new ModelAndView("duo").addObject("dList2", dList)
//					.addObject("loginCheck", loginCheck)
//					.addObject("userInfoMap", userInfoMap);
//	}

	@PostMapping(value = "/insert")
	public ModelAndView write(@ModelAttribute duo_dto duo, HttpSession session, RedirectAttributes attr) {
		System.out.println("글쓰기 작동중...");
		System.out.println("글쓰기: board: " + duo);

		// 세션 아이디 저장된거 쓰기
		duo.setDuo_ownerid(session.getAttribute("id").toString());

		boolean result = dse.duoWrite(duo);

		if (result == true) {
			System.out.println("삽입 성공입니다.");
			attr.addFlashAttribute("msg", "글쓰기가 완료되었습니다.");
			return new ModelAndView("redirect:/duo/");
		} else {
			System.out.println("이미 작성된 글이 있습니다.");
			attr.addFlashAttribute("msg","이미 작성된 글이 있습니다.");
			return new ModelAndView("redirect:/duo/");
		}
	}

	@GetMapping("/isLoggedIn")
	public @ResponseBody boolean isLoggedIn(HttpSession session) {
		// 로그인 상태 확인하는 API
		Object userId = session.getAttribute("id");
		System.out.println("로그인된 세션값은?" + userId);
		return (userId != null);
	}

	@GetMapping("/delete")
	public ModelAndView delete(Integer duo_id, HttpSession session) {

		System.out.println("controller_Delete=" + duo_id);

		String loginCheck = session.getAttribute("id").toString();
		System.out.println("로그인된 아이디 = " + loginCheck);

		if (loginCheck != null) {
			
			String ownerId = dse.getId(duo_id);

			// 작성자 아이디와 일치하는지?
			if (loginCheck.equals(ownerId)) {
				// 삭제 메소드
				dse.Disable(duo_id);
				return new ModelAndView("redirect:/duo/");
			} else {
				return new ModelAndView("redirect:/duo/");
			}
		} else {
			return new ModelAndView("redirect:/duo/");
		}
	}

	@GetMapping(value = "/request/{duo_id}")
	public ModelAndView Accept(@PathVariable("duo_id") int duo_id, HttpSession session,RedirectAttributes attr) {
		System.out.println("수락하기 작동중...");

		System.out.println("요청받은 자 게시글번호 = " + duo_id);
		
		//요청자(페이지이용자) id
		String request_id = session.getAttribute("id").toString();

		// 로그인 상태인지?
		if (request_id != null) {
			// 게시글 번호 -> 작성자 아이디를 가져옴
			String user_id = dse.getId(duo_id);

			// 작성자 아이디와 일치하면 안됨.
			if (!request_id.equals(user_id)) {
				// 요청 메소드
				Integer insert_request = dse.request(user_id, request_id);
				System.out.println("삽입 요청: " + insert_request);
				
				
				if (insert_request == 1) {
					System.out.println("삽입성공");
					attr.addFlashAttribute("msg","요청이 완료되었습니다.");
					return new ModelAndView("redirect:/duo/");
					
				}else if(insert_request == -99){
					System.out.println("중복된 회원에게 요청하였습니다.");
					attr.addFlashAttribute("msg","중복된 요청입니다");
					return new ModelAndView("redirect:/duo/");
					
				}else {
					System.out.println("삽입실패");
					attr.addFlashAttribute("msg","요청이 실패했습니다.");
					return new ModelAndView("redirect:/duo/");
					
				}

			}else {
				System.out.println("아이디가 작성자와 일치");
				attr.addFlashAttribute("msg","본인의 글입니다");
				return new ModelAndView("redirect:/duo/");

			}
		}else {
			System.out.println("로그인 안함!=null");
			attr.addFlashAttribute("msg","로그인 후 이용해주세요");
			return new ModelAndView("redirect:/duo/");	
			
		}
		
	}

	@GetMapping(value = "/lane")
	public @ResponseBody List<Map<String, Object>> SelectLine(@RequestParam("lane") String jsp_lane,
			@RequestParam("page") int page, @RequestParam("tier") String tier, HttpSession session) {
		System.out.println("받아온 jsp_lane은??" + jsp_lane);
		System.out.println("선택하면 tier받아와? 선택안하면 null: " + tier);

		System.out.println("컨트롤러 세션s_lane: " + session.getAttribute("s_lane"));
		session.setAttribute("s_lane", jsp_lane);
		String lane = session.getAttribute("s_lane").toString();

		System.out.println("재정의 된 sessions_lane: " + lane);

		List<Map<String, Object>> dList = dse.Line(lane, page, tier);
		System.out.println("결과값 확인" + dList);
		return dList;

	}

	@GetMapping("/check-login-status")
	public @ResponseBody Map<String, Object> checkLoginStatus(HttpSession session) {
		boolean isLoggedIn = (session.getAttribute("id") != null);
		Object loginCheck = session.getAttribute("id"); // loginCheck 값을 가져옴

		Map<String, Object> response = new HashMap<>();
		response.put("loggedIn", isLoggedIn);
		response.put("loginCheck", loginCheck); // 응답에 loginCheck 값을 포함시킴

		return response;
	}

}
