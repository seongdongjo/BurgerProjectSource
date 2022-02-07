package com.itbank.member;

import java.util.HashMap;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Select("select * from user_table where userid = #{ userid } and userpw = #{ userpw } and withdrawal = 'n'")
	MemberDTO login(MemberDTO dto);

	@Select("select * from user_table where userid = #{ userid }")
	MemberDTO selectMember(String userid);

	@Select("select * from user_table where email = #{ email}")
	MemberDTO selectMemberFindId(String email);
	
	int join(MemberDTO dto);

	@Update("update user_table set  "
			+ "userpw=#{userpw},"
			+ "username=#{username},"
			+ "gender=#{gender},"
			+ "phone=#{phone},"
			+ "email=#{email},"
			+ "address=#{address}"
			+ "where userid = #{ userid }")
	int update(MemberDTO dto);

	@Select("select * from user_table where userpw = #{pw1}")
	MemberDTO chkPw(String pw1);


	@Update("update user_table set userpw = #{ userpw } where email = #{ email }")
	int updateFindPw(HashMap<String, String> map);

	@Select("select * from user_table where email = #{ email}")
	MemberDTO mailChk(String email);
	
	// 회원 탈퇴
//	@Update("update user_table set  "
//			+ "withdrawal='y'"
//			+ "where userpw = #{ userpw }")
	
	@Update("update user_table set email = #{ email }||'#', withdrawal = 'y' where userpw = #{ pw }")
	int deleteMember(HashMap<String, Object> map);
	
	@Select("select * from user_table where phone = #{phone}")
	MemberDTO phoneChk(String phone);
	
	@Select("select * from user_table where email = #{email}")
	MemberDTO findByEmail(String email);
}
