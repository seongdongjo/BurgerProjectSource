package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.BurgerDTO;
import com.itbank.model.DessertDTO;
import com.itbank.model.DrinkDTO;
import com.itbank.model.McMorningDTO;
import com.itbank.model.McafeDTO;
import com.itbank.model.SideDTO;
import com.itbank.service.ImageService;
import com.itbank.service.MenuService;

@RestController
public class AjaxMenuController {

	@Autowired private ImageService is;
	@Autowired private MenuService ms;

	// 메뉴
	@GetMapping("/ajaxMenu/{table}")
	public HashMap<String, Object> getMenuList(@PathVariable String table) {
		HashMap<String, Object> list = new HashMap<String, Object>();
		String tTable = (table.toUpperCase() + "_TABLE");
		List<HashMap<String, Object>> tlist = ms.getTopList(tTable);

		List<HashMap<String, Object>> mlist = ms.getMenuList(table);

		System.out.println(tlist);
		list.put("tlist", tlist);
		list.put("mlist", mlist);
		return list;
	}

	@GetMapping("/ajaxMenu/{table}/{seq}")
	public List<HashMap<String, Object>> getDetailList(@PathVariable String table, @PathVariable int seq) {
		return ms.getDetailList(table.toUpperCase() + "_", seq);
	}

	@GetMapping("/mac")
	public List<McMorningDTO> mac() {
		return is.getmacList();
	}

	@GetMapping("/macSet")
	public List<McMorningDTO> macSet() {
		return is.getmacSetList();
	}

	@GetMapping("/burger")
	public List<BurgerDTO> burger() {
		return is.getburgerList();
	}

	@GetMapping("/burgerSet")
	public List<BurgerDTO> burgerSet() {
		return is.getburgerSetList();
	}

	@GetMapping("/side")
	public List<SideDTO> side() {
		return is.getsideList();
	}

	@GetMapping("/drink")
	public List<DrinkDTO> drink() {
		return is.getdrinkList();
	}

	@GetMapping("/dessert")
	public List<DessertDTO> dessert() {
		return is.getdessertList();
	}

	@GetMapping("/mcafe")
	public List<McafeDTO> mcafe() {
		return is.getmcafeList();
	}
	
	@PostMapping("/menuDetail")
	public List<HashMap<String, Object>> menuDetail(@RequestBody HashMap<String, Object> map){
		
		List<HashMap<String, Object>> list = ms.menuDetail(map);
		
		System.out.println(list);
		
		return list;
	}
}
