package com.base.personlol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/summonerstat")
public class summonerstat_Controller {
	@GetMapping("/")
	public String summonerstat() {
		return "summonerstat";
	}
}
