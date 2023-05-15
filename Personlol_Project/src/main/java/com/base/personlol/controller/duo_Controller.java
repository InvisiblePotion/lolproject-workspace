package com.base.personlol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/duo")
public class duo_Controller {
	
	//듀오페이지
	@GetMapping("/")
	public String duo() {
		return "duo";
	}

}
