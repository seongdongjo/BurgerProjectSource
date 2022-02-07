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

	@Select("select count(*) count from ${ table }_table")
	int countList(String table);

	@Select("select * from ${table}TABLE where ${table}SEQ = ${seq}")
	List<HashMap<String, Object>> selectDtailList(HashMap<String, Object> map);

	
	@Select("select * from ${ table }_table where ${ table }_seq = ${ seq }")
	List<HashMap<String, Object>> menuDetail(HashMap<String, Object> map);



}
