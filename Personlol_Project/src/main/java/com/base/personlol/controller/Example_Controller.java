package com.base.personlol.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.personlol.dto.Example_dto;
import com.base.personlol.dto.test2Dto;
import com.base.personlol.service.Example_service;
import com.base.personlol.service.test2MM;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/example")

public class Example_Controller {
	
	@Autowired
	Example_service ex_ser;
	
	@Autowired
	test2MM test2MM;
	
	
	@GetMapping("/")
	public String example() {
		return "example";
	}
	
	@GetMapping("/ws")
	public String websocket() {
		return "websocket";
	}
	
	@GetMapping(value="/test-ajax", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Example_dto testAjax(@RequestParam Map<String, Integer> nums) {
		System.out.println("컨트롤러 ajox 데이터 넘오는 거:"+nums);
		return ex_ser.testDB(nums);
	}
	
	@GetMapping("/sum_num")
	public @ResponseBody test2Dto sum(@RequestParam Map<String,Integer> nums1) {
		System.out.println("깐트롤라 ajox2:" + nums1);
		return test2MM.testSum(nums1);
	}
	
	@PostMapping("/join")
	public @ResponseBody Integer join(@RequestParam Map<String, Integer> join) {
		System.out.println("join이다"+ join);
		Integer join1 = test2MM.join(join);
		return join1;
	}
	
	

}
