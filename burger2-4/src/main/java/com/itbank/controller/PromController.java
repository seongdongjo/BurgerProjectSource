package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PromController {

	@GetMapping("/promotion")
	public String promotion() {
		return "promotion";
	}
}
