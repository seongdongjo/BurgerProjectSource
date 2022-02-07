package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired private MenuService ms;
	
	@GetMapping("/list/{table}")
	public ModelAndView list(@PathVariable String table) {
		ModelAndView mav = new ModelAndView("/menu/list");

		int cnt = ms.countList(table);
						
		System.out.println(table);
		
		mav.addObject("cnt", cnt);
		mav.addObject("table", table);
//		mav.addObject("table", table.toUpperCase() + "_TABLE");
		
	
		return mav;
	}
	
	@PostMapping("/detail")
	public ModelAndView detail(String table, int seq) {
		ModelAndView mav = new ModelAndView("/menu/detail");
		List<HashMap<String, Object>> tList = ms.getTopList(table.toUpperCase()+"_TABLE");
		mav.addObject("tList",tList);
		mav.addObject("table",table);
		mav.addObject("sequence",seq);
		return mav;
	}
}
