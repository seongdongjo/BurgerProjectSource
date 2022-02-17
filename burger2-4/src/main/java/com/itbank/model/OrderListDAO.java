package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListDAO {

//	@Select("select * from orderlist_table where "
//			+ "orderdate=(select max(orderdate) from orderlist_table) "
//			+ "and userid = #{ userid }")
	
	@Select("select * from orderlist_table "
			+ "where "
			+ "to_char(orderdate, 'yyyymmdd hh24:mi:ss') > to_char(sysdate -5/24/60/60, 'yyyymmdd hh24:mi:ss') "
			+ "and userid = #{ userid }")
	OrderListDTO seletOrderList(String userid);

	@Insert("insert into orderlist_table (menus, price, paystatus, orderstatus, total, count,userid,orderaddress,phone) "
			+ "values(#{menus}, #{price}, #{paystatus}, #{orderstatus}, #{total}, #{count},#{userid},#{orderaddress},#{phone})")
	int payment(HashMap<String, String> map);

	@Select("select * from orderlist_table "
			+ "where userid = #{ userid } "
			+ "order by order_seq desc "
			+ "offset ${ offset } rows "
			+ "fetch first 5 rows only")
	List<OrderListDTO> selectList(HashMap<String, Object> map);

	@Select("select count(*) from orderlist_table where userid = #{ userid }")
	int orderCount(String userid);

}
