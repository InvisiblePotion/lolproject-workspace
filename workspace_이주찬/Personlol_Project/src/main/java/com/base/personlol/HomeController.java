package com.base.personlol;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.service.test2MM;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	//여기부터는 연습이야
	
//	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	@GetMapping("/test2")
	public ModelAndView test2(test2MM test2MM) {
		int a = 1;
		int b = 2;
		int c = a + b;
		System.out.println("컨트롤러 test2MM"+ test2MM);
		String d = test2MM.test_obj();
		System.out.println("컨트롤러 d ="+d);
		return new ModelAndView("test2").addObject("test_int",d);
	}
	
	
	@GetMapping("/test3")
	public ModelAndView test3() {
		return new ModelAndView("test3");
	}
	
}


