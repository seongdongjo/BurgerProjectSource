package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.SearchDAO;
import com.itbank.model.ViewSearchDAO;

@Service
public class ViewSearchService {
	@Autowired private ViewSearchDAO vsdao;
	public List<HashMap<String, String>> viewsearchList(HashMap<String, String> map) {
			return vsdao.viewsearch(map);
	}

}
