package com.itbank.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class LoginController {

	@Autowired private MemberService ms;
	@Autowired private Hash	hash;
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response, String url) {
		ModelAndView mav = new ModelAndView();
		
		String auto = request.getParameter("auto");
		System.out.println("auto :" + auto);
		
		if(auto != null) {
			Cookie autoLogin = new Cookie("JSESSIONID", session.getId());
			autoLogin.setMaxAge(7200);
			autoLogin.setPath("/burger2-4");
			response.addCookie(autoLogin);
		}
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
		
		if(login == null) {
			mav.setViewName("alert");
			mav.addObject("url", "login");
			mav.addObject("msg", "로그인에 실패하였습니다");
		}
		else {
			if(url == null) {
				mav.setViewName("redirect:/");
			}
			else {
				mav.setViewName("redirect:" + url);
			}
		}
		return mav;
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		return "findId";
	}
	
	
	// 비밀번호 찾기
	@GetMapping("/findPw")
	public String findPw() {
		return "findPw";
	}
	
	@GetMapping("/update")
	public ModelAndView update(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		
		System.out.println(member.getUserpw());
		String pw = member.getUserpw().substring(0, 8);
		
		member.setUserpw(pw);
		
		mav.addObject("member", member);
		return mav;
	}
	
	
	@PostMapping("/update")
	public ModelAndView update(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("update");
		
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		
		int row = ms.update(dto);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "수정성공");
			mav.addObject("url", "myPage");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "수정실패");
			mav.addObject("url", "update/{userid}");
		}
		System.out.println(row==1?"success":"fail");
		return mav;	//추가되고 나서 목록에서 확인 할 수 있도록
	}
	

		
		
}
