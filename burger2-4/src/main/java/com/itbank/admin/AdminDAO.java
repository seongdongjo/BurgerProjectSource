package com.itbank.admin;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDAO {

	@Select("select * from admin_table where adminid = #{adminid} and adminpw = #{adminpw}")
	AdminDTO loginAdmin(AdminDTO dto);
	
	@Insert("insert into admin_table (admin_seq, adminid, adminpw, adminname, admingrade) values (admin_seq.nextval, #{ adminid }, #{ adminpw }, #{ adminname }, '관리자')")
	int joinAdmin(AdminDTO dto);

	@Select("select * from admin_table where adminid = #{adminid}")
	AdminDTO getMember(String userid);
}
