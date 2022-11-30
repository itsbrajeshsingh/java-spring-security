package com.bks.spring.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	@GetMapping("/showMyLoginPage")
	public String MyLoginPage() {
		return "fancy-login";
	}
	
	@GetMapping("accessdenied")
	public String accessDenied() {
		return "access-denied";
	}
}
