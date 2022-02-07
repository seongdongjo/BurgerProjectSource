package com.itbank.promotion;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface PromDAO {

	@Select("select * from promotion_table order by promotion_seq")
	List<PromDTO> list();

}
