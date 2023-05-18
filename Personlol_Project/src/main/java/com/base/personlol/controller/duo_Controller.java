package com.base.personlol.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.base.personlol.dto.Duo_dto;
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
	public ModelAndView duo() {
		List<Duo_dto> dList = dse.getList();
		System.out.println(dList.size());
		for (Duo_dto duo_dto : dList) {
			System.out.println(duo_dto);
		}
		
		return new ModelAndView("duo").addObject("dList2", dList);
	}

	@PostMapping("/duo_write_ajax")
	public ModelAndView write(Duo_dto duo) {
		System.out.println("controller_write: " + duo.toString());
		boolean result = dse.duoWrite(duo);
		if (result) {
			return new ModelAndView("redirect:/personlol/duo/");
		} else {
			return new ModelAndView("redirect:/personlol/duo/duo_write_ajax");
		}
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(Integer duo_id, RedirectAttributes attr) {
		boolean result=false;
		System.out.println("controller_Delete="+duo_id);
		dse.duoDelete(duo_id);
		
		if(result) {
			attr.addFlashAttribute("duo_id",duo_id);
			return new ModelAndView("redirect:/duo/");
		}else {
			return new ModelAndView("redirect:/duo/");
		}
	}


	@PostMapping("/duo_update_ajax")
	public ModelAndView update(Duo_dto duo) {
		System.out.println("controller_update: " + duo.toString());
		boolean result = dse.duoUpdate(duo);
		if (result) {
			return new ModelAndView("redirect:/personlol/duo/");
		} else {
			return new ModelAndView("redirect:/personlol/duo/duo_delete_ajax");
		}
	}

	

}
