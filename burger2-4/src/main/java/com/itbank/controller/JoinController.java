package com.itbank.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class JoinController {

	@Autowired private MemberService ms;
	@Autowired private Hash hash;
	
	@GetMapping("/join")
	public ModelAndView step0(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView("join/step0");
		
		String path = request.getSession().getServletContext().getRealPath("resources/agreement.txt");
	
		String agreement = ms.getAgreement(path);
		mav.addObject("agreement", agreement);
		
		return mav;
	}
	
	@GetMapping("/join/step1")
	public ModelAndView step1(String agree, @RequestHeader("referer") String referer) {
		ModelAndView mav = new ModelAndView("join/step1");
		
		if(agree == null) {
			mav.setViewName("alert");
			mav.addObject("msg", "약관에 동의하셔야 가입이 가능합니다");
			mav.addObject("url", "join");
		}
		
		return mav;
	}
	
	@GetMapping("/join/step2")
	public ModelAndView step2() {
		ModelAndView mav = new ModelAndView("join/step2");
		return mav;
	}
	
	@PostMapping("/join/step2")
	public ModelAndView step2(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("join/step2");
		
		String hashpw = hash.getHash(dto.getUserpw());
		dto.setUserpw(hashpw);
		
		int row = ms.join(dto);
		if(row == 1) {
			System.out.println("가입 성공");
			mav.setViewName("alert");
			mav.addObject("msg", "가입 성공");
			mav.addObject("url", "login");
		
		}
		else {
			System.out.println("가입 실패");
			mav.setViewName("alert");
			mav.addObject("msg", "회원가입에 실패하였습니다!!");
		}
		return mav;
	}
	
	@GetMapping("/join/nonmemberJoin")
	public ModelAndView nonmemberJoin() {
		ModelAndView mav = new ModelAndView("join/nonmemberJoin");
		return mav;
	}
	
	@PostMapping("/join/nonmemberJoin")
	public ModelAndView nonmemberJoin(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("join/nonmemberJoin");
		
		String hashpw = hash.getHash(dto.getUserpw());

		Random ran = new Random();
		String nonmemberId = "";
		for(int i = 0; i < 6; i++) {
			nonmemberId += ran.nextInt(9);
		}
		
		System.out.println("비회원 ID : " + nonmemberId);
		System.out.println("주소 : " + dto.getAddress());
		System.out.println("이메일 : " + dto.getEmail());
		System.out.println("전화번호 : " + dto.getPhone());
		System.out.println("이메일인증 : " + dto.getEmailAuth());
		
		dto.setUserid(nonmemberId);
		dto.setUserpw(hashpw);
		
		int row = ms.join(dto);
		if(row == 1) {
			System.out.println("비회원 가입 성공");
			mav.setViewName("alert");
			mav.addObject("msg", "ID : " + dto.getUserid() + "입니다");
			mav.addObject("url", "order");
		}
		else {
			System.out.println("비회원 가입 실패");
			mav.setViewName("alert");
			mav.addObject("msg", "비회원 가입에 실패하였습니다!!");
		}
		return mav;
	}
	
	
	@GetMapping("/join/adminJoin")
	public ModelAndView adminJoin() {
		ModelAndView mav = new ModelAndView("join/adminJoin");
		return mav;
	}
	
	@PostMapping("/join/adminJoin")
	public ModelAndView adminJoin(AdminDTO dto) {
		ModelAndView mav = new ModelAndView("join/adminJoin");
		
		String hashpw = hash.getHash(dto.getAdminpw());
		dto.setAdminpw(hashpw);
		
		int row = ms.joinAdmin(dto);
		
		if(row == 1) {
			System.out.println("가입 성공");
			mav.setViewName("alert");
			mav.addObject("msg", "가입 성공");
			mav.addObject("url", "admin/loginAdmin");
		}
		
		else {
			System.out.println("가입 실패");
			mav.setViewName("alert");
			mav.addObject("msg", "회원가입에 실패하였습니다!!");
		}
		return mav;
	}
	
}
