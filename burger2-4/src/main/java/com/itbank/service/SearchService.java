package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.SearchDAO;

@Service
public class SearchService {

	@Autowired private SearchDAO dao;

	//map에는 type,search가 들어가있다. type에는 버거,맥모닝,사이드,디저트 등의 값이 , search애는 입력한 메뉴이름이 들어있다
	public List<HashMap<String, String>> searchList(HashMap<String, String> map) {
		return dao.search(map);
	}

}
