package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface BurgerDAO {

	@Select("select * from ${ table }")
	List<HashMap<String, Object>> list(String table);

	@Select("select * from burger_table")
	List<HashMap<String, Object>> getList();

//	@Select("select count(*) count from ${ table }_table")
//	int countList(String table);

	@Select("select burger_table_description, burger_background from menutop_table")
	List<HashMap<String, Object>> getBack(String table);

}
