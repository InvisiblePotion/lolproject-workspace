package com.base.personlol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.base.personlol.service.rank_service;
import com.base.personlol.service.user_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/rank")
public class rank_Controller {
	
	//기본
	@GetMapping("")
	public String rank() {
		return "rank";
	}
	
}
