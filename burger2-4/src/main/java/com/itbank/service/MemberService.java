package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.admin.AdminDAO;
import com.itbank.admin.AdminDTO;
import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO dao;
	@Autowired private AdminDAO admindao;

	
	public String getAgreement(String path) throws IOException {
		String agreement = "";
		File f = new File(path);
		
		if(f.exists() == false) {
			System.out.println("파일이 없습니다");
			return null;
		}
		Scanner sc = new Scanner(f);
		
		while(sc.hasNextLine()) {
			agreement += sc.nextLine() + "\n";
		}
		sc.close();
		return agreement;
	}

	// 로그인
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.login(dto);
		return login;
	}

	// 관리자 로그인
	public AdminDTO loginAdmin(AdminDTO dto) {
		AdminDTO login = admindao.loginAdmin(dto);
		return login;
	}	
	
	// 관리자 id확인
		public AdminDTO idChkAdmin(String userid) {
			return admindao.getMember(userid);
		}	
	
	// 회원가입
	public int join(MemberDTO dto) {
		int row = dao.join(dto);
		return row;
	}

	// id확인
	public MemberDTO getMember(String userid) {
		
		return dao.selectMember(userid);
	}
	
	// id찾기
	public MemberDTO getMemberFindId(String email) {
		return dao.selectMemberFindId(email);
	}
	
	// 비밀번호찾기
	public int updateFindPw(HashMap<String, String> map) {
		return dao.updateFindPw(map);
	}
	
	// 회원정보수정
	public int update(MemberDTO dto) {
		return dao.update(dto);
	}

	// 회원정보 불러오기
	public MemberDTO updatePage(String userid) {
		return dao.selectMember(userid);
	}

	// 비밀번호 일치확인
	public MemberDTO chkMember(String pw1) {
		return dao.chkPw(pw1);
	}

	// 이메일 확인하기
	public MemberDTO mailChk(String email) {
		return dao.mailChk(email);
	}

	// 회원탈퇴
		public int deleteMember(HashMap<String, Object> map) {
			return dao.deleteMember(map);
	}
		
	// 전화번호 중복확인
	public MemberDTO getMemberByPhone(String phone) {
		return dao.phoneChk(phone);
	}

	public MemberDTO findByEmail(String email) {
		return dao.findByEmail(email);
	}

	public int joinAdmin(AdminDTO dto) {
		return admindao.joinAdmin(dto);
	}	
}
