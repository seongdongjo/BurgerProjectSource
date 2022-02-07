package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.Paging;
import com.itbank.model.StoreInfoDTO;
import com.itbank.service.StoreService;

@RestController
public class AjaxStoreController {

	@Autowired private StoreService ss;
	@Autowired private Paging paging;

	// 지점 정보 검색 결과
	@GetMapping("/ajaxStoreInfo/{info}")
	public List<StoreInfoDTO> storeinfo(@PathVariable String info) {
		return ss.getStore(info);
	}

	// store-cate
	@PostMapping("/storeCate")
	public HashMap<String, Object> storeCate(@RequestBody HashMap<String, Object> map1) {
		System.out.println(map1);
		
		Object cate = map1.get("cate");
		String cate1 = (String) cate;

		Object page1 = map1.get("page");

		List<HashMap<String, Object>> list = ss.selectCate(map1);

		int page = (int)page1;

		int total = ss.selectCount(cate1);

		int pageCount = (total / 5);

		pageCount = total % 5 == 0 ? pageCount : pageCount + 1;

		int section = paging.section(page);

		int begin = paging.begin(section);

		int end = paging.end(pageCount);

		boolean prev = paging.prev(section);

		boolean next = paging.next(pageCount, end);


		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("total", total);
		map.put("pageCount", pageCount);
		map.put("section", section);
		map.put("begin", begin);
		map.put("end", end);
		map.put("prev", prev);
		map.put("next", next);
		map.put("cate", cate1);

		return map;
	}
}
