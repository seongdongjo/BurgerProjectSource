package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.member.MemberDTO;
import com.itbank.model.NoticeDTO;
import com.itbank.model.QnaBoardDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.service.BoardService;
import com.itbank.service.FileService;
import com.itbank.service.MemberService;
import com.itbank.service.NoticeService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService bs;
	@Autowired private MemberService ms;
	@Autowired private FileService fs;
	@Autowired private NoticeService ns;
	@Autowired private Paging paging;
	
	
	@GetMapping("/news")  //페이징버튼을 클릭할떄마다 실행, 새로운소식들어갈때 실행
	public ModelAndView news(int page, @RequestParam(required = false) String search) {
		ModelAndView mav = new ModelAndView("board/news");
		

		if(page == 0) {
			page = 1;
		}

		int offset = (page-1) * 5;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search); //search는 string
		map.put("offset", offset); //offset은 int
		
		List<HashMap<String, Object>> list = ns.searchList(map); //search, offset을 가지고간다.(search는 null가능)
		List<HashMap<String, Object>> topList = ns.topList();
		
		int total = ns.searchTotal(search); //총 ?개의 게시글이 있습니다.
		
		int pageCount = (total / 5);
		pageCount = total % 5 == 0 ? pageCount : pageCount + 1 ;

		int section = paging.section(page);		
		int begin = paging.begin(section);
		int end = paging.end(pageCount);
		boolean prev = paging.prev(section);
		boolean next = paging.next(pageCount, end);
		

		
		System.out.println("pageCount : " + pageCount);
		System.out.println("section : " + section);
		System.out.println("begin : " + begin);
		System.out.println("end : " + end);
		System.out.println("total :" + total);
		System.out.println("prev : " + prev);
		System.out.println("next : " + next);
		System.out.println(list);
		System.out.println(topList);
		
		mav.addObject("pageCount", pageCount);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("total", total);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		mav.addObject("list", list);
		mav.addObject("topList", topList);
		return mav;
	}
	
	@PostMapping("/news") //검색할때 실행
	public ModelAndView news(@RequestParam String search, @RequestParam int page) {
		ModelAndView mav = new ModelAndView();
		
//		int page1 = Integer.parseInt(page);
		
		int total = ns.searchTotal(search);
		
		if(page == 0) {
			page = 1;
		}
		
		int offset = (page-1) / 5;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("offset", offset);
		
		List<HashMap<String, Object>> list = ns.searchList(map);
		
		int pageCount = (total / 5);
		pageCount = total % 5 == 0 ? pageCount : pageCount + 1 ;

		int section = paging.section(page);		
		int begin = paging.begin(section);
		int end = paging.end(pageCount);
		boolean prev = paging.prev(section);
		boolean next = paging.next(pageCount, end);
		
		
		System.out.println("total : " + total);
		System.out.println("list1 : " + list);
		System.out.println("search : " + search);
//		System.out.println("page : " + page);
		
		
		mav.addObject("list", list);
		mav.addObject("pageCount", pageCount);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("total", total);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	
	@GetMapping("/newsDetail/{seq}")
	public ModelAndView newsDetail(@PathVariable int seq) {
		ModelAndView mav = new ModelAndView("board/newsDetail");
		
		NoticeDTO dto = bs.getNews(seq);
		
		//조회수 증가를 위한 cntUpdate
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("cnt", dto.getCnt());
		
		int newCnt = bs.cntUpdate(map);
		
		NoticeDTO dto1 = bs.getNews(seq); //조회수 증가한 후 다시 dto가져오기
		
		mav.addObject("dto", dto1);
		
		return mav;
	}
	
	
	@GetMapping("/newsWrite")
	public ModelAndView newsWrite() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@PostMapping("/newsWrite")
	public ModelAndView newsWrite(NoticeDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("dto.getTitle : " + dto.getContent());
		System.out.println("dto.getDate : " + dto.getReqDate());
		
		System.out.println("dto.getUploadFile : " + dto.getUploadFile());
//		System.out.println(dto.getUploadFile().getOriginalFilename());
		
		int row = fs.upload(dto);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "작성 성공!!");
			mav.addObject("url", "board/news?page=1");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "작성 실패!!");
		}
		
		return mav;
	}
	
	@GetMapping("/question") //문의사항 클릭 시 
	public ModelAndView question(int page, @RequestParam(required = false) String result, HttpSession session, Integer mycheck) { //int에서 null체크할려면 Intger로 바꿔야됨
		int total=0;
		ModelAndView mav = new ModelAndView();
		MemberDTO dto =  (MemberDTO)session.getAttribute("login");
		HashMap<String, String> resultmap = new HashMap<String, String>();
		List<HashMap<String, Object>> qlist = new ArrayList<HashMap<String, Object>>();
		
		if(page == 0) {
			page = 1;
		}
		
		if(mycheck == null ) { //문의사항으로 들어오거나, 답변상태 옆에있는 검색을 클릭해서 들어올 때
			resultmap.put("result", result);
			total = bs.qnaCount(resultmap);
		}
		else {
			resultmap.put("userid", dto.getUserid());
			resultmap.put("result", result);
			total = bs.qnaCount(resultmap); //result가 null이든 아니든 iftest로 구분(xml에서)
		}
		
		int pageCount = (total / 10);
		pageCount = total % 10 == 0 ? pageCount : pageCount + 1 ;

		int offset = (page-1) * 10;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset); //int
		map.put("result", result); //string
		if(dto != null) {
			map.put("userid", dto.getUserid()); //String
		}
		
		if(mycheck == null) {
			qlist = bs.qnaList2(map);
		}
		else {
			qlist = bs.qnaList1(map);
		}
		int section = paging.section(page);		
		int begin = paging.begin(section);
		int end = paging.end(pageCount);
		boolean prev = paging.prev(section);
		boolean next = paging.next(pageCount, end);
		
		System.out.println("page : " + page);
		System.out.println("total : " + total);
		System.out.println("pageCount : " + pageCount);
		System.out.println("offset : " + offset);
		System.out.println("section : " + section);
		System.out.println("begin : " + begin);
		System.out.println("end : " + end);
		System.out.println("prev : " + prev);
		System.out.println("next : " + next);
		
		
	
		
		mav.addObject("list", qlist);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	// qnaDetail
	@GetMapping("/questionDetail/{seq}")
	public ModelAndView questionDetail(@PathVariable int seq) {
		ModelAndView mav = new ModelAndView("board/questionDetail");
		QnaBoardDTO que = bs.getQna(seq);
		
		ReplyDTO rep = bs.getReply(seq);
		
		mav.addObject("que", que);
		
		if(rep != null) {
			mav.addObject("rep", rep);	
		}
		else {
			mav.addObject("rep", "댓글 작성 전 입니다");
		}
		
		
		
		return mav;
	}
	
	
	// qnaWrite get
	@GetMapping("/qnaWrite")
	public ModelAndView qnaWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO dto =  (MemberDTO)session.getAttribute("login");
		mav.addObject("login", dto);
		
		return mav;
	}
	
	// 2022-01-24 추가
	
	@PostMapping("/qnaWrite")
	public ModelAndView qnaWrite(HttpServletRequest request, QnaBoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		// client ip 주소 넣어주기
		String ipAdd = request.getRemoteAddr();
		dto.setIpAddress(ipAdd);
		
		int row = bs.qnaInsert(dto);
		
		System.out.println(row);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "작성완료");
			mav.addObject("url", "question?page=1");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "작성실패");
			mav.addObject("url", "qnaWrite");
		}
		
		return mav;
	}
	
	// news 삭제
	@GetMapping("/newsDelete/{seq}")
	public ModelAndView newsDelete(@PathVariable int seq) {
		ModelAndView mav = new ModelAndView("alert");
		
		int row = ns.deleteNews(seq);
		System.out.println(row);
		
		if(row == 1) {
			mav.addObject("msg", seq + "번 게시글이 삭제되었습니다");
			mav.addObject("url", "board/news?page=1");
		}
		else {
			mav.addObject("msg", seq + "번  게시글 삭제에 실패하였습니다");
		}
		return mav;
	}
	
	// news 수정
	
	@GetMapping("/newsModify/{seq}")
	public ModelAndView newsModify(@PathVariable int seq) {
		ModelAndView mav = new ModelAndView("board/newsModify");
			
		NoticeDTO dto = bs.getNews(seq);
			
		mav.addObject("dto", dto);
			
		return mav;
	}
		
	@PostMapping("/newsModify/{seq}")
	public ModelAndView newsModify(NoticeDTO dto)  throws Exception {
		ModelAndView mav = new ModelAndView();
			
		int row = fs.uploadModify(dto);
			
		System.out.println("1) " + dto.getTitle());
		System.out.println("1) " + dto.getContent());
		System.out.println("1) " + dto.getFileName());
		System.out.println("1) " + dto.getFlag());
		System.out.println("1) " + dto.getNotice_seq());
			
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "게시글 수정을 성공하였습니다");
		}
			
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "게시글 수정에 실패하였습니다");
		}
		return mav;
	}
	
	
	
}