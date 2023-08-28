package com.spring.controller.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpringController {	
	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping("views/main.spring")
	public String main() {
		// logger.info("views/main.spring", locale);
		return "main";
	}	
}