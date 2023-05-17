package com.base.personlol.controller;

<<<<<<< HEAD
=======
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< HEAD
=======
import com.base.personlol.service.rank_service;
import com.base.personlol.service.user_service;

>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd
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
<<<<<<< HEAD
=======
	
>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd
}
