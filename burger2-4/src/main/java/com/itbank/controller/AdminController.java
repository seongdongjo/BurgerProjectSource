package com.itbank.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.component.Hash;
import com.itbank.component.Paging;
import com.itbank.model.QnaBoardDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.service.BoardService;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired private BoardService bs;
	@Autowired private Paging paging;
	@Autowired private MemberService ms;
	@Autowired private Hash	hash;

	// admin 댓글 체크 페이지
	// 2022-01-25
	@GetMapping("/qnaCheck")
	public ModelAndView qnaCheck(@RequestParam int page) {
		ModelAndView mav = new ModelAndView();
			
		if(page == 0) {
			page = 1;
		}
		System.out.println(page);
		int offset = (page-1) * 5;
		
		List<QnaBoardDTO> list = bs.qnaCheck(offset);
			
		System.out.println(list);
		
		int total = bs.qnaCheckCnt();
		
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
		System.out.println("end :  " + end);
		System.out.println("total :" + total);
		System.out.println("prev : " + prev);
		System.out.println("next : " + next);
		System.out.println(list);
		
		mav.addObject("pageCount", pageCount);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("total", total);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		
		mav.addObject("list", list);
			
		return mav;
	}
	
	@PostMapping("/qnaCheck")
	public ModelAndView qnaCheck(ReplyDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int row = bs.replyInsert(dto);
		
		int seq = dto.getBoard_idx();
		
		System.out.println(row);
		
		if(row == 1) {
			int update = bs.qnaResult(seq);
//			if(update == 1) {
//				
//			}
		}
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "작성 성공");
			mav.addObject("url", "admin/qnaCheck");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "수정실패");
			mav.addObject("url", "admin/qnaCheck");
		}
		return mav;
	}
	
	
	@GetMapping("/adminPage")
	   public ModelAndView adminPage() {
			ModelAndView mav = new ModelAndView();
			return mav;
	   }
	
	@GetMapping("/adminInfo")
	public ModelAndView adminInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		AdminDTO adminlogin = (AdminDTO)session.getAttribute("adminlogin");
		System.out.println(adminlogin);
		mav.addObject("adminlogin", adminlogin);
		
      return mav;
	}
	
	@GetMapping("/loginAdmin")
	public String loginAdmin() {
		return "admin/loginAdmin";
	}
	
	@PostMapping("/loginAdmin")
	public ModelAndView loginAdmin(AdminDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		String auto = request.getParameter("auto"); //자동로그인 체크했는가
		System.out.println("auto :" + auto);
		
		if(auto != null) {
			Cookie autoLoginAdmin = new Cookie("JSESSIONID", session.getId()); //쿠키생성
			autoLoginAdmin.setMaxAge(7200); //생성한 쿠키의 만료시간
			autoLoginAdmin.setPath("/burger2-4"); 
			response.addCookie(autoLoginAdmin); //웹브라우저에게 쿠키를 보냄.
		}
		dto.setAdminpw(hash.getHash(dto.getAdminpw())); //입력받은 패스워드를 해시처리하여 다시 dto에 저장
		 
		AdminDTO adminlogin = ms.loginAdmin(dto); //해시처리한 비밀번호와 디비에 있는 해시값과 비교
//		System.out.println(adminlogin.getAdminid());
		
		session.setAttribute("adminlogin", adminlogin);
		
		if(adminlogin != null) { //정상적으로 로그인되있는지
			mav.setViewName("admin/adminPage"); //관리자 페이지로
		}
		
		else {
			mav.setViewName("alert");
			mav.addObject("url", "admin/loginAdmin"); //다시 관리자 로그인으로
			mav.addObject("msg", "로그인에 실패하였습니다");
		}
		return mav;
	}
	
}
