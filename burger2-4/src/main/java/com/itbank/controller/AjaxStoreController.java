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
	public HashMap<String, Object> storeCate(@RequestBody HashMap<String, Object> map1) { //넘겨받은 ob객체
		System.out.println(map1);
		
		Object cate = map1.get("cate");
		String cate1 = (String) cate; //내가클릭한 24시간, 주차가능, 맥드라이브 등등

		Object page1 = map1.get("page");

		List<HashMap<String, Object>> list = ss.selectCate(map1);
		System.out.println(list);
		int page = (int)page1;

		int total = ss.selectCount(cate1); //해당하는 카테고리가 y인 데이터의 개수

		int pageCount = (total / 5); //예를들어 총 16개면 4페이지가 나온다(아래삼항연산자로)

		pageCount = total % 5 == 0 ? pageCount : pageCount + 1;

		int section = paging.section(page); //page가 1일때는 section = ( page - 1 ) / 5; 로 인해서 section은 0이다

		int begin = paging.begin(section); //begin = (section * 5) + 1;  section이 늘어남에따라 begin은 5씩늘어난다

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
