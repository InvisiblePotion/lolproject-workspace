package com.base.personlol.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.personlol.dto.Example_dto;
import com.base.personlol.service.Example_service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/example")
public class Example_Controller {
	
	@Autowired
	Example_service ex_ser;
	
	@GetMapping("/")
	public String example() {
		return "example";
	}
	
	@GetMapping(value="/test-ajax", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Example_dto testAjax(@RequestParam Map<String, Integer> nums) {
		return ex_ser.testDB(nums);
	}
	
}
