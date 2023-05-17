package com.base.personlol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.PostMapping;
=======
>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.base.personlol.dto.duo_dto;
import com.base.personlol.service.duo_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/duo")
public class duo_Controller {

<<<<<<< HEAD
	@Autowired
	duo_service dse;	

	/* 리스트 가져오기 */
	@GetMapping("/")
	public ModelAndView duo(String json) {
		List<duo_dto> dList = dse.getList();
		System.out.println(dList);
		return new ModelAndView("duo").addObject("dList", dList);
	}

	@PostMapping("/duo_write_ajax")
	public ModelAndView write(duo_dto duo) {
		System.out.println("controller_write: " + duo.toString());
		boolean result = dse.duoWrite(duo);
		if (result) {
			return new ModelAndView("redirect:/personlol/duo/");
		} else {
			return new ModelAndView("redirect:/personlol/duo/duo_write_ajax");
		}
	}

	@PostMapping("/duo_delete_ajax")
	public @ResponseBody List<duo_dto> delete(String duo_id) {
		System.out.println("controller_delete: " + duo_id);
		boolean result = dse.duoDelete(duo_id);
		if (result) {
			List<duo_dto> bList = dse.getList();
			System.out.println("controller_delete_return: " + bList);
			return bList;
			//return new ModelAndView("redirect:/personlol/duo/");
		} else {
			return null; //new ModelAndView("redirect:/personlol/duo/duo_delete_ajax");
		}
	}

	@PostMapping("/duo_update_ajax")
	public ModelAndView update(duo_dto duo) {
		System.out.println("controller_update: " + duo.toString());
		boolean result = dse.duoUpdate(duo);
		if (result) {
			return new ModelAndView("redirect:/personlol/duo/");
		} else {
			return new ModelAndView("redirect:/personlol/duo/duo_delete_ajax");
		}
	}

	/*
	 * @GetMapping("/duo_delete_ajax") public ModelAndView Delete(Integer duo_id,
	 * RedirectAttributes attr) { boolean result = false; dse.duoDelete(duo_id);
	 * 
	 * if(result) { attr.addFlashAttribute("duo_id: ", duo_id); //세션영역에 저장후 1번사용하면
	 * 삭제됨 return new ModelAndView("redirect:/personlol/duo/"); }else { return new
	 * ModelAndView("redirect:/personlol/duo/"); //예외처리시 view ,url 설정 } }
	 */

	/* Write */
	/*
	 * @PostMapping(value="/ajax-duo_write",
	 * produces=MediaType.APPLICATION_JSON_VALUE) public @ResponseBody
	 * Map<String,String> testAjaxWrite (HttpServletRequest request) {
	 * 
	 * System.out.println(request);
	 * 
	 * Map<String,String> result = new HashMap<String,String>();
	 * 
	 * String duot = request.getParameter("duo_title"); String duoc =
	 * request.getParameter("duo_content");
	 * 
	 * duo_dto duo = new duo_dto();
	 * 
	 * duo.setDuo_title(duot); duo.setDuo_content(duoc);
	 * 
	 * int duoDb = dse.duoWriteTest(duo);
	 * System.out.println("-------duoDb: "+duoDb);
	 * 
	 * if(duoDb == 1) { String msg = "성공"; String code = "1";
	 * 
	 * result.put("Msg", msg); result.put("code",code);
	 * 
	 * return result; }else { String msg = "실패"; String code = "0";
	 * 
	 * result.put("Msg", msg); result.put("code",code);
	 * 
	 * return result; }
	 */
//}
=======
	@GetMapping("")
	public String duo() {
		return "duo";
	}
	
	
>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd
}
