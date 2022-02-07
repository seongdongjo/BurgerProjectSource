package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeDAO {

	@Select("select * from notice_table "
			+ "where flag = 'bottom' "
			+ "order by notice_seq desc "
			+ "offset ${ offset } rows "
			+ "fetch first 5 rows only")
	List<HashMap<String, Object>> selectNotice(int offset);

	@Select("select * from notice_table where notice_seq = #{ seq }")
	NoticeDTO selectNews(int seq);

	@Select("select * from notice_table where notice_seq = #{ num }")
	NoticeDTO nextNotice(int num);

//	@Update
//	int cntUpdate(int seq);

	@Update("update notice_table set cnt = #{cnt} + 1 where notice_seq = #{ seq }")
	int cntUpdate(HashMap<String, Object> map);

	
	@Insert("insert into notice_table (title, writer, content, fileName, cnt, flag) values ("
			+ "#{title},"
			+ "#{writer},"
			+ "#{content},"
			+ "#{fileName},"
			+ "#{cnt},"
			+ "#{flag})")
	int insert(NoticeDTO dto);
	
	@Update("update notice_table set "
			+ "title = #{title},"
			+ "content = #{content},"
			+ "fileName = #{fileName},"
			+ "flag = #{flag}"
			+ "where notice_seq = #{notice_seq}")
	int update(NoticeDTO dto);

	@Select("select count(*) count from notice_table where flag = 'bottom'")
	int getTotal();

	
	List<HashMap<String, Object>> searchList(HashMap<String, Object> map);
//
//	@Select("select count(*) count from notice_table "
//			+ "where flag = 'bottom' "
//			+ "and content like '%${ search }%' "
//			+ "order by notice_seq desc")
	int searchTotal(String search);

	@Select("select * from notice_table where flag = 'top' and withdrawal = 'n' order by notice_seq desc")
	List<HashMap<String, Object>> selectNoticeTop();


	@Update("update notice_table set withdrawal = 'y' where notice_seq = #{seq}")
	int deleteNews(int seq);
	
	@Select("select * from notice_table where notice_seq = ${seq}")
	NoticeDTO selectNews2(int seq);

	
//	@Select("select * from notice_table where flag = 'bottom' and content like '%#{search}%'")
//	List<NoticeDTO> searchList(String search);
}
