package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.SearchService;
import com.itbank.service.ViewSearchService;

@Controller
public class SearchController {

	@Autowired private SearchService ss;
	@Autowired private ViewSearchService vss;

	@GetMapping("/search")
	public ModelAndView search(@RequestParam String search, @RequestParam String type) {
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		
		
		map.put("search", search);
		map.put("type", type);
		
		String type1 = type.toUpperCase();
		
		System.out.println(type1);
		
		String name = type.toUpperCase();
		
		System.out.println(name);
		
		if(type.equals("mccafe") || type.equals("drink") || type.equals("side")) {
			list = vss.viewsearchList(map);
		}
		else {
			list = ss.searchList(map);
		}
	
		mav.addObject("list", list);
		mav.addObject("type", type1);
		mav.addObject("name", name);
		return mav;
	}
}
