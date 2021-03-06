package com.itbank.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.model.NoticeDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.model.StoreInfoDTO;
import com.itbank.promotion.PromDTO;
import com.itbank.service.BoardService;
import com.itbank.service.MenuService;
import com.itbank.service.NoticeService;
import com.itbank.service.OrderService;
import com.itbank.service.StoreService;

@RestController
public class AjaxController {

	@Autowired private MenuService ms;
	
	
	@Autowired private OrderService os;
	@Autowired private NoticeService ns;
	@Autowired private BoardService bs;
	
	@Autowired private Paging paging;
	
	
	// 프로모션
	@GetMapping("/ajaxPromotion")
	public List<PromDTO> promList(){
		System.out.println(ms.getList());
		// [com.itbank.promotion.PromDTO@51e38ef6, 
		// com.itbank.promotion.PromDTO@30e45c75, 
		// com.itbank.promotion.PromDTO@3d7959cf, 
		// com.itbank.promotion.PromDTO@7f529623, 
		// com.itbank.promotion.PromDTO@328b2301, 
		// com.itbank.promotion.PromDTO@209ec6d1, 
		// com.itbank.promotion.PromDTO@575e442c, 
		// com.itbank.promotion.PromDTO@3cd6336a, 
		//com.itbank.promotion.PromDTO@57ae9cda]
		return ms.getList();
	}
	
	@PostMapping("/payment")
	public int payment(@RequestBody HashMap<String, String> map) {
		if(os.payment(map) == 1) {
			System.out.println("들어감");
			return 1;
		}
		else return 2;
	}
	
	// newsDetail 
	@GetMapping("/btnNewsDetail/{num}")
	public NoticeDTO nextNews(@PathVariable int num) {
		System.out.println("여기는오니?");
		NoticeDTO dto = ns.getNotice(num);
		System.out.println("여기가널이니? " + dto.getReqDate());
		Date d1 = new Date(dto.getReqDate().getTime());
		System.out.println(d1);
		dto.setReqDate(d1);
		System.out.println(dto.getReqDate());
		return dto; 
	}
	
	// qna idx로 댓글 가져오기
	@GetMapping("/qnaReply/{idx}")
	public HashMap<String, Object> qnaReply(@PathVariable int idx){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ReplyDTO dto = bs.getReply(idx);
		
		if(dto != null) {
			map.put("dto", dto);
		}
		else {
			map.put("msg", "댓글 작성 전 입니다");
		}
		
		return map;
	}
	
	
	
	
	// 예외처리
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView exHam(NullPointerException e) {
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "등록되지 않은 이메일입니다, 확인해주세요");
		System.out.println("등록되지 않은 이메일입니다, 확인해주세요");
		return mav;
	}
	
	
}
