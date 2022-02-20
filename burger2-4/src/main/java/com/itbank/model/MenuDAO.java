package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuDAO {

	@Select("select * from ${table}_table order by ${ table }_seq")
	List<HashMap<String, Object>> selectMenuList(String table);
	
	@Select("select ${table}_description, ${table}_background from menutop_table")
	List<HashMap<String, Object>> selectTopList(String table);
	//[{SIDE_TABLE_BACKGROUND=https://www.mcdonalds.co.kr/uploadFolder/images/menu/bg_visual_menu04.jpg, SIDE_TABLE_DESCRIPTION=가볍게 즐겨도, 버거와 함께 푸짐하게 즐겨도,<br> 언제나 맛있는 사이드와 디저트 메뉴!}]
	
	@Select("select count(*) count from ${ table }_table")
	int countList(String table);

	@Select("select * from ${table}TABLE where ${table}SEQ = ${seq}") //table에는 BURGER_ 넘어온다
	List<HashMap<String, Object>> selectDtailList(HashMap<String, Object> map);

	
	@Select("select * from ${ table }_table where ${ table }_seq = ${ seq }")
	List<HashMap<String, Object>> menuDetail(HashMap<String, Object> map);



}
