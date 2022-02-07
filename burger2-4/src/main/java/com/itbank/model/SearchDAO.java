package com.itbank.model;

import java.util.HashMap;
import java.util.List;

public interface SearchDAO {
	
//	@Select("select * from burger_table where burger_name like '%#{ search }%'")
//	List<HashMap<String, String>> search(String search);

	List<HashMap<String, String>> search(HashMap<String, String> map);

}
