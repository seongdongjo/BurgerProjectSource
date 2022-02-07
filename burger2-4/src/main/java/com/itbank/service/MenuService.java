package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BurgerDAO;
import com.itbank.model.MenuDAO;
import com.itbank.promotion.PromDAO;
import com.itbank.promotion.PromDTO;

@Service
public class MenuService {

	@Autowired private PromDAO pdao;
	@Autowired private BurgerDAO bgdao;
	@Autowired private MenuDAO mdao;

	
	
	public List<PromDTO> getList() {
		return pdao.list();
	}

	public List<HashMap<String, Object>> getburgerList(String table) {
		return bgdao.list(table);
	}

	public List<HashMap<String, Object>> burList() {
		return bgdao.getList();
	}

	public int countList(String table) {
		return mdao.countList(table);
	}

	public List<HashMap<String, Object>> getBackList(String table) {
		return bgdao.getBack(table);
	}

	// 혜린 추가
	public List<HashMap<String, Object>> getMenuList(String table) {
		return mdao.selectMenuList(table);
	}

	public List<HashMap<String, Object>> getTopList(String table) {
		return mdao.selectTopList(table);
	}
	
	public List<HashMap<String, Object>> getDetailList(String table, int seq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("table", table);
		map.put("seq",seq);
		return mdao.selectDtailList(map);
	}

	
	// 메뉴 디테일 버튼
	public List<HashMap<String, Object>> menuDetail(HashMap<String, Object> map) {
		return mdao.menuDetail(map);
	}



}
