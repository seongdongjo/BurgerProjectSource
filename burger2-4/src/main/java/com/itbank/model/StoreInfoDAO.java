package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface StoreInfoDAO {

	List<StoreInfoDTO> selectStore(String info);

	@Select("select* from storeinfo_table "
			+ "where ${ cate } = 'y' "
			+ "order by store_seq "
			+ "offset ${ offset } rows "
			+ "fetch first 5 rows only")
	List<HashMap<String, Object>> selectCate(HashMap<String, Object> map1);

	@Select("select count(*) count from storeinfo_table where ${ cate1 } = 'y'")
	int selectCount(String cate1);

}
