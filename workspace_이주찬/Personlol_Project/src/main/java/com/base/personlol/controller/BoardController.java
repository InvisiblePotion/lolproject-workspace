package com.base.personlol.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		return "Board";
	}
	
}