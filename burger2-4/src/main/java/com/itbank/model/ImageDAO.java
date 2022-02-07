package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ImageDAO {

	@Select("select * from mcmorning_table")
	List<McMorningDTO> getmacList();

	@Select("select * from burger_table")
	List<BurgerDTO> getburgerList();
	
	@Select("select * from side_table")
	List<SideDTO> getsideList();

	@Select("select * from drink_table")
	List<DrinkDTO> getdrinkList();

	@Select("select * from dessert_table")
	List<DessertDTO> getdessertList();

	@Select("select * from mccafe_table")
	List<McafeDTO> getmcafeList();
}
