package com.base.personlol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/champion")
public class champion_Controller {

	@GetMapping("/")
	public String champlist() {
		return "champList";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "detail";
	}
	
	
	
}//
